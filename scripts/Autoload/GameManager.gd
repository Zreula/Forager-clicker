extends Node

signal depth_changed()
signal ore_changed(ore: String)

const FIRST_FLOOR: int = 70000 # Earth's Crust
const SECOND_FLOOR: int = 2890000 # The mantle
const THIRD_FLOOR: int = 5150000 # The core
const MAX_DEPTH: int = 63710000 # Seed

var current_depth: int = 0 # Display current depth

## "unlocked" -> check if the player milestone is reached(true is unlocked) | "value" ->  multiplier of the value of the ore
var ores: Dictionary = {
	"stone": { "unlocked": true, "value": 1.0, "currency": 0 },
	"gold": { "unlocked": false, "value": 1.6, "currency": 0 },
	"diamand": { "unlocked": false, "value": 2.0, "currency": 0 },
	"uranium": { "unlocked": false, "value": 3.0, "currency": 0 },
}


## Increase the currency of the selected resources and emit signals
func mining(ore: String, amount: int) -> void:
	ores[ore]["currency"] += int(amount * ores[ore]["value"])
	current_depth += amount
	depth_changed.emit()
	ore_changed.emit(ore)
