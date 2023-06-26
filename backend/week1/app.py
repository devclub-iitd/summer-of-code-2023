'''from flask import Flask, redirect, url_for, render_template, request
from flask_sqlalchemy import SQLAlchemy
import string
import random
import requests

app= Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI']= 'sqlite:///urls.db'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS']=False

db=SQLAlchemy(app)

class Urls(db.Model):
    id_=db.Column("id_",db.Integer,primary_key=True)
    long=db.Column("long",db.String())
    short=db.Column("short",db.String(3))

    def __init__(self,long,short,count):
        self.long=long
        self.short=short


    
@app.before_request
def create_tables():
    if not app.config.get('TABLES_CREATED'):
        with app.app_context():
            db.create_all()
            app.config['TABLES_CREATED'] = True
def shorten_url():
    letter= string.ascii_lowercase + string.ascii_uppercase
    while True:
        randl=random.choices(letter,k=3)
        randl="".join(randl)
        short_url=Urls.query.filter_by(short=randl).first()
        if not short_url:
            return randl


@app.route('/',methods=['POST','GET'])
def home():
    if request.method=='POST':
        url_r= request.form["nm"]
        found_url= Urls.query.filter_by(long=url_r).first()
        if found_url:
            
            return redirect(url_for("display_short_url",url=found_url.short))
        else:
            srl=request.form['snm']
            if srl:
                new_url=Urls(url_r,srl)
                db.session.add(new_url)
                db.session.commit()
            else:
                short_url=shorten_url()
                new_url=Urls(url_r,short_url)
                db.session.add(new_url)
                db.session.commit()
            return redirect(url_for("display_short_url",url=new_url.short),code=201)
    else:
        return render_template('home.html')
@app.route('/display/<url>')
def display_short_url(url):
    return render_template('shorturl.html',short_url_display=url)
@app.route('/redirect/<short_url>')
def redirection(short_url):
    long_url=Urls.query.filter_by(short=short_url).first()
    if long_url:
        return redirect(long_url.long,code=302)
    else:
        return "Does NOT EXIST"
if __name__ == '__main__':
    app.run(port=5000, debug=True)'''

import sqlite3
from hashids import Hashids
from flask import Flask, render_template,request,flash,redirect,url_for
import socket
import requests

def get_db_connection():
    conn=sqlite3.connect('database.db')
    conn.row_factory= sqlite3.Row
    return conn
'''def get_ip_connection():
    conn2=sqlite3.connect('ipaddresses.db')
    conn2.row_factory=sqlite3.Row
    return conn2'''
'''def drop():
    conn=get_db_connection()
    conn.execute('DROP TABLE urls')
drop()'''


def create_table():
    c=get_db_connection()
    c.execute('''CREATE TABLE IF NOT EXISTS urls
                 (id INTEGER PRIMARY KEY AUTOINCREMENT,
                 original_url TEXT NOT NULL,
                 short_url TEXT NOT NULL,
                 clicks INTEGER DEFAULT 0)''')
    c.execute('''CREATE TABLE IF NOT EXISTS ips
              ( id INTEGER PRIMARY KEY AUTOINCREMENT,
              ip TEXT NOT NULL,
              status INTEGER NOT NULL DEFAULT 0)''')
    c.commit()
    c.close()

# Call the function to create the table
create_table()

app = Flask(__name__)
app.config['SECRET_KEY'] = 'this should be secret random string'
hashids = Hashids(min_length=4, salt=app.config['SECRET_KEY'])

'''conn1= get_db_connection()
conn1.execute('DELETE FROM urls',)
conn1.commit()
conn1.close()
conn1= get_db_connection()
conn1.execute('ALTER TABLE urls ADD COLUMN short_url varchar not null')
conn1.commit()
conn1.close()
conn1= get_db_connection()
conn1.execute('ALTER TABLE urls ADD COLUMN ip varchar not null')
conn1.commit()
conn1.close()'''

@app.route('/',methods=['POST','GET'])

    



def home():
    conn=get_db_connection()
    if request.method=='POST':
        url_r= request.form["nm"]
        sur= request.form['snm']
        if not url_r:
            flash('The url is required!')
            return redirect(url_for('home'))
        found_url = conn.execute('SELECT original_url FROM urls WHERE original_url = ?',(url_r,)).fetchone()
        if found_url:
            short_url1 = conn.execute('SELECT short_url FROM urls WHERE original_url = ? ',(found_url[0],)).fetchone()
            return render_template('home.html',short_url= short_url1[0])
        
            
        url_data = conn.execute('INSERT INTO urls (original_url,short_url) VALUES (?,?)',(url_r,'n'))
        conn.commit()
        if( sur):
            short_url1=request.host_url + sur
            conn.execute('UPDATE urls SET short_url = ? WHERE original_url = ?',(short_url1,url_r))
            conn.commit()
            conn.close()
            return render_template('home.html',short_url=short_url1)
        
        url_id= url_data.lastrowid
        hashid =hashids.encode(url_id)
        short_url1 = request.host_url + hashid
        conn.execute('UPDATE urls SET short_url = ? WHERE original_url = ?',(short_url1,url_r))
        conn.commit()
        conn.close()
        
        return render_template('home.html', short_url=short_url1)
    return render_template('home.html')
@app.route('/<id>')
def url_redirect(id):
    conn = get_db_connection()

    or1= conn.execute('SELECT original_url, clicks FROM urls WHERE short_url = ?',(request.host_url+id,)).fetchone()
    original_id = hashids.decode(id)
    
    if original_id:
        original_id= original_id[0]
        url_data = conn.execute('SELECT original_url, clicks FROM urls WHERE id = ?',(original_id,)).fetchone()

        if url_data is not None:

            original_url = url_data[0]
            response = requests.get(original_url)
            clicks = url_data[1]


            conn.execute('UPDATE urls SET clicks = ? WHERE id = ?', (clicks+1, original_id))
            conn.commit()
            conn.close()
            return redirect(original_url,Response=response.status_code)
        else:
            flash('INVALID URL')
            return redirect(url_for('home'))
    elif or1:
            clicks=or1[1]
            conn.execute('UPDATE urls SET clicks = ? WHERE short_url = ?', (clicks+1, request.host_url+id))
            conn.commit()
            conn.close()
            return redirect(or1[0],Response='HTTP 302 FOUND')
    else:
        flash('Invalid Url')
        return redirect(url_for('home'))


@app.route('/data')
def stats():
    conn = get_db_connection()
    db_urls = conn.execute('SELECT   original_url,clicks,short_url FROM urls').fetchall()
    conn.close()

    urls = []
    for url in db_urls:
        ourl=url[0]
        surl=url[2]
        click=url[1]
        r1=[ourl,surl,click]
        urls.append(r1)

    return render_template('data.html', urls=urls)
if __name__ == '__main__':
    app.run(port=5000, debug=True)
'''def uniques():
    conn= get_db_connection()
    hostname= socket.gethostname()
    ipa=socket.gethostbyname(hostname)
    found = conn.execute('SELECT ip from ips WHERE ip= ?',(ipa,)).fetchone()
    if found == 0:

        data=conn.execute('INSERT INTO ips (ip) VALUES (?)',(ipa,))
        conn.commit()
        conn.execute('UPDATE ips SET status =? WHERE ip = ?',(1,ipa))
    last_row = conn.execute('SELECT * FROM ips ORDER BY id DESC LIMIT 1').fetchone() 
    if last_row:
        return last_row[0]
    else:
        return 0   '''