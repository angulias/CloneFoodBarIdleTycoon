extends Node
class_name CounterManager

@export var counter_positions: Array[Marker2D]

var counter: Dictionary[int, Customer] = {
	0: null,
	1: null,
	2: null,
	3: null
}

func get_free_index() -> int:
	for key in counter:
		if counter[key] == null:
			return key
	return -1

func assign_customer(customer: Customer) -> void:
	var index := get_free_index()
	if index == -1:
		return
	
	counter[index] = customer
	var free_counter_pos: Vector2 = counter_positions[index].position
	customer.counter_pos = free_counter_pos
