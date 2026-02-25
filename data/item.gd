extends Resource
class_name Item

signal on_star_reached

enum ItemType {
	Coffee,
	Burger
}

@export var id: String
@export var type: ItemType
@export var sprite: Texture2D

@export_group("Cook")
@export var cook_time := 10.0
@export var cook_time_reduce_perc := 0.5

@export_group("Upgrade")
@export var upgrade_cost := 3.0
@export var upgrade_multi := 1.3

@export_group("Profit")
@export var profit := 4.0
@export var profit_multi := 1.2

var max_level := 75

var current_level := 0

func update_item() -> void:
	if current_level >= max_level:
		return
	
	current_level += 1
	upgrade_cost = ceil(upgrade_cost * upgrade_multi)
	profit = ceil(profit * profit_multi)
	if current_level % 25 == 0:
		cook_time = ceil(cook_time * cook_time_reduce_perc)
		upgrade_cost *= 3
		profit *= 3
		on_star_reached.emit()
