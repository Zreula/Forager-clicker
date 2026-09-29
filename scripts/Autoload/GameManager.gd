extends Node

signal depth_changed()
signal ore_changed(ore: String)

const FIRST_FLOOR: float = 70000 # Earth's Crust
const SECOND_FLOOR: float = 2890000 # The mantle
const THIRD_FLOOR: float = 5150000 # The core
const MAX_DEPTH: float = 63710000 # Seed

var current_depth: int = 0 # Display current depth
enum ORES { STONE, GOLD, DIAMOND, URANIUM }
# "unlocked" -> check if the player milestone is reached(true is unlocked) |
#"value" ->  multiplier of the value of the ore
var ores: Dictionary = {
	"stone": { "unlocked": true, "unlock_floor": 0, "value": 1.0, "currency": 0 },
	"gold": { "unlocked": false, "unlock_floor": FIRST_FLOOR, "value": 1.6, "currency": 0 },
	"diamond": { "unlocked": false, "unlock_floor": SECOND_FLOOR, "value": 2.0, "currency": 0 },
	"uranium": { "unlocked": false, "unlock_floor": THIRD_FLOOR, "value": 3.0, "currency": 0 },
}


## Increase the currency of the selected resources and emit signals
func mining(ore: String, amount: int) -> void:
	ores[ore]["currency"] += int(amount * ores[ore]["value"])
	current_depth += amount
	depth_changed.emit()
	ore_changed.emit(ore)
