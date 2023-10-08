cities = ["Boston", "Denver", "Los Angeles", "Seattle"]

print(cities[0])
print(cities[1])
print(cities[2])
print(cities[3])

cities = ["Boston", "Denver", "Los Angeles", "Seattle"]

for city in cities:
    print(city)

cities = ["Boston", "Denver", "Los Angeles", "Seattle"]

for x in cities:
    print(x)

waste_recycled = {"plastic": 1200, "glass": 800, "aluminium": 1500} 
for category, amount in waste_recycled.items():
    print(f"greenFuture has recycled {amount} kilograms of {category}.")


total_recycled = 0
goal = 5000

while total_recycled < goal:
    # let's say we recycle 1000 kilograms each week
    total_recycled += 1000  
    print(f"Total recycled so far: {total_recycled} kilograms")

print("Goal reached!")


cities = ["New York", "Los Angeles", "Chicago", "Houston", "Phoenix"]
target_city = "Chicago"

for city in cities:
    print(f"Currently looping over {city}.")
    if city == target_city:
        print(f"{target_city} is in the list of cities.")
        break  # Exit the loop when the target city is found


waste_types = ["plastic", "glass", "aluminium", "paper", "organic"]

for waste in waste_types:
    if waste == "glass":
        continue  # Skip rest of the code in this iteration
    print(waste)


