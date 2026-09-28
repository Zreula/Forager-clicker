extends Node


func format_number(number: int) -> String:
	var base_number = number
	var final_number: String
	var new_m
	var new_k
	var new_c

	new_m = check_format_number(roundi(base_number / 1000000))
	base_number = base_number % 1000000
	new_k = check_format_number(roundi(base_number / 1000))
	base_number = base_number % 1000
	new_c = base_number
	if int(new_m) != 0 and int(new_k) == 0:
		new_k = "000,"
		new_c = "000"
	if int(new_k) != 0 and int(new_c) == 0:
		new_c = "000"
	final_number = str(new_m, new_k, new_c)

	return final_number


func check_format_number(number: int) -> String:
	if number == 0:
		return ""
	return str(number, ",")
