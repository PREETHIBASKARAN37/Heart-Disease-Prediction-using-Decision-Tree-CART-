# Install necessary packages
install.packages(c("tidyverse", "caret", "rpart", "rpart.plot", "reshape2", "corrplot"))

# Load libraries
library(tidyverse)
library(caret)
library(rpart)
library(rpart.plot)
library(reshape2)
library(corrplot)

# Load dataset
heart <- read.csv("C:/Users/preethi/Downloads/heart.csv")

# Convert target variable
heart$target <- as.factor(heart$target)

# Set seed for reproducibility
set.seed(123)

# Define cross-validation method: 10-fold CV
ctrl <- trainControl(method = "cv", number = 10)

# Train CART model with cross-validation
cart_model <- train(target ~ ., 
                    data = heart, 
                    method = "rpart", 
                    trControl = ctrl)

# Print model summary
print(cart_model)

# Visualize the decision tree
rpart.plot(cart_model$finalModel, extra = 106, main = "Decision Tree for Heart Disease Prediction (10-Fold CV)")

# Predict on the full dataset (or replace with separate test set if needed)
predictions <- predict(cart_model, newdata = heart)

# Confusion matrix
conf_matrix <- confusionMatrix(predictions, heart$target)
print(conf_matrix)

# Confusion Matrix Visualization
cm <- table(Predicted = predictions, Actual = heart$target)
cm_melted <- melt(cm)
ggplot(cm_melted, aes(x = Actual, y = Predicted, fill = value)) +
  geom_tile(color = "white") +
  geom_text(aes(label = value), size = 5, color = "white") +
  scale_fill_gradient(low = "lightgreen", high = "darkgreen") +
  ggtitle("Confusion Matrix (10-Fold CV): Heart Disease Prediction")

#visualization 

# 1. Target Class Distribution

ggplot(heart, aes(x = target, fill = target)) +
  geom_bar() +
  labs(title = "Target Variable Distribution", x = "Heart Disease", y = "Count") +
  scale_fill_manual(values = c("skyblue", "tomato"))


# 2. Age Distribution by Target

ggplot(heart, aes(x = age, fill = target)) +
  geom_histogram(binwidth = 5, position = "dodge") +
  labs(title = "Age Distribution by Target", x = "Age", y = "Count")


# 3. Chest Pain Type vs Target

ggplot(heart, aes(x = factor(cp), fill = target)) +
  geom_bar(position = "fill") +
  labs(title = "Chest Pain Type vs Target", x = "Chest Pain Type", y = "Proportion") +
  scale_y_continuous(labels = scales::percent)


# 4. Gender vs Target

ggplot(heart, aes(x = factor(sex), fill = target)) +
  geom_bar(position = "fill") +
  labs(title = "Sex vs Heart Disease", x = "Sex (0 = Female, 1 = Male)", y = "Proportion") +
  scale_y_continuous(labels = scales::percent)


# 5. Correlation Heatmap

numeric_heart <- heart %>% select_if(is.numeric)
cor_matrix <- cor(numeric_heart)
corrplot(cor_matrix, method = "color", type = "upper", tl.cex = 0.8)


# 6. Resting Blood Pressure by Target

ggplot(heart, aes(x = target, y = trestbps, fill = target)) +
  geom_boxplot() +
  labs(title = "Resting Blood Pressure by Heart Disease Status", x = "Heart Disease", y = "Resting BP")


# 7. Max Heart Rate by Target

ggplot(heart, aes(x = target, y = thalach, fill = target)) +
  geom_boxplot() +
  labs(title = "Max Heart Rate by Target", x = "Heart Disease", y = "Max Heart Rate")


# Train CART Model with 10-Fold Cross-Validation

set.seed(123)
ctrl <- trainControl(method = "cv", number = 10)
cart_model <- train(target ~ ., data = heart, method = "rpart", trControl = ctrl)


# 8. Model Accuracy vs Complexity Parameter

ggplot(cart_model$results, aes(x = cp, y = Accuracy)) +
  geom_line() +
  geom_point() +
  labs(title = "Model Accuracy vs Complexity Parameter", x = "cp", y = "Accuracy")


# 9. Feature Importance Plot

importance <- varImp(cart_model)$importance
importance$Feature <- rownames(importance)
ggplot(importance, aes(x = reorder(Feature, Overall), y = Overall)) +
  geom_col(fill = "steelblue") +
  coord_flip() +
  labs(title = "Feature Importance", x = "Feature", y = "Importance")


# 10. Cholesterol vs Age colored by Target

ggplot(heart, aes(x = age, y = chol, color = target)) +
  geom_point(alpha = 0.7) +
  labs(title = "Cholesterol vs Age by Target", x = "Age", y = "Cholesterol")
