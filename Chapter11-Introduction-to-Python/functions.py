def calculate_waste_left(total_waste, waste_recycled):
    return total_waste - waste_recycled


waste = 5000
recycled = 3200
waste_left = calculate_waste_left(waste, recycled)

print(f"After recycling, there will be {waste_left} kilograms of waste left.")


waste_left1 = calculate_waste_left(300, 250)
waste_left2 = calculate_waste_left(1000, 200)
waste_left3 = calculate_waste_left(14, 7)


# Assume greenFuture is currently operating in 3 cities
current_cities = 3

# They plan to expand to 10 cities over the next 7 years
target_cities = 10

# Each city recycles 1000 kg of waste per year
recycle_per_city_per_year = 1000

# We'll project the total waste recycled over the next 7 years
for year in range(1, 8):  
    # Assume greenFuture expands to 1 new city each year
    current_cities += 1
    total_recycled_this_year = current_cities * recycle_per_city_per_year
    print(f"Year {year}:")
    print(f"  Cities operating: {current_cities}")
    print(f"  Total waste recycled this year: {total_recycled_this_year} kg")
    print("-" * 45)


def calculate_waste_left(total_waste, waste_recycled):
    return abs(total_waste - waste_recycled)

total_waste = int(input("Enter the total amount of waste: "))
waste_recycled = int(input("Enter the amount of waste recycled: "))
waste_left = calculate_waste_left(total_waste, waste_recycled)

# Round waste left to 2 decimal places
rounded_waste_left = round(waste_left, 2)  

output_message = "After recycling, there will be {} kilograms of waste left.".format(
    rounded_waste_left
)
print(output_message)


