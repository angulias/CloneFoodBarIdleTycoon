extends Node

signal on_customer_request(customer: Customer)

@export var coffee: Item
@export var burger: Item

func get_random_item() -> Item:
	var items: Array[Item] = [coffee, burger]
	return items.pick_random()
