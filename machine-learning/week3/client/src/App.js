import React, { useState, useRef } from 'react';
import axios from 'axios';

function App() {
  const [selectedImage, setSelectedImage] = useState(null);
  const [predictedAngle, setPredictedAngle] = useState(null);

  const handleImageChange = (event) => {
    setSelectedImage(event.target.files[0]);
  };

  const handlePrediction = () => {
    if (selectedImage) {
      const formData = new FormData();
      formData.append('image', selectedImage);

      axios
        .post('http://localhost:5000/predict_angle', formData)
        .then((response) => {
          setPredictedAngle(response.data.predicted_angle);
          console.log(response)
        })
        .catch((error) => {
          console.error('Error:', error);
        });
    }
  };

  const imageRef = useRef(null);

  const handleReverseRotate = () => {
    if (predictedAngle) {
      const rotationAngle = -predictedAngle; // Reverse the predicted angle

      imageRef.current.style.transform = `rotate(${-1 * rotationAngle}deg)`;
    }
  };

  const imagePreviewUrl = selectedImage ? URL.createObjectURL(selectedImage) : null;

  return (
    <div className="container mt-4">
      <div className="row">
        <div className="col-12">
          <h2 className="mb-3">Auto Alignment of Image through Machine Learning</h2>
          <div className="mb-3">
            <input type="file" className="form-control" onChange={handleImageChange} />
          </div>
          {imagePreviewUrl && (
            <div className="mb-3">
              <img src={imagePreviewUrl} alt="Selected" className="img-fluid" ref={imageRef} />
            </div>
          )}
          <button className="btn btn-primary" onClick={handlePrediction}>
            Predict Angle
          </button>
          <br/>
          {predictedAngle && (
            <div className="mt-3">
              <strong>Predicted Angle:</strong> {predictedAngle}<br/><br/>
              <button className="btn btn-secondary ml-2" onClick={handleReverseRotate}>
                Align The image Properly
              </button>
            </div>
          )}
        </div>
      </div>
    </div>
  );
}

export default App;
