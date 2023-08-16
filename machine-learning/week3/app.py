from flask import Flask, request, jsonify
from flask_cors import CORS
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Conv2D, MaxPooling2D, Flatten, Dense
from tensorflow.keras.preprocessing.image import img_to_array, smart_resize
import numpy as np
import cv2

# Define the desired image size
image_width, image_height = 180, 240

# Create a new instance of the model
new_model = Sequential()
new_model.add(Conv2D(32, (3, 3), activation='relu', input_shape=(image_width, image_height, 3)))
new_model.add(MaxPooling2D((2, 2)))
new_model.add(Conv2D(64, (3, 3), activation='relu'))
new_model.add(MaxPooling2D((2, 2)))
new_model.add(Flatten())
new_model.add(Dense(128, activation='relu'))
new_model.add(Dense(37, activation='softmax'))

# Load the saved weights
new_model.load_weights('model_weights.h5')

# Create Flask app
app = Flask(__name__)
CORS(app)

@app.route('/predict_angle', methods=['POST'])
def predict_angle():
    # Get the image file from the request
    image_file = request.files['image']

    # Read the image using OpenCV
    image = cv2.imdecode(np.frombuffer(image_file.read(), np.uint8), cv2.IMREAD_COLOR)
    
    # Resize the image while maintaining aspect ratio
    resized_image = smart_resize(image, (image_width, image_height))
    
    # Convert the image to array and preprocess
    resized_image = img_to_array(resized_image) / 255.0
    resized_image = np.expand_dims(resized_image, axis=0)

    # Make predictions using the trained model
    predictions = new_model.predict(resized_image)

    # Get the predicted rotation angle
    predicted_angle = int((np.argmax(predictions) * 5) - 90)

    # Return the predicted angle as a JSON response
    response = {'predicted_angle': predicted_angle}
    return jsonify(response)

if __name__ == '__main__':
    app.run()
