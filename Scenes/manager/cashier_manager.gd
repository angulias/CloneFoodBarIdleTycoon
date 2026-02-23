extends Node
class_name CashierManager

@export var cashier_scene: PackedScene
@export var spawn_pos: Marker2D

var cashier_list: Array[Cashier] = []

func _ready() -> void:
	GameManager.on_customer_request.connect(_on_customer_request)
	add_cashier()

func add_cashier() -> void:
	var new_cashier: Cashier = cashier_scene.instantiate()
	add_child(new_cashier)
	new_cashier.position = spawn_pos.position
	cashier_list.append(new_cashier)

func _on_customer_request(customer: Customer) -> void:
	var free_cashiers: Array[Cashier] = cashier_list.filter(func(x: Cashier): return x.current_customer == null)
	if not free_cashiers:
		return
	
	var random_cashier: Cashier = free_cashiers.pick_random()
	if random_cashier: 
		random_cashier.set_customer(customer)
		random_cashier.take_order()
