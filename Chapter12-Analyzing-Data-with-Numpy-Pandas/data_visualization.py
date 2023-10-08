import pandas as pd
import matplotlib.pyplot as plt  # Importing Matplotlib

recycling_data_csv = pd.read_csv('recycle_data_city.csv')

recycling_data_csv['Total'] = recycling_data_csv[['Plastic', 'Glass', 'Aluminium', 'Paper']].sum(axis=1)

grouped_data = recycling_data_csv.groupby('City')
aggregated_data = grouped_data.sum()

ax = aggregated_data['Total'].plot(kind='bar', color='skyblue', figsize=(10, 6))
ax.set_title('Total Recycled per City')
ax.set_xlabel('City')
ax.set_ylabel('Total Recycled (kg)')

plt.show()  # Displaying the plot
