# weights in kilograms
plastic = 1300
glass = 700
aluminium = 800

total_recycled = plastic + glass + aluminium
print(total_recycled)

# weights in kilograms
plastic = 1300
glass = 700
aluminium = 800

# increase factor
increase_factor = 1.15

# calculating expected weights of each type of waste
expected_plastic = plastic * increase_factor 
expected_glass = glass * increase_factor 
expected_aluminium = aluminium * increase_factor 

print(expected_plastic, expected_glass, expected_aluminium)

print(f'{expected_plastic:.2f}, {expected_glass:.2f}, {expected_aluminium:.2f}')

# weights in kilograms
plastic = 1300
glass = 700
aluminium = 800

# calculate total
total_recycled = plastic + glass + alumunium
# checking if the target is met
is_target_met = total_recycled >= 3000

print(is_target_met)

# weights in kilograms
plastic = 1300
glass = 700
aluminium = 800

# increase factor
increase_factor = 1.15

# calculating expected weights of each type of waste
expected_plastic = plastic * increase_factor 
expected_glass = glass * increase_factor 
expected_aluminium = aluminium * increase_factor 

# checking if any waste type has a weight greater than or equal to 1500 or a weight less than or equal to 600
check_condition_1 = expected_plastic >= 1500 or expected_glass <= 600 or expected_aluminium >= 1500
print(check_condition_1)  # Output: False

# checking if any waste type has a weight between 1000 and 1200
check_condition_2 = 1000 <= expected_plastic <= 1200 or 1000 <= expected_glass <= 1200 or 1000 <= expected_aluminium <= 1200
print(check_condition_2)  # Output: False

# checking if all waste types have an expected weight greater than 800
check_condition_3 = expected_plastic > 800 and expected_glass > 800 and expected_aluminium > 800
print(check_condition_3)  # Output: True

# checking if not all waste types have an expected weight greater than 800
check_condition_4 = not (expected_plastic > 800 and expected_glass > 800 and expected_aluminium > 800)
print(check_condition_4)  # Output: False

