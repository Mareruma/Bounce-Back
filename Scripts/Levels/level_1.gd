extends Node2D

@onready var ui = $UI
func _ready() -> void:
	Main.is_timer_running = true

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Duck":
		Main.addTime(ui.time)
		get_tree().call_deferred("change_scene_to_file", "res://Scenes/Levels/level_2.tscn")
		
		
func _on_void_body_entered(_body: Node2D) -> void:
	get_tree().call_deferred("reload_current_scene")
