extends Control

@onready var stone_label: Label = %StoneLabel
@onready var gold_label: Label = %GoldLabel
@onready var diamand_label: Label = %DiamandLabel
@onready var uranium_label: Label = %UraniumLabel
@onready var depth_label: Label = %DepthLabel


func _ready() -> void:
	GameManager.ore_changed.connect(update_label)
	GameManager.depth_changed.connect(update_depth_label)


func update_label(ore: String) -> void:
	var set_label_name = ore + "_label"
	var get_var_name: Label = get(set_label_name)
	get_var_name.text = str(GameManager.ores[ore.to_lower()]["currency"])


func update_depth_label() -> void:
	depth_label.text = "Current Depth : " + str(GameManager.current_depth)
