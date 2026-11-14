extends AnimatableBody2D

@export var speed = 50
var direction = 1

func _ready() -> void:
	while(true):
		await gotopos(Vector2(0, -45))
		await gotopos(Vector2(0,15))

func gotopos(pos):
	var newtween = create_tween()
	newtween.tween_property(self, "global_position", pos, 1)
	newtween.play()
	await newtween.finished
