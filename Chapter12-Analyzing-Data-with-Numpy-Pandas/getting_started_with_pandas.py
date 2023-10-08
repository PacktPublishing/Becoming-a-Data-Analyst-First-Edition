import pandas as pd

plastic_recycled_series = pd.Series([200, 300, 400, 250, 600, 350, 275])
print(plastic_recycled_series)

recycled_data = {
    'Plastic': [200, 300, 400, 250, 600, 350, 275],
    'Glass': [150, 200, 250, 300, 200, 100, 50],
    'Aluminium': [100, 150, 200, 150, 300, 200, 175]
}
recycled_df = pd.DataFrame(recycled_data)
print(recycled_df)

recycling_data_csv = pd.read_csv('recycling_data.csv')

# Viewing the first 5 rows of the DataFrame
# print(recycling_data_csv.head())
# Viewing the last 5 rows of the DataFrame
# print(recycling_data_csv.tail())
# # Getting a summary of the DataFrame
# print(recycling_data_csv.info())
# # Getting statistical summary
# print(recycling_data_csv.describe())

missing_data = recycling_data_csv.isnull()
print(missing_data)
# Filling missing data
filled_data = recycling_data_csv.ffill()
print(filled_data)
filled_data_b = recycling_data_csv.bfill()
print(filled_data_b)

# Dropping rows with missing data
clean_data = recycling_data_csv.dropna()
print(clean_data)

# Continue with the bfill data
recycling_data_csv = recycling_data_csv.bfill()

# Add a column
numeric_data = recycling_data_csv.drop(columns='Date')
print(numeric_data)

recycling_data_csv['Total'] = numeric_data.sum(axis=1)
print(recycling_data_csv)

recycling_data_csv.rename(columns={'Total': 'Total Recycled'}, inplace=True)
print(recycling_data_csv)

sorted_data = recycling_data_csv.sort_values(by='Total Recycled')
print(sorted_data)

# Save the DataFrame
sorted_data.to_csv('cleaned_recycling_data.csv', index=False)