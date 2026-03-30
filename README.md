## 📌 Project Overview

**RetailPulse** is a complete end-to-end Data Analyst project built on the
**Olist Brazilian E-commerce Dataset** containing 100,000+ real orders from 2016 to 2018.

This project simulates the real work of a Data Analyst at an e-commerce company like
Flipkart, Amazon, or Myntra — covering everything from raw data to business insights,
interactive dashboards, and machine learning.

---

## 🎯 Business Problem

> *"How can we use data to understand our customers better, improve delivery performance,
> and predict which customers are likely to stop buying from us?"*

---

## 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| PostgreSQL | Data storage & SQL analysis |
| Python | Data cleaning & EDA |
| Pandas & NumPy | Data manipulation |
| Matplotlib & Seaborn | Data visualization |
| Scikit-learn | Machine learning |
| Power BI | Interactive dashboard |
| Streamlit | ML web application |
| GitHub | Version control & portfolio |

---

## 📁 Project Structure
```
RetailPulse/
│
├── sql/
│   └── business_queries.sql      # 25 business SQL queries
│
├── notebooks/
│   └── retailpulse_eda.ipynb     # EDA & visualizations
│
├── ml_model/
│   ├── retailpulse_churn.ipynb   # ML model notebook
│   ├── app.py                    # Streamlit web app
│   └── requirements.txt          # Dependencies
│
├── dashboard/
│   └── screenshots/              # Power BI dashboard screenshots
│
└── README.md
```

---

## 📊 Dataset

- **Source:** [Olist Brazilian E-Commerce Dataset](https://www.kaggle.com/datasets/olistbr/brazilian-ecommerce)
- **Size:** 100,000+ orders
- **Period:** September 2016 to October 2018
- **Tables:** 9 CSV files

| Table | Description |
|---|---|
| olist_orders | Order status & timestamps |
| olist_customers | Customer details & location |
| olist_order_items | Products, price & freight |
| olist_order_payments | Payment type & value |
| olist_order_reviews | Review scores & comments |
| olist_products | Product details & category |
| olist_sellers | Seller location & details |
| olist_geolocation | Zip codes & coordinates |
| category_name_translation | Portuguese to English |

---

## 🗂️ Phase 1 — Data Setup & ERD

- Downloaded and explored all 9 CSV files
- Created Entity Relationship Diagram (ERD) using dbdiagram.io
- Loaded all tables into PostgreSQL database

---

## 🔍 Phase 2 — SQL Analysis

Written **25 business queries** across 7 categories:

-  Sales Analysis
-  Customer Analysis
-  Delivery Analysis
-  Review & Rating Analysis
-  Seller Analysis
-  Payment Analysis
-  Advanced Queries (Window Functions, CTEs)

**Sample Key Findings:**
- Total Revenue Generated: **R$ 13.6 Million**
- Most popular payment method: **Credit Card (74%)**
- Top revenue category: **Health & Beauty**

---

## 🐍 Phase 3 — Python EDA

Performed complete Exploratory Data Analysis using Python:

**Data Cleaning:**
- Fixed datetime columns
- Handled missing values
- Engineered new features

**Feature Engineering:**
- Delivery delay days
- Actual delivery days
- Is late flag
- Order month & year

**10 Visualizations created:**
1. Monthly Revenue Trend
2. Top 10 Product Categories
3. Order Status Distribution
4. Review Score Distribution
5. Late vs On Time Deliveries (Pie Chart)
6. Delivery Status vs Review Score
7. Top 10 Cities by Customers
8. Payment Method Distribution
9. Correlation Heatmap
10. Yearly Orders Comparison

---

## 📊 Phase 4 — Power BI Dashboard

Built a **3 page interactive dashboard:**

**Page 1 — Sales Overview**
- Total Revenue, Orders & Avg Order Value cards
- Monthly Revenue trend line chart
- Top 10 categories bar chart
- Yearly orders comparison

**Page 2 — Customer Analysis**
- Total customers card
- Top cities bar chart
- Customer by state map
- Payment methods donut chart

**Page 3 — Delivery & Reviews**
- Late Delivery % card
- Average Review Score card
- Review score distribution
- Late vs On Time donut chart
- Delivery status vs review score

---

## 🤖 Phase 5 — ML Model (Customer Churn Prediction)

**Problem Statement:**
> Predict whether a customer will churn (not order again) based on their order behaviour.

**Churn Definition:**
> Customer who has not placed an order in the last 6 months = Churned

**Features Used:**
- Payment Value
- Review Score
- Total Items
- Freight Value
- Delivery Delay Days
- Actual Delivery Days
- Is Late
- Order Month & Year
- Customer State

**Models Trained:**
| Model | Accuracy |
|---|---|
| Logistic Regression | ~91% |
| Random Forest | ~96% |

**Final Model:** Random Forest Classifier 

**Key Finding:**
> Order recency (year & month) and review score are the most important features
> for predicting customer churn.

---

## 🌐 Streamlit Web App

Built an interactive web app using Streamlit where you can:
- Enter customer order details
- Get instant churn prediction
- See retention recommendations

**To run the app:**
```bash
cd ml_model
pip install -r requirements.txt
streamlit run app.py
```

---

## 💡 Key Business Insights

1. **Late deliveries directly impact review scores** — late orders average 2.5 stars vs 4.2 stars for on-time orders
2. **Top 3 categories** (Health & Beauty, Watches, Bed & Bath) contribute to majority of revenue
3. **Credit card** is the dominant payment method (74% of transactions)
4. **São Paulo** has the highest number of customers and revenue
5. **November** shows highest sales — driven by Black Friday
6. **96% ML accuracy** in predicting customer churn

---

## 📈 Results & Impact

| Metric | Value |
|---|---|
| Total Revenue Analysed | R$ 13.6 Million |
| Total Orders | 100,000+ |
| SQL Queries Written | 25 |
| Visualizations Created | 10 |
| ML Model Accuracy | 96% |
| Dashboard Pages | 3 |

---

## 🚀 How to Run This Project

### 1. Clone the Repository
```bash
git clone https://github.com/Prabhat-Singh-01/RetailPulse.git
```

### 2. Setup PostgreSQL Database
- Install PostgreSQL & pgAdmin
- Create database named `retailpulse`
- Download dataset from Kaggle
- Import CSV files in correct order

### 3. Run SQL Queries
- Open pgAdmin
- Run `sql/business_queries.sql`

### 4. Run Python EDA
```bash
pip install pandas numpy matplotlib seaborn sqlalchemy psycopg2 jupyter
jupyter notebook notebooks/retailpulse_eda.ipynb
```

### 5. Run Streamlit App
```bash
cd ml_model
pip install -r requirements.txt
streamlit run app.py
```

---

## 👨‍💻 About Me

**Prabhat**
BCA 2nd Year | Lucknow, India

🔗 **Connect with me:**
- GitHub: [github](https://github.com/Prabhat-Singh-01)
- LinkedIn: [linkedin](https://www.linkedin.com/in/prabhat-singh-a6a58132a/)
- Email: prabhatsingh.connect01@gmail.com

