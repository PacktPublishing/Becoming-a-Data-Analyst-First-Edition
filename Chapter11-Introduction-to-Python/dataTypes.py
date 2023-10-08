city = "New York"
print(city)

city = "New York"
message = "GreenFuture operates in " + city
print(message)

employees = 50
print(employees)

average_waste_per_person = 0.87  # in kilograms
print(average_waste_per_person)

employees = 50
is_greater = employees > 40
print(is_greater) 

average_waste_per_person = 0.87 
print(type(average_waste_per_person))

average_waste_per_person_int = int(average_waste_per_person)
print(average_waste_per_person_int)
print(type(average_waste_per_person_int))

# Collecting daily recycling input from the user
daily_recycling_input = input("Enter the number of plastic bottles recycled today: ")

# Printing the type of daily_recycling_input to show it's a string
print(type(daily_recycling_input))  # Output: <class 'str'>

# Converting the string input to an integer
daily_recycling_int = int(daily_recycling_input)

# Now we can perform numerical operations
weekly_recycling_total = daily_recycling_int * 7

# Printing the weekly recycling total
print(f"The total number of plastic bottles recycled in a week is: {weekly_recycling_total}")

# GreenFuture data
daily_recycling_kg = 350.5  # daily recycling in kilograms
weekly_goal_kg = 2450  # weekly recycling goal in kilograms

# Convert daily_recycling_kg to string for concatenation
daily_recycling_str = str(daily_recycling_kg)
print("Daily recycling: " + daily_recycling_str + " kg")  
# Output: Daily recycling: 350.5 kg

# Convert weekly_goal_kg to float for decimal arithmetic
weekly_goal_float = float(weekly_goal_kg)
print("Weekly goal: " + str(weekly_goal_float) + " kg")  
# Output: Weekly goal: 2450.0 kg

# Check if daily recycling goal is met and convert the result to boolean
is_daily_goal_met = bool(daily_recycling_kg >= (weekly_goal_float / 7))
print("Is daily goal met? " + str(is_daily_goal_met))  
# Output: Is daily goal met? True

