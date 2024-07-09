### README for Global Renewable Energy Production Analysis

## Project Title: Global Renewable Energy Production Analysis

### Description
This project analyzes global renewable energy production data using Random Forest and GridSearchCV for modeling, and SQL for extracting insights. The primary goal is to predict total renewable energy production.

### Data
The dataset includes:
- `year`, `country`, `solar_energy`, `wind_energy`, `hydro_energy`, `other_renewable_energy`, `total_renewable_energy`.

### Methods
- **Data Preprocessing**: Encoded `country` using LabelEncoder.
- **Model Training**: Used `RandomForestRegressor` with a train-test split (80/20).
- **Hyperparameter Tuning**: GridSearchCV with parameters:
  ```python
  param_grid = {
      'n_estimators': [50, 100, 200],
      'max_depth': [None, 10, 20, 30],
      'min_samples_split': [2, 5, 10],
      'min_samples_leaf': [1, 2, 4]
  }

### Evaluation Metrics
- **MAE**: 128.84
- **R-squared (R²)**: Indicates model fit

### SQL Insights
Queried data for insights:
- Total renewable energy by country and year.
- Average production by energy source and country.

### Results
- **RMSE**: 155.63
- **MAE**: 128.84
- **R2Score**: 0.9453
### Conclusion
The Random Forest model with GridSearchCV effectively predicts total renewable energy production. 
SQL queries provide valuable insights into data trends.


### Usage
1. Run the script to preprocess data, train the model, and evaluate its performance.
2. Use the provided SQL queries for further data exploration.

### License
This project is licensed under the MIT License.

