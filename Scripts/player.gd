extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var velocity_before_collision:Vector2;
var jump_count=1.0;
var is_jumping=false;

#rigid body ietekmas kaut kas
@export var push_force := 20.0

func _physics_process(delta: float) -> void:
	#Gravitacija lkm
	if not is_on_floor():
		velocity += get_gravity() * delta
		#Lai varonis butu atsperigs
		#velocity_before_collision=velocity
		
	#Atsperigums
	#if is_on_floor() and velocity_before_collision.y>50:
		#velocity.y = -velocity_before_collision.y/pow(1.5,jump_count)
		#print(velocity_before_collision)
		
		#print(velocity.y)
		#jump_count+=1; 
		
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()

		if body is RigidBody2D:
			var push_direction = -collision.get_normal()
			body.apply_central_impulse(push_direction * push_force)
	#Leksana
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#is_jumping=true;
		#jump_count=1;
		velocity.y = JUMP_VELOCITY
		
	#x ass kustiba
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
