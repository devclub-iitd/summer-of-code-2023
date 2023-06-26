<h1 style="text-align: center;">Object Tagging in Images</h1>
  
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
