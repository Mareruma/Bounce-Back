extends Control

@onready var global_time = $MarginContainer/VBoxContainer/GlobalTime
@onready var avr_time = $MarginContainer/VBoxContainer/AvrTime

func _ready() -> void:
	global_time.text = "Total Time: " + "%.3f" % Main.time
	avr_time.text = "Average Time: " + "%.3f" % Main.get_average(Main.level_times)


func _process(_delta: float) -> void:
	pass
