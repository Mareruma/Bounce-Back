extends Node2D

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Duck":
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
		
func _on_void_body_entered(_body: Node2D) -> void:
	get_tree().call_deferred("reload_current_scene")
