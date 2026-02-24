extends Control
class_name UpgradePanel

@onready var level: Label = %Level
@onready var item_name: Label = %ItemName
@onready var h_box_star: HBoxContainer = %HBoxStar
@onready var progress_bar: ProgressBar = %ProgressBar
@onready var profit: Label = %Profit
@onready var cook_time: Label = %CookTime
@onready var upgrade_button: Button = %UpgradeButton

var item_ref: Item
var max_value: int
var current_level: int
var current_stars: int = -1

func init_upgrade_panel(item: Item) -> void:
	item_ref = item
	max_value = item.max_level
	progress_bar.value = 0
	update_stats()

func update_stats() -> void:
	item_name.text = item_ref.id
	level.text = "Lv. %s" % item_ref.current_level
	profit.text = str(item_ref.profit)
	cook_time.text = str(item_ref.cook_time)
	upgrade_button.text = str(item_ref.upgrade_cost)
