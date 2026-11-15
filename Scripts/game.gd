extends Control

var orange_texture = preload("res://Assets/apelsins.png")
var bouling_texture = preload("res://Assets/boling bumba.png")
var minion_texture = preload("res://Assets/minion.png")
var monster_texture = preload("res://Assets/monstrs.png")
var deadly_star_texture = preload("res://Assets/pixil-frame-0 (1).png")
var duck_texture = preload("res://Assets/pixil-frame-0 (1).png")

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()



func _on_orange_pressed() -> void:
	Main.izveleta_tekstura = orange_texture

func _on_bouling_pressed() -> void:
	Main.izveleta_tekstura = bouling_texture

func _on_minion_pressed() -> void:
	Main.izveleta_tekstura = minion_texture

func _on_monster_pressed() -> void:
	Main.izveleta_tekstura = monster_texture

func _on_deadly_star_pressed() -> void:
	Main.izveleta_tekstura = deadly_star_texture

func _on_duck_pressed() -> void:
	Main.izveleta_tekstura = duck_texture
