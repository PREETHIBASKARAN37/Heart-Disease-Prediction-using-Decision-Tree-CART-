# Heart Disease Prediction using Decision Tree (CART)

This project applies the CART (Classification and Regression Tree) algorithm to predict whether a person has heart disease based on common medical attributes like age, sex, blood pressure, cholesterol, and others.

---

## About CART

CART is a type of decision tree algorithm that splits data into smaller groups based on feature values. It's widely used for classification tasks because it's easy to understand and works well with structured data.

---

## Dataset

The data contains patient information and medical measurements with the following columns:

* `age`: Age
* `sex`: Gender (1 = male, 0 = female)
* `cp`: Chest pain type (1–4)
* `trestbps`: Resting blood pressure
* `chol`: Cholesterol level
* `fbs`: Fasting blood sugar (1 = true, 0 = false)
* `restecg`: ECG results
* `thalach`: Max heart rate achieved
* `exang`: Exercise-induced angina (1 = yes, 0 = no)
* `oldpeak`: ST depression
* `slope`: Slope of the ST segment
* `ca`: Major vessels colored by fluoroscopy
* `thal`: Thalassemia
* `target`: Presence of heart disease (1 = yes, 0 = no)

---

## How It Works

1. **Libraries**
   Required R packages are installed and loaded (`tidyverse`, `caret`, `rpart`, etc.).

2. **Preprocessing**
   The target column is converted to a factor to prepare for classification.

3. **Model Training**
   A CART model is trained using 10-fold cross-validation to ensure generalization.

4. **Evaluation**
   Model performance is measured using a confusion matrix, and several plots are used for deeper insights.

---

## Visualizations Included

* Class distribution of heart disease cases
* Age distribution by target class
* Chest pain type vs heart disease
* Gender vs heart disease
* Correlation heatmap
* Blood pressure and heart rate comparisons
* Accuracy vs complexity plot (cp)
* Feature importance
* Cholesterol vs age (colored by disease presence)

---

