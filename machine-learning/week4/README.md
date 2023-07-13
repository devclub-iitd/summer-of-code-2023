<h1 style="text-align: center;">Chatbot for Queries</h1>

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
