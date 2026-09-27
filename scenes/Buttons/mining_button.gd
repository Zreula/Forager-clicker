class_name MiningButton
extends Button


func _ready() -> void:
	pass


func _on_pressed() -> void:
	GameManager.mining("stone", 1)
