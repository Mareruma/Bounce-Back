extends Node

var time: float = 0.0
var is_timer_running: bool = false

func _process(delta: float) -> void:
	if is_timer_running:
		time += delta
