class_name ToolTemplate
extends Resource

@export var tool_name: String # name of the tool
@export var tool_cost: int # shop cost
@export var tool_efficiency: float # meters
@export var unlock_floor: float
@export var ore_type: GameManager.ORES
@export var tool_interval: float
var timer = Timer.new()
