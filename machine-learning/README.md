#### Why learn this?
Today, mankind faces many problems that have no definitive solution or hard coded answers. The problems we face today are multifaceted, and require perspectives and different ways of thinking, and iterative improvement over our current solutions. In this sense, trying to find patterns within the current data that we have become one of the key strategies of going about and solving these problems. The field that accomplishes this is Machine Learning.

Most industries working with large amounts of data have recognised the value of Machine Learning technology. By gleaning insights from this data – often in real time – organisations are able to work more efficiently or gain an advantage over competitors. Some of the industries that have adopted this technology include the public sector, e-commerce, healthcare, and finance. As a result, in the status quo, ML has become one of the most coveted fields, and offers a wide variety of job opportunities with great potential for career growth.

#### What we'll be building?
This year the theme for DevClub Summer of Code is e-commerce! We will be building various ML functionalities associated with e-commerce websites, such as price prediction models, query-redressal chatbots, object-tagging models to identify and isolate objects in images. We will predominantly be using python for this.

### Week 1
- #### Concepts
  - Introduction
      - What is ML?
      - How to get started with ML
      - How to setup your development environment
  - Dataset Cleaning
      - Where and how to obtain dataset
      - Why do we need to clean datasets
      - How can we clean datasets
  - Data Analysis
      - How to visualise data
      - Various measures of central tendency
      - How to interpret the results of data visualisation
  - Python Libraries
      - Pandas
      - Numpy
      - Sci-Kit Learn
  - Model training process
      - Preparing Dataframe
      - Model Selection
      - Train Test Split
      - Error metrics
- #### Resources:
      1. <a href = "https://www.youtube.com/playlist?list=PLA83b1JHN4ly56Y7o6vDAT8Szxc3_EdRH">Google Colab Setup</a>
      2. <a href="https://www.youtube.com/watch?v=_uwucNViakk">Kaggle Datasets</a>
      3. Tutorial on <a href="https://www.youtube.com/watch?v=FniLzpaSFGk">Numpy and Pandas</a> for Data Analysis and Manipulation
      4. Tutorials on <a href="https://www.youtube.com/playlist?list=PL-osiE80TeTvipOqomVEeZ1HRrcEvtZB_">Matplotlib</a> for Data Visualisation
      5. <a href="https://www.youtube.com/watch?v=WngoqVB6cXw">Linear Regression (Multiple Variables)</a>
      6. <a href="https://www.youtube.com/playlist?list=PLeo1K3hjS3uvCeTYTeyfe0-rN5r8zn9rw">ML Playlist</a>, contains algorithms like Linear Regression, Decision Trees, and Random Forest
      7. <a href="https://www.youtube.com/watch?v=K490SP-_H0U&t=26s">Evaluation metrics for regression:</a> MAE vs MSE vs RMSE vs RMSLE
- #### [Task](week1) 
Set up an ML environment to run your code on GPUs, then select and build a price prediction model, and also scrape your own dataset for it from the web.

### Week 2

#### Concepts
- YOLO
YOLO is incredibly efficient because it processes the entire image in a single pass. Unlike traditional object detection algorithms that inspect different regions of an image separately, YOLO absorbs all the visual information at once, rather than examining each piece of evidence individually. By examining the entire image simultaneously, it drastically reduces the computational burden and time compared to algorithms that examine multiple regions independently. It also achieves impressive accuracy despite its speed. Its deep neural network architecture has been meticulously trained on vast datasets, honing its ability to recognize a wide range of objects across various classes. YOLO doesn't just detect objects; it also provides precise bounding box coordinates and class probabilities, allowing for more detailed analysis. While there are other highly accurate object detection algorithms, YOLO strikes an excellent balance between speed and accuracy, making it a popular choice in practical applications.

- Training a Model

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

- Decision Trees and Random Forests

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

- Convolutional Neural Networks

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

#### Resources
1. Object Detection by using [YOLO with OpenCV](https://www.pyimagesearch.com/2018/11/12/yolo-object-detection-with-opencv/)
2. Check out [Scikit Learn](https://www.youtube.com/playlist?list=PLQVvvaa0QuDd0flgGphKCej-9jp-QdzZ3)
3. Tutorial on using Pytorch with YOLO [here](https://blog.paperspace.com/how-to-implement-a-yolo-object-detector-in-pytorch/)
4. Setting up [YOLO on Google Collab](https://www.youtube.com/watch?v=mmj3nxGT2YQ)
5. Sample Dataset for Object Detection [BSDS500](https://www.kaggle.com/datasets/balraj98/berkeley-segmentation-dataset-500-bsds500) (Already split into training testing and validation)
6. YOLO Algorithm Expkanation [YOLO](https://www.baeldung.com/cs/yolo-algorithm) 

#### [Task](week2) 
Use YOLO to identify and describe items to be sold from the pictures, and fine-tune your Object Detection model using your own dataset
