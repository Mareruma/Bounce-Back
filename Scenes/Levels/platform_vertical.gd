extends Area2D
@export var MAX_Y = 100
@export var MIN_Y =20
var direction=1;
var timer=0.0;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	if position.y<MIN_Y:
		direction=1
		position.y+=delta
	if position.y>MAX_Y:
		direction=-1
		position.y-=delta
	else:
		position.y+=delta*direction
	position.y+=delta*2
