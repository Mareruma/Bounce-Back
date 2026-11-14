extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var lecienu_sk=1.0;
var lec=false;

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	 
	if is_on_floor() and lec:
		if(lecienu_sk<5):
			velocity.y = JUMP_VELOCITY*(1.0/pow(1.5,lecienu_sk));
		
		#print(velocity.y)
		lecienu_sk+=1; 

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		lec=true;
		lecienu_sk=1;
		velocity.y = JUMP_VELOCITY
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
