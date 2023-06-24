import streamlit as st
import numpy as np                                    # For matrices!
import matplotlib.pyplot as plt                       # To visualize
import pandas as pd                                   # To read data
from sklearn.tree import DecisionTreeRegressor
from sklearn import svm
from sklearn.metrics import mean_squared_error, f1_score
from sklearn.preprocessing import OneHotEncoder       # To convert discrete strings to vectors!
from sklearn.preprocessing import normalize           # For normalizing
from google.colab import files                        # To upload dataset
import seaborn as sns                                 # For plots
import joblib

raw_data = pd.read_csv('laptop_price.csv', encoding='latin-1')
raw_data

Resolution = []
for row in raw_data['ScreenResolution']:
  Resolution.append(int(((row.split(" ")[-1]).split("x"))[0]) * int(((row.split(" ")[-1]).split("x"))[1]))

raw_data['Resolution'] = Resolution

GHz, CpuBrand = [], []
for row in raw_data['Cpu']:

  CpuBrand.append(row.split()[0])
  GHz.append(float(row.split()[-1][:-3]))

raw_data['GHz'] = GHz
raw_data['CpuBrand'] = CpuBrand

GpuBrand = []
for row in raw_data['Gpu']:

  if "Intel HD" in row:
    GpuBrand.append("Intel HD")
  elif "Intel Iris" in row:
    GpuBrand.append("Intel Iris")
  elif "Nvidia" in row:
    GpuBrand.append("Nvidia")
  elif "AMD" in row:
    GpuBrand.append("AMD")
  else:
    GpuBrand.append("None")

raw_data['GpuBrand'] = GpuBrand

RamValue = []
for row in raw_data['Ram']:
  RamValue.append(int(row[:-2]))

raw_data['RamValue'] = RamValue

StorageisSSD = []
for row in raw_data['Memory']:

  if "SSD" in row or "Hybrid" in row:
    StorageisSSD.append(1)
  else:
    StorageisSSD.append(0)

raw_data['StorageisSSD'] = StorageisSSD

raw_data = raw_data.drop(columns=['Product', 'Weight','Inches', 'ScreenResolution', 'Cpu', 'Gpu', 'Ram', 'Memory'])

# First we convert to numpy arrays

y_train = np.array(raw_data['Price_euros'])
raw_data = raw_data.drop(columns=['Price_euros'])


def pricePredict(X_test):

  if X_test[-1]:

    X_test[-1] = 1
  else:
    X_test[-1] = 0

  raw_data.loc[len(raw_data.index)] = X_test

  X_num = np.array(raw_data[['Resolution', 'GHz', 'RamValue', 'StorageisSSD']])
  X_nonnum = np.array(raw_data[['CpuBrand', 'GpuBrand', 'Company', 'TypeName', 'OpSys']])

  # Normalize between 0 to 1 in the first array

  X_norm = normalize(X_num, norm="max", axis = 0)

  # One-hot encode the second array

  enc = OneHotEncoder(sparse_output=False)
  X_transform = enc.fit_transform(X_nonnum)

  X = np.concatenate((X_norm, X_transform), axis=1)
  X_train = X[:-1]
  X_test = X[-1]

  model = RandomForestRegressor()
  model.fit(X_train, y_train)

  return model.predict(X_test)

st.write("Laptop Price Prediction Model")

with st.form("my_form"):

  st.write("Put in your laptop details: ")

  Company = st.selectbox("Brand:", ("Apple", "HP", "Acer", "Asus", "Dell", "Lenovo", "Chuwi", "MSI", "Microsoft", "Toshiba", "Huawei", "Xiaomi", "Vero", "Razer", "Mediacom", "Samsung", "Google", "Fujitsu", "LG"))
  TypeName = st.selectbox("Type:", ("Ultrabook", "Notebook", "Netbook", "Gaming", "2 in 1 Convertible", "Workstation"))
  CpuBrand = st.selectbox("CPU Brand:", ("Intel", "AMD", "Samsung"))
  GpuBrand = st.selectbox("GPU Brand:", ("Intel Iris", "Intel HD", "AMD", "Nvidia", "None"))
  OpSys = st.selectbox("OS:", ("macOS", "No OS", "Windows 10", "Mac OS X", "Linux", "Android", "Windows 10 S", "Chrome OS", "Windows 7"))

  RamValue = st.number_input("RAM capacity (GB)")

  StorageisSSD = st.checkbox("Does it have an SSD?")

  x = st.number_input("Display width (px)")
  y = st.number_input("Display height (px)")

  GHz = st.number_input("Processor GHz")

  slider_val = st.slider("Form slider")
  checkbox_val = st.checkbox("Form checkbox")

  submitted = st.form_submit_button("Submit")
  if submitted:
    st.write("The predicted value of your laptop is "+ pricePredict([Company, TypeName, OpSys, (x*y), GHz, CpuBrand, GpuBrand, RamValue, StorageisSSD]) +" euros!")