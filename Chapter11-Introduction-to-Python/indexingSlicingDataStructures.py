city = "New York"
first_letter = city[0]
print(first_letter)

city= "New York"
second_last_letter = city[-2]
print(second_last_letter)

city = "New Jersey"
selected_text = city[4:]
print(selected_text)

waste_types = ["plastic", "glass", "aluminium"]
print(waste_types)

# Get the first item
first_item = waste_types[0]
print(first_item)  # Output: 'plastic'

# Get the last item
last_item = waste_types[-1]
print(last_item)  # Output: 'aluminium'

list_length = len(waste_types)
print(list_length)  # Output: 

waste_types.append("paper")
print(waste_types)  

additional_waste_types = ["organic", "e-waste"]
waste_types.extend(additional_waste_types)
print(waste_types)  

waste_types.remove("glass")
print(waste_types)  

waste_types.sort()
print(waste_types)  

count_plastic = waste_types.count("plastic")
print(count_plastic)  

index_aluminium = waste_types.index("aluminium")
print(index_aluminium)  

waste_types.reverse()
print(waste_types)  

waste_recycled_kg = {"plastic": 1200, "glass": 800, "aluminium": 1500} 
print(waste_recycled_kg)

plastic_recycled = waste_recycled_kg["plastic"]
print(plastic_recycled)

dict_size = len(waste_recycled_kg)
print(dict_size)  # Output: 3

waste_recycled_kg["paper"] = 900
print(waste_recycled_kg)  

waste_recycled_kg["aluminium"] = 1600
print(waste_recycled_kg)  

waste_recycled_kg.pop("glass")
print(waste_recycled_kg)  

print("glass" in waste_recycled_kg)  # Output: False

print(waste_recycled_kg.keys())  
# Output: dict_keys(['plastic', 'aluminium', 'paper'])
print(waste_recycled_kg.values())  
# Output: dict_values([1200, 1600, 900])

cities = {"New York", "San Francisco", "Chicago", "New York"}
print(cities)

set_size = len(cities)
print(set_size)  # Output: 3

cities.add("Los Angeles")
print(cities)  

cities.remove("Chicago")
print(cities)  

print("Chicago" in cities) 

cities = {"New York", "San Francisco", "Los Angeles"}
other_cities = {"Boston", "Miami", "New York"}
all_cities = cities.union(other_cities)
print(all_cities) 

cities = {"New York", "San Francisco", "Los Angeles"}
other_cities = {"Boston", "Miami", "New York"}
common_cities = cities.intersection(other_cities)
print(common_cities)  

cities = {"New York", "San Francisco", "Los Angeles"}
other_cities = {"Boston", "Miami", "New York"}
unique_cities = cities.difference(other_cities)
print(unique_cities)  

office_location = (40.7128, -74.0060)  # coordinates for New York
print(office_location)

latitude = office_location[0]
print(latitude)

waste_data = {
    (40.7128, -74.0060): {"plastic": 1200, "glass": 800, "aluminium": 1500},  # New York
    (34.0522, -118.2437): {"plastic": 900, "glass": 700, "aluminium": 1200}   # Los Angeles
}

# Accessing data for New York
new_york_data = waste_data[(40.7128, -74.0060)]
print(new_york_data)  

x = 3
y = 10
if x > y:
    print("x is greater than y!")

x = 30
y = 10
if x > y:
    print("x is greater than y!")

x = 3
y = 10
if x > y:
    print("x is greater than y!")
else:
    print("x is smaller than or equal to y!")

x = 3
y = 10
z = 5
if x > y:
    print("x is greater than y!")
elif x > z:
    print("x is greater than z!")
else:
    print("x is smaller than or equal to z!")

waste_recycled_kg = {"plastic": 1200, "glass": 800, "aluminium": 1500}

if "plastic" in waste_recycled_kg:
    plastic_kg = waste_recycled_kg["plastic"]
    print(f"Plastic: {plastic_kg} kg")
elif "glass" in waste_recycled_kg:
    glass_kg = waste_recycled_kg["glass"]
    print(f"Glass: {glass_kg} kg")
elif "aluminium" in waste_recycled_kg:
    aluminium_kg = waste_recycled_kg["aluminium"]
    print(f"Aluminium: {aluminium_kg} kg")
else:
    print("No data available for the specified materials.")

waste_recycled_kg = {"plastic": 1200, "glass": 800, "aluminium": 1500}

if "plastic" in waste_recycled_kg:
    plastic_kg = waste_recycled_kg["plastic"]
    print(f"Plastic: {plastic_kg} kg")
if "glass" in waste_recycled_kg:
    glass_kg = waste_recycled_kg["glass"]
    print(f"Glass: {glass_kg} kg")
if "aluminium" in waste_recycled_kg:
    aluminium_kg = waste_recycled_kg["aluminium"]
    print(f"Aluminium: {aluminium_kg} kg")


