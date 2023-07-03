<h1 style="text-align: center;">C. Automated Image Alignment and Enhancement </h1>

### Background
In the bustling world of online marketplaces, product images hold the key to attracting potential customers and driving sales. Picture this: a seller uploads an image of their remarkable product, but alas! It appears misaligned, dimly lit, or lacking that captivating appeal.
Such images can hamper the overall user experience, leaving buyers disenchanted. But fear not, for a groundbreaking solution awaits! To tackle this challenge, this assignment aims to develop an automated **Image processing model**. This will enable  image detection, auto-rotation of images for proper alignment, and hence will enhances seller-uploaded images. 
Get ready to transform online marketing into an extraordinary realm, where products shine and the marketplace experience becomes captivating.

### Formal statement
The aim of this assignment is to develop a model which can be used to automatically detect, rotate for proper alignment, and enhance the image uploaded by a seller in an online marketplace.
Below are the steps and methods that you may follow to proceed for this assignment:


-   **Data collection:** Build a dataset containing the variety of images that usually uploaded by the sellers for training and testing your ML models. Make sure to include the images with different orientations, quality, background to train the model for all conditions.

-   **Conversion of image to matrix:** Images are stored in the form of matrices or tensors for using in ML methods, one can use libraries like OpenCV or PIL for this purpose to get the matrices in the compatible form for the ML method that you will use.

-   **Image recognistion and detection:** Image recognition is a fundamental task in machine learning that involves identifying and categorizing objects or patterns within images. There are a few approachable methods that can be used to get started with image recognition tasks. Two popular techniques are Haar cascades and HOG (Histogram of Oriented Gradients) + SVM (Support Vector Machine).
    - **Haar Cascades:**
  Haar cascades are an efficient and widely-used method for object detection in images. This method is based on the Haar-like features, which are simple rectangular patterns that can be computed rapidly. Haar cascades use a cascade of classifiers trained to detect specific object features at different scales and positions within an image. This approach is particularly effective for detecting objects with well-defined features, such as faces or specific shapes.

    - **HOG + SVM:**
The HOG (Histogram of Oriented Gradients) + SVM approach is another beginner-friendly method for image recognition. It involves extracting gradient features from images to capture local shape and edge information. The HOG algorithm computes histograms of oriented gradients, which represent the distribution of gradient orientations within localized image regions. These features are then used as input to an SVM classifier, which can learn to distinguish between different object classes.

-   **Rotation:** Methods like SIFT (Scale-Invariant Feature Transform) or SURF (Speeded-Up Robust Features) combined with algorithms like RANSAC (Random Sample Consensus) can be used for properly aligning the detected objects in the image.
    
    - **SIFT and SURF:**are feature extraction algorithms that enable the identification of distinctive keypoints within an image. These keypoints represent unique visual patterns that can be robustly matched across different images, regardless of variations in scale, rotation, or lighting conditions. By leveraging these algorithms, you can extract and analyze the most relevant features in an image, laying the foundation for successful object detection.

    - Once keypoints are identified, aligning the detected objects accurately becomes crucial. This is where **RANSAC** steps in. RANSAC is an algorithm that iteratively estimates model parameters by fitting models to subsets of data points. In the context of image recognition, RANSAC aids in eliminating outliers and refining the alignment of objects within the image. By incorporating RANSAC, you can achieve more robust and reliable object alignment.
      
 - **Image enhancement and background blur( Bonus Task ):** Use methods like Histogram Equalization (it improves the contrast and enhances the image details) and Median Filter(a non-linear filtering method that replaces each pixel's value with the median of its neighbourhood, effectively reducing noise and blurring the background).

-   **Training and Testing:** Split your dataset into training and testing sets. Use the training set to train your models. During the training process, the model iteratively learns from the training data by adjusting its parameters based on the calculated loss. Evaluate the performance of your models using the testing set and iterate on your approach, if necessary, till the no. of iterations reach the maximum limit or the calculated loss is brought down.

-   **Deployment and integration with platform:** After the training and testing process, when the model starts performing well on new data then it is ready to be deployed and integrated with the online marketplace platform. This involves implementing the image processing pipeline and integrating it with the platform's existing infrastructure.

-   **Improvement**: The model can be improved by periodically training and re-deploying the improved model utilising the live data from the platform itself.

### Key Requirements
-   Collecting image data and converting into matrices (tensors).
-   Using ML methods to rotate, enhance and apply background blur effect.
-   Training and testing the ML model.
-   Deployment, integration with the online marketplace platform.
