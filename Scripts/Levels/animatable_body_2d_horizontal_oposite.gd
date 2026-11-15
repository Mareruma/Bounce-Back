extends AnimatableBody2D

@export var speed = 50
var direction = 1

func _ready() -> void:
	while(true):
		await gotopos(Vector2(-30, 0))
		await gotopos(Vector2(45,0))

func gotopos(pos):
	var newtween = create_tween()
	newtween.tween_property(self, "global_position", pos, 2)
	newtween.play()
	await newtween.finished
