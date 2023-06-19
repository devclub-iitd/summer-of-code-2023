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


<h1 style="text-align: center;"> Week 1 Assignment: Price Prediction</h1>

### Background:
In today's digital era, online marketplaces have become an integral part of our lives. With the convenience of browsing through a vast array of products and making purchases from the comfort of our homes, online shopping has experienced exponential growth. these virtual shopping havens offer a seemingly endless array of products at our fingertips. However, amidst this vast ocean of choices, finding the perfect product at the best price can feel like searching for a needle in a haystack.This assignment sets out on an exhilarating journey to create such a companion—a cutting-edge recommendation and price prediction model that will revolutionize the online shopping experience.

### Problem statement:
The aim is to build a model that can give recommendations and price prediction for various products on online marketplace by utilising the data about prices on existing online platforms.

- **Data Collection:**: There are 2 ways you can go about it. We suggest working with a Kaggle Dataset initially, though if you're comfortable with web scraping, you can try that track instead. Web Scraping also gives you insights into how you can clean and prepare data, like most real-life machine learning problems, so if you want the whole experience, you can try that too.
   - **Web Scraping**
      1. **Website Selection**: Select from which websites to fetch price information for products. Choose a store that provides a well-structured and readily available set of data. Determine what you are looking for, either in the products or categories.
      2. **Scraping**: To retrieve prices of products from the selected online stores, use web scraping tools such as BeautifulSoup or Scrapy. To navigate a website's HTML structure, find price elements and fetch relevant information, you will need to write code.
      3. **Data Cleaning and Preparation**: Cleanse the scraped data by removing inconsistencies, formatting issues, or special characters. The missing values and outliers must be dealt with appropriately. You can convert your data into a structured format that's suitable for analysis,
   such as a spreadsheet or database.
   - **Kaggle Dataset Selection**: If you aren't comfortable with scraping, you can check out <a href="https://www.kaggle.com/datasets">Kaggle's datasets</a> and try to find one which suits your needs!
 
- **Exploratory Data Analysis-EDA(  Bonus Task):** Explore the scraped data to gain insights and understand the
distribution of prices. Calculate the total statistics, such as mean, median, minimum, and maximum prices. To determine the patterns or outliers, you can visualize your figures by means of <a href="https://www.investopedia.com/terms/h/histogram.asp#:~:text=Investopedia%20%2F%20Joules%20Garcia-,What%20Is%20a%20Histogram%3F,into%20logical%20ranges%20or%20bins.">histograms</a>, <a href="https://chartio.com/resources/tutorials/what-is-a-box-plot/">box graphs</a> and <a href="https://chartio.com/learn/charts/what-is-a-scatter-plot/">scatter plots</a>.

- **Model Selection and Training**: Choose a suitable machine learning model for price prediction, such as <a href="https://youtu.be/JTj-WgWLKFM">linear regression</a>, <a href="https://youtu.be/wxS5P7yDHRA">decision trees</a>, or <a href="https://youtu.be/x9pIM2GkbF4">random forests</a>. Split the data into training and testing sets. In view of product characteristics as inputs and corresponding prices being the target variable, train a selected model with training data.

- **Model Evaluation:** Evaluate the trained model's performance using <a href = "https://youtu.be/K490SP-_H0U">appropriate metrics</a> like mean squared error (MSE), root mean squared error (RMSE), or mean absolute error (MAE). To evaluate the model's accuracy and reliability, a comparison between expected prices and actual prices from testing data can be made.

- **Deployment and Price Recommendations:** Once the model is trained and evaluated, create an interface or application where users can input product attributes, such as brand, category, and features. To generate price recommendations based on these attributes, implement a model. Ensuring that the interface is user-friendly as well as providing sufficient and meaningful recommendations.


### Additional Stuff for Math enthusiasts
- **Linear Regression**: Check out <a href = "https://youtu.be/4b4MUYve_U8"> this fabulous lecture </a>, taken by Andrew Ng, a professor of Stanford
- **RF and Decision Trees**: You can check out <a href = "https://youtube.com/playlist?list=PLM8wYQRetTxAl5FpMIJCcJbfZjSB0IeC_"> this amazing playlist on tree based ML algortihms </a> by <a href="https://www.youtube.com/@NormalizedNerd"> Normalized Nerd </a>

