extends CanvasLayer
@onready var score_label = $Control/MarginContainer/HBoxContainer/Score

func update_score(new_score: int):
	score_label.text = "Level: " + str(new_score)
