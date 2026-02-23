extends Node2D
class_name Cashier

@export var move_speed := 50.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var current_customer: Customer
var counter_pos: Vector2

func set_customer(customer: Customer) -> void:
	current_customer = customer
	customer.being_served = true
	counter_pos = Vector2(customer.position.x, customer.position.y + 160)

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
	#var tween := create_tween()
	#tween.tween_property(self, "position", counter_pos, 1.0)
	#animation_player.play("move")
	
	# MOVE
	# START COOK TIME
	animation_player.play("Idle")
