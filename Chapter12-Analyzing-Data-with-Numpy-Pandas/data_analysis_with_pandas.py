import pandas as pd

recycling_data_csv = pd.read_csv('recycle_data_city.csv')
recycling_data_csv['Total'] = recycling_data_csv[['Plastic', 'Glass', 'Aluminium', 'Paper']].sum(axis=1)
# print(recycling_data_csv)


# Grouping data by City
grouped_data = recycling_data_csv.groupby('City')
print(grouped_data)

# Aggregating data
aggregated_data = grouped_data.sum()
print(aggregated_data)

# Finding the city with the highest recycling
top_city = aggregated_data['Total'].idxmax()
print(f'The city with the highest recycling is {top_city}.')