extends Node2D
class_name Cashier

@export var move_speed := 50.0

@onready var cook_bar: CookBar = $CookBar
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var current_customer: Customer
var counter_pos: Vector2
var item_counter_pos: Vector2
var item_request: Item

func set_customer(customer: Customer) -> void:
	current_customer = customer
	customer.being_served = true
	item_request = customer.request_item
	counter_pos = Vector2(customer.position.x, customer.position.y + 160)
	item_counter_pos = GameManager.get_item_pos(item_request)

func take_order() -> void:
	move_to_customer()
	await get_tree().create_timer(1.1).timeout
	current_customer.show_request()
	move_to_item_position()

func move_to_customer() -> void:
	var tween := create_tween()
	tween.tween_property(self, "position", counter_pos, 1.0)
	animation_player.play("move")

func move_to_item_position() -> void:
	animation_player.play("move")
	
	var tween := create_tween()
	tween.tween_property(self, "position", item_counter_pos, 1.0)
	tween.tween_interval(0.3)
	tween.finished.connect(func(): start_cook_time())

func start_cook_time() -> void:
	animation_player.play("Idle")
	cook_bar.show()
	cook_bar.cook_item(item_request.cook_time)

func deliver_order() -> void:
	print("cook completed")

func _on_cook_bar__on_cook_completed() -> void:
	cook_bar.hide()
	cook_bar.reset_bar()
	deliver_order()
