extends Node2D
class_name Customer

@onready var body: Sprite2D = %Body
@onready var face: Sprite2D = %Face
@onready var hand_left: Sprite2D = %HandLeft
@onready var hand_right: Sprite2D = %HandRight
@onready var anim_player: AnimationPlayer = $AnimationPlayer
@onready var item_box: Control = $ItemBox
@onready var item_img: TextureRect = %ItemImg
@onready var item_label: Label = %ItemLabel

var request_item: Item
var request_quantity: int
var current_order_status: int

var counter_pos: Vector2
var being_served: bool

func init_customer(item: Item, quantity: int) -> void:
	request_item = item
	request_quantity = quantity
	current_order_status = quantity
	#show_request()

func set_sprites(data: CustomerData) -> void:
	body.texture = data.body
	face.texture = data.face
	hand_left.texture = data.hand
	hand_right.texture = data.hand

func move_to_counter() -> void:
	play_move_anim()
	var counter_top_pos := Vector2(counter_pos.x, position.y)
	var tween := create_tween()
	
	tween.tween_property(self, "position", counter_top_pos, 1.0)
	tween.tween_interval(0.2)
	tween.tween_property(self, "position", counter_pos, 1.0)
	tween.tween_interval(0.5)
	
	tween.finished.connect(
		func(): 
			anim_player.play("Idle")
			GameManager.on_customer_request.emit(self))

func show_request() -> void:
	item_box.show()
	item_img.texture = request_item.sprite
	item_label.text = str(request_quantity)

func play_move_anim() -> void:
	anim_player.play("move")
