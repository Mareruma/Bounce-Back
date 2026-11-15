extends CanvasLayer
@onready var score_label = $Control/MarginContainer/HBoxContainer/Score
@onready var time_label = $Control/MarginContainer/HBoxContainer/Time

var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	time_label.text = "%.2f" % time
	
func update_score(new_score: int):
	score_label.text = "Level: " + str(new_score)
