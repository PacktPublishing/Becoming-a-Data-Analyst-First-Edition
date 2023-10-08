import numpy as np

plastic_recycled = np.array([200, 300, 400, 250, 600, 350, 275])
print(plastic_recycled)

first_day = plastic_recycled[0]
last_day = plastic_recycled[-1]
print(f"First day: {first_day}, Last day: {last_day}")

weekdays_recycled = plastic_recycled[:5]
print(weekdays_recycled)

total_recycled = np.sum(plastic_recycled)
average_recycled = np.mean(plastic_recycled)
print(f"Total recycled: {total_recycled}, Average recycled: {average_recycled}")

glass_recycled = np.array([150, 200, 250, 300, 200, 100, 50])
# Calculating mean, median and variance
mean_glass = np.mean(glass_recycled)
median_glass = np.median(glass_recycled)
variance_glass = np.var(glass_recycled)
print(f"Mean: {mean_glass}, Median: {median_glass}, Variance: {variance_glass}")

plastic_recycled = np.array([200, 300, 400, 250, 600, 350, 275])
glass_recycled = np.array([150, 200, 250, 300, 200, 100, 50])
# Element-wise addition
total_recycled_daily = plastic_recycled + glass_recycled
# Element-wise subtraction
difference_recycled_daily = plastic_recycled - glass_recycled
# Element-wise multiplication
multiplied_recycled_daily = plastic_recycled * glass_recycled
print(f"Total recycled daily: {total_recycled_daily}")
print(f"Difference recycled daily: {difference_recycled_daily}")
print(f"Multiplied recycled daily: {multiplied_recycled_daily}")

recycled_2d = np.array([[200, 300, 400, 250, 600, 350, 275],  # City 1
                        [150, 200, 250, 300, 200, 100, 50]])  # City 2
print(recycled_2d)

city_1_recycled = recycled_2d[0]
print(city_1_recycled)

city_2_day_3_recycled = recycled_2d[1][2]
print(city_2_day_3_recycled)



# Load the data, skipping the first row (header) and the first column (Week numbers)
weekly_data = np.loadtxt('weekly_recycling_data.csv', delimiter=',', skiprows=1, usecols=(1, 2, 3))
print(weekly_data)

# Calculate the total and average recycling for each material
total_recycling_weekly = np.sum(weekly_data, axis=0)
average_recycling_weekly = np.mean(weekly_data, axis=0)

print(f"Total recycling weekly: {total_recycling_weekly}")
print(f"Average recycling weekly: {average_recycling_weekly}")

