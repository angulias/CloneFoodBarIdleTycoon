extends Node2D
class_name Cashier

@export var move_speed := 50.0

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func move_to_customer() -> void:
	# CREATE TWEEN
	# MOVE
	animation_player.play("move")

func move_to_item_position() -> void:
	# CREATE TWEEN
	# MOVE
	# START COOK TIME
	animation_player.play("Idle")
