from flask import Flask, render_template, request, jsonify
import numpy as np

app = Flask(__name__)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/suggest_price', methods=['POST'])
def suggest_price():
    # Get the form data
    name = request.form['name']
    category_name = request.form['category_name']
    brand_name = request.form['brand_name']
    shipping = int(request.form['shipping'])
    item_description = request.form['item_description']
    
    # PROCESS these raw values and pass to sgd_reg accordingly
    
    # Return the result as a JSON response
    return jsonify(result=sgd_model_result)


if __name__ == '__main__':
    app.run(debug=True)
