class_name Tools
extends Node

var tool_resource: ToolTemplate
var timer = Timer.new()

func _ready() -> void:
	timer.wait_time = tool_resource.tool_interval
	timer.auto_start = true
	timer.timeout.connect(GameManager.mining.bind(tool_resource.ore_type, tool_resource.tool_efficiency))
	add_child(timer)



