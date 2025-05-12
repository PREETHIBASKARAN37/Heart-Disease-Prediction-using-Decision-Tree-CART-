#Heart-Disease-Prediction-using-Decision-Tree-CART
This project uses the CART (Classification and Regression Tree) algorithm to predict whether a person has heart disease based on health indicators like age, sex, blood pressure, cholesterol, and more.

About CART:
CART is a decision tree algorithm that splits data into smaller groups based on feature values. It is easy to interpret and works well for classification tasks by creating clear decision rules.

The model is trained with 10-fold cross-validation for better generalization and evaluated using a confusion matrix and visualizations.

Dataset
The dataset used in this project is based on medical attributes related to heart disease. It contains the following columns:

age: Age of the individual
sex: Gender (1 = male, 0 = female)
cp: Chest pain type (1-4)
trestbps: Resting blood pressure (mm Hg)
chol: Serum cholesterol level (mg/dl)
fbs: Fasting blood sugar (> 120 mg/dl, 1 = true, 0 = false)
restecg: Resting electrocardiographic results (0-2)
thalach: Maximum heart rate achieved
exang: Exercise induced angina (1 = yes, 0 = no)
oldpeak: Depression induced by exercise relative to rest
slope: Slope of the peak exercise ST segment (1-3)
ca: Number of major vessels colored by fluoroscopy
thal: Thalassemia (1-3)
target: Presence of heart disease (1 = yes, 0 = no)

Installation
To run the code, ensure that you have the required libraries installed. You can install the necessary R packages by running:
install.packages(c("tidyverse", "caret", "rpart", "rpart.plot", "reshape2", "corrplot"))

Usage
Load the Data: The dataset should be loaded into R. Update the file path as needed to point to the location of the dataset on your machine.

Preprocessing: The target variable (target) is converted to a factor type for classification.

Cross-Validation: The model is trained using 10-fold cross-validation to evaluate its performance. This method splits the dataset into 10 folds, trains the model on 9 folds, and tests it on the 10th fold. This process repeats for all 10 folds to ensure the model's robustness.

Model Training: A CART model (using the rpart algorithm) is trained on the dataset.

Model Evaluation:

Confusion Matrix: The confusion matrix evaluates the model's accuracy, precision, recall, and F1 score.

Confusion Matrix Visualization: The confusion matrix is visualized using a heatmap.

Visualizations:

Target Class Distribution: Bar plot showing the distribution of heart disease cases.

Age Distribution by Target: Histogram showing how age correlates with the presence of heart disease.

Chest Pain Type vs Target: Proportional bar plot showing the relationship between chest pain types and heart disease.

Gender vs Target: Proportional bar plot showing how gender correlates with heart disease.

Correlation Heatmap: Visualizing correlations between numerical features.

Resting Blood Pressure by Target: Boxplot of resting blood pressure by heart disease status.

Max Heart Rate by Target: Boxplot of max heart rate by heart disease status.

Model Accuracy vs Complexity Parameter: Plot showing how the model's accuracy varies with the complexity parameter (cp).

Feature Importance: Bar plot showing the importance of each feature in predicting heart disease.

Cholesterol vs Age colored by Target: Scatter plot of cholesterol levels versus age, colored by the presence of heart disease.
