<h1 style="text-align: center;">Object Tagging in Images</h1>
  
### Formal Statement

This assignment deals with creating an ML model which when provided with
an input image will accurately describe the objects present in it along
with associated characteristics. 
You should also identify the main object in the image which would be the item to be sold, and try to describe it with the color and other features. 
Let us go through a sketch of the
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
    libraries associated in Python.

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

-   Live Deployment/Demonstration
