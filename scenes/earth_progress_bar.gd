extends ProgressBar


func _ready() -> void:
	max_value = GameManager.FIRST_FLOOR
	value = max_value
