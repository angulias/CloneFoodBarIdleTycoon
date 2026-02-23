extends Node

signal on_customer_request(customer: Customer)
signal on_customer_order_completed(customer:Customer)

@export var coffee: Item
@export var burger: Item

var coffee_counter_pos := Vector2(425, 1250)
var burger_counter_pos := Vector2(680, 1250)
var current_coins: int

func get_random_item() -> Item:
	var items: Array[Item] = [coffee, burger]
	return items.pick_random()

func get_item_pos(item: Item) -> Vector2:
	match item.type:
		Item.ItemType.Coffee:
			return coffee_counter_pos
		Item.ItemType.Burger:
			return burger_counter_pos
	return Vector2.ZERO
