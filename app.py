from flask import Flask, render_template, request, jsonify
import joblib
import numpy as np
from sklearn.preprocessing import LabelBinarizer
from scipy.sparse import hstack
from sklearn.feature_extraction.text import TfidfVectorizer

app = Flask(__name__)

# load all the label_binarizers
cat1_binarizer = joblib.load('vector_emb/cat1_binarizer.joblib')
cat2_binarizer = joblib.load('vector_emb/cat2_binarizer.joblib')
cat3_binarizer = joblib.load('vector_emb/cat3_binarizer.joblib')
brand_name_binarizer = joblib.load('vector_emb/brand_name_binarizer.joblib')

# load all the vectorizers
name_vectorizer = joblib.load('vector_emb/name_vectorizer.joblib')
item_desc_vectorizer = joblib.load('vector_emb/item_desc_vectorizer.joblib')
    
# load the price predictor model
sgd_model = joblib.load('trained_models/sgd_model.pkl')

# load the nn model for searching
nn_1 = joblib.load('trained_models/nn_1.pkl')

@app.route('/')
def home():
    return render_template('./index.html')

@app.route('/suggest_price', methods=['POST'])
def suggest_price():
    # Get the form data
    name = request.form['name']
    category_1 = request.form['category_1']
    category_2 = request.form['category_2']
    category_3 = request.form['category_3']
    brand_name = request.form['brand_name']
    item_condition = int(request.form['item_condition'])
    shipping = int(request.form['shipping'])
    item_description = request.form['item_description']
    
    errors = []
    cat1_binarized=None
    cat2_binarized=None
    cat3_binarized=None
    brand_name_binarized=None
    if category_1 in cat1_binarizer.classes_:
        cat1_binarized = cat1_binarizer.transform([category_1])
    else:
        errors.append('Category 1 should be only from pre-defined categories')

    if category_2 in cat2_binarizer.classes_:
        cat2_binarized = cat2_binarizer.transform([category_2])
    else:
        errors.append('Category 2 should be only from pre-defined categories')

    if category_3 in cat3_binarizer.classes_:
        cat3_binarized = cat3_binarizer.transform([category_3])
    else:
        errors.append('Category 3 should be only from pre-defined categories')

    if brand_name in brand_name_binarizer.classes_:
        brand_name_binarized = brand_name_binarizer.transform([brand_name])
    else:
        errors.append('Brand Name should be only from pre-defined categories')

    if errors:
        return jsonify(errors=errors), 400

    item_cond_binarized = np.zeros(shape=(5,), dtype='uint8')
    item_cond_binarized[item_condition-1] = 1
    shipping = np.array([shipping], dtype='uint8')
    name_vectorized = name_vectorizer.transform([name])
    item_desc_vectorized = item_desc_vectorizer.transform([item_description])

    x_test = hstack([cat1_binarized, cat2_binarized, cat3_binarized,
            brand_name_binarized, item_cond_binarized, shipping, 
            name_vectorized, item_desc_vectorized]).tocsr()
    
    y = sgd_model.predict(x_test)
    # Return the result as a JSON response
    return jsonify(expected_price=np.exp(y[0]))

@app.route('/search_product', methods=['POST'])
def search_product():
    return jsonify(error="NOT IMPLEMENTED")
    


if __name__ == '__main__':
    app.run(debug=True)
