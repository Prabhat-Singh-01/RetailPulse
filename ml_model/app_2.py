import streamlit as st
import joblib
import numpy as np

# Load models
model  = joblib.load("churn_model.pkl")
scaler = joblib.load("scaler.pkl")

# Title
st.title("🛒 RetailPulse — Customer Churn Prediction App")

st.divider()

st.write("Please enter the customer order details and hit the Predict button!")

st.divider()

# Input fields
payment_value   = st.number_input("💰 Payment Value (BRL)", min_value=0.0, max_value=10000.0, value=150.0)
review_score    = st.slider("⭐ Review Score", min_value=1, max_value=5, value=4)
total_items     = st.number_input("📦 Total Items in Order", min_value=1, max_value=50, value=2)
freight_value   = st.number_input("🚚 Freight Value (BRL)", min_value=0.0, max_value=500.0, value=20.0)
delivery_delay  = st.number_input("⏰ Delivery Delay (days)", min_value=-30, max_value=100, value=0)
actual_delivery = st.number_input("📅 Actual Delivery Days", min_value=1, max_value=100, value=7)
is_late         = st.selectbox("❌ Was Delivery Late?", ["No", "Yes"])
order_month     = st.selectbox("📆 Order Month", list(range(1, 13)))
order_year      = st.selectbox("🗓️ Order Year", [2016, 2017, 2018])
customer_state  = st.number_input("🗺️ Customer State (encoded)", min_value=0, max_value=26, value=0)

st.divider()

predict_button = st.button("🔮 Predict!")

st.divider()

if predict_button:

    is_late_val = 1 if is_late == "Yes" else 0

    X = [payment_value, review_score, total_items, freight_value,
         delivery_delay, actual_delivery, is_late_val,
         order_month, order_year, customer_state]

    X_array = scaler.transform([np.array(X)])

    prediction = model.predict(X_array)[0]

    predicted = "Yes ⚠️ Customer will Churn!" if prediction == 1 else "No ✅ Customer will Stay!"

    st.balloons()

    st.write(f"**Prediction: {predicted}**")

else:
    st.write("Please enter the values and use the Predict button!")