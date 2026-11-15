extends Node

var time: float = 0.0
var is_timer_running: bool = false
var level_times: Array[float] = []
var izveletais_skins = 1
var izveleta_tekstura: Texture2D = preload("res://Assets/pixil-frame-0 (1).png")

func _process(delta: float) -> void:
	if is_timer_running:
		time += delta

func addTime(new_time: float):
	level_times.append(new_time)

func get_average(numbers: Array[float]) -> float:
	if numbers.is_empty():
		return 0.0
		
	var sum: float = numbers.reduce(func(accum, number): return accum + number, 0.0)
	return sum / numbers.size()
