# DevClub Summer of Code 2023

## Machine Learning: Week 1 


<h1 style="text-align: center;"> Getting Started: Setting Up an ML Environment</h1>

There are 2 ways you can go about setting up an ML environment. One is locally, and one is on the cloud. Let's go over both:

#### (Recommended) Cloud Environment
Our local machines often don't have GPUs (Graphics Processing Units). As a result, it becomes difficult to work with images on your local machines sometimes. Moreover, if you are not that seasoned with GitHub yet (but don't worry, you will be by the end of this Summer xD!), Cloud notebooks make collaboration smooth and seamless (just like sharing a Google Docs link). Even better, you can add comments and pictures in parallel, and document what you are doing in parallel very nicely, all the while breaking your code into separate chunks, and can test each individual function as well (No looking through 20 error messages now to find that missing semicolon now!). For the purpose of this task, we recommend using <a href="https://colab.research.google.com/">**Google Colab**</a>.  
To see how you can set this up, have a look <a href="https://machinelearningmastery.com/google-colab-for-machine-learning-projects/">here</a> for a text tutorial, and <a href="https://youtube.com/playlist?list=PLA83b1JHN4ly56Y7o6vDAT8Szxc3_EdRH">at this amazing playlist</a> for a comprehensive video tutorial  

#### Bonus Task: Local Environment
If setting up Colab felt like easy mode, and you feel like local development (aka, running <a href="https://jupyter.org/">Jupyter Notebooks</a> on your own computer, instead of Google's servers) is the better fit for you (because of a higher RAM, or if you're tired of uploading your datasets to Google Drive everytime you want to do a project), check out <a href="https://machinelearningmastery.com/setup-python-environment-machine-learning-deep-learning-anaconda/">this</a> for a tutorial on how you can do it. 

NOTE: For SOC'23, we would highly recommend you to use Google Colab


<h1 style="text-align: center;"> A. Price Prediction</h1>
### Background:
In today's digital era, online marketplaces have become an integral part of our lives. With the convenience of browsing through a vast array of products and making purchases from the comfort of our homes, online shopping has experienced exponential growth. these virtual shopping havens offer a seemingly endless array of products at our fingertips. However, amidst this vast ocean of choices, finding the perfect product at the best price can feel like searching for a needle in a haystack.This assignment sets out on an exhilarating journey to create such a companion—a cutting-edge recommendation and price prediction model that will revolutionize the online shopping experience.

### Problem statement:
The aim is to build a model that can give recommendations and price prediction for various products on online marketplace by utilising the data about prices on existing online platforms.

- **Data Collection:** Select from which websites to fetch price information for products. Choose store that provides a well-structured and readily available set of data. Determine what you are looking for, either in the products or categories.
 
- **Web scraping:** To retrieve prices of products from the selected online stores, use web scraping tools such as BeautifulSoup or Scrapy. To navigate a website's HTML structure, find price elements and fetch relevant information, you will need to write code.

- **Data Cleaning and Preparation**: Cleanse the scraped data by removing inconsistencies, formatting issues, or special characters. The missing values and outliers must be dealt with appropriately. You can convert your data into a structured format that's suitable for analysis,
 such as a spreadsheet or database.
 
- **Exploratory Data Analysis-EDA(  Bonus Task):** Explore the scraped data to gain insights and understand the
distribution of prices. Calculate the total statistics, such as mean, median, minimum, and maximum prices. To determine the patterns or outliers, you can visualize your figures by means of histograms, box graphs and scatter plots.

- **Model Selection and Training**: Choose a suitable machine learning model for price prediction, such as linear regression, decision trees, or random forests. Split the data into training and testing sets. In view of product characteristics as inputs and corresponding prices being the target variable, train a selected model with training data.

- **Model Evaluation:** Evaluate the trained model's performance using appropriate metrics like mean squared error (MSE), root mean squared error (RMSE), or mean absolute error (MAE). To evaluate the model's accuracy and reliability, a comparison between expected prices and actual prices from testing data shall be made.

- **Deployment and Price Recommendations:** Once the model is trained and evaluated, create an interface or application where users can input product attributes, such as brand, category, and features. To generate price recommendations based on these attributes, implement a model. Ensuring that the interface is user friendly as well as providing sufficient and meaningful recommendations.


<h1 style="text-align: center;"> B. Chatbot for Queries</h1>

### Formal Statement

This assignment deals with creating a chatbot capable of answering the
queries and complaints raised by buyers on the marketplace website. The
chatbot should be tailored to the needs of the potential buyers. The
detailed process of building a chatbot might look as follows:-

-   **Basic Requirement**: Have a firm grip of the target audience and
    their needs in order to ensure that the chatbot works best. Try to
    gauge the length and depth of the conversations the chatbot might
    expect. Further, decide on when the chatbot may have to escalate the
    conversation to a human specialist. An idea of the website database
    will be beneficial.

-   **Collecting a Dataset**: A dataset is essential for building the
    backend of the chatbot. A good quality dataset is key when building
    a chatbot as it makes all the difference. The dataset typically
    contains past conversations, FAQs, etc. Transcripts of customer
    calls might also be helpful if available. The chatbot can simply
    respond to complaints or also have access to the store inventory.
    This is a design choice. In the latter case, the chatbot must have
    access to the database of the website. This will mean that some
    dummy store data is also required to train the model. The dataset
    can be organized into a CSV format for easy processing.

-   **Types of Responses**: Map out the possible variety of questions
    that might be asked into a logical flowchart which may allow the
    chatbot to determine which path to take. A basic decision tree after
    an analysis of the dataset will help build a prototype that can be
    fine-tuned.

-   **Framework**: The backend of the chatbot may be built using the
    same programming language as the website backend or can be
    integrated separately. Try out a few deep learning frameworks in
    Python or NodeJS once you have a decent dataset to get an idea of
    the working and optimize accordingly. The backend of a chatbot and
    the associated training is based on language models explained in
    detail in section 1.3.

-   **Deployment**: Once the chatbot is running locally, you can
    integrate it with the website either directly or by integrating it
    with an API. Note that providing the chatbot access to the current
    marketplace inventory will allow for more dynamic responses.

-   **Improving the Bot**: The chatbot can be improved greatly by
    utilizing live data over a certain period of time. Creating a
    re-training and re-deployment cycle will help automate this to some
    extent.

### Key Requirements

-   Textual Data Collection, Processing and Cleaning

-   Natural Language Processing (NLP) Frameworks

-   Live Deployment

-   Integration to create a unified platform

### Language Models

Language models lie at the core of chatbot development. A language model
is basically a model based on deep learning through which enables the
chatbot to understand and subsequently generate answers to user queries.
Training such a model from scratch requires vast computational
resources. This is where certain libraries with pre-built models which
can be changed to suit the need of the marketplace website become useful
. Some libraries which may be of use include:-

### NLTK and spaCy

The NLTK library is of great use for all NLP related applications
especially for chatbots. It allows for speech tagging and tokenization
which is of great help as this can then be processed to generate the
output.The spaCy library also provides tools such as creation of tokens
as well as getting dependency information among various entities present
in the input.\
There are several other libraries with a variety of underlying
architectures which can be used to build the chatbot Try out a few to
observe which works the best. Note that some of these also provide
access to quality collections of texts which can be used for both
training as well as evaluation.

<br>

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

 

<h1 style="text-align: center;">D. Object Tagging in Images</h1>
  
### Formal Statement

This assignment deals with creating an ML model which when provided with
an input image will accurately describe the objects present in it along
with associated characteristics. Let us go through a sketch of the
process:-

-   **Annotated Images**: The ML model needs to be trained by providing
    it with a good quality dataset of images mapped to a description of
    the objects present in it and marked by boxes to show where they
    occur within the image. Ensure that the dataset contains a wide
    variety of images with the objects occurring at random locations.

-   **ML Framework**: There are several prebuilt ML libraries that can
    be used to develop object detection models without starting from
    scratch. These libraries powerful tools and functions for training
    ML models. These libraries come with pre-implemented models,
    including ones for object detection like YOLO (You Only Look Once).
    An ML framework can be setup locally by installing all the necessary
    libraries associated in Python. The process involved in training a
    model is explained in further detail in section 2.3.

-   **Configuring the Model**: Based on the framework chosen, one can
    start from scratch or utilize a pre-trained model and modify it as
    per the need. In the case of YOLO, one can provide the dataset to a
    pre-trained model and observe the various changes in accuracy and
    average precision. This can be used to tweak the weights of the
    model.

-   **Testing**: Create a testing dataset with ground truths similar to
    what the model might encounter once deployed. Poor performance on
    this dataset might indicate a need to change the model architecture.

-   **Deploy**: Once, the model performs satisfactorily in the testing
    phase, we can move to deployment. This will involve migrating the
    trained model from your local setup to a remote environment allowing
    users to access it.

-   **Improve**: The weights of the model can be adjusted periodically
    by utilizing live data itself. Automating the training and
    deployment cycle with some intervention will greatly improve the
    model.

### Key Requirements

-   Image Data Collection and Processing

-   Machine Learning Frameworks for Images

-   Live Deployment

### Training a Model

The training of an ML model irrespective of its architecture involves
providing it with the data present in the collected dataset in order to
set some 'weights' which in some way ultimately decide the bounds of
classification or tagging in our case. The training of a model can be
done from scratch but requires vast datasets and implementing the model
itself but the frameworks mentioned above make it much more easy to do
the same by tweaking pre-built ones as per the use case. The choice you
can make is in the very architecture of the ML model. In other words,
the algorithm that drives the model is of equal importance. You are free
to try out a few and come to a better conclusion. However, a few common
ones are mentioned below:-

### Decision Trees and Random Forests

A decision tree is a flowchart-like model that makes sequential
decisions based on feature values, leading to a final prediction. It
splits data into branches based on specific features and their
thresholds. Random forests, on the other hand is a method that combines
multiple decision trees to improve accuracy. In object tagging, decision
trees and random forests analyze image features (such as color, texture,
or shape) and make predictions about the presence and class of objects.
Each tree in a random forest independently predicts object labels, and
the final prediction is determined through majority voting or averaging
the predictions. Scikit-Learn is an extremely powerful library which
allows user-friendly training of such models.

### Convolutional Neural Networks

CNNs consist of multiple layers, including convolutional layers, pooling
layers, and fully connected layers. Convolutional layers apply filters
to capture local patterns in the input image, while pooling layers
downsample the feature maps, reducing their spatial dimensions. Fully
connected layers combine these learned features and make predictions
based on them. CNNs are trained on large labeled datasets, allowing them
to learn hierarchical representations of images. This enables them to
recognize complex patterns, textures, and shapes in images, aiding in
accurate object tagging. Some libraries such as TensorFlow and PyTorch
offer a wide range of pre-built CNN models such as ResNet and VGG which
might help in tagging.
