extends CanvasLayer
class_name GameUI

@onready var coffee_upgrade_panel: UpgradePanel = $CoffeeUpgradePanel
@onready var burger_upgrade_panel: UpgradePanel = $BurgerUpgradePanel

func _ready() -> void:
	coffee_upgrade_panel.init_upgrade_panel(GameManager.coffee)
	burger_upgrade_panel.init_upgrade_panel(GameManager.burger)


func _on_coffee_button_pressed() -> void:
	SoundManager.play_ui()
	burger_upgrade_panel.visible = false
	coffee_upgrade_panel.visible = true if not coffee_upgrade_panel.visible else false

func _on_burger_button_pressed() -> void:
	SoundManager.play_ui()
	coffee_upgrade_panel.visible = false
	burger_upgrade_panel.visible = true if not burger_upgrade_panel.visible else false
