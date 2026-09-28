class_name Hud
extends Control

@onready var stone_label: Label = %StoneLabel
@onready var gold_label: Label = %GoldLabel
@onready var diamond_label: Label = %DiamondLabel
@onready var uranium_label: Label = %UraniumLabel
@onready var depth_label: Label = %DepthLabel


func _ready() -> void:
	GameManager.ore_changed.connect(update_label)
	GameManager.depth_changed.connect(update_depth_label)
	init_labels()


func update_label(ore: String) -> void:
	var set_label_name = ore + "_label"
	var get_var_name: Label = get(set_label_name)
	get_var_name.text = FormatingNumber.format_number(GameManager.ores[ore.to_lower()]["currency"])


func update_depth_label() -> void:
	depth_label.text = "Current Depth : " + str(GameManager.current_depth)


func init_labels() -> void:
	stone_label.text = str(GameManager.ores["stone"]["currency"])
	gold_label.text = str(GameManager.ores["gold"]["currency"])
	diamond_label.text = str(GameManager.ores["diamond"]["currency"])
	uranium_label.text = str(GameManager.ores["uranium"]["currency"])
