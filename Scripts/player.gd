extends CharacterBody2D
const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var kick_force := 500.0
@export var kick_range_offset := 5.0
#KickArea sprite
@onready var kick_area = $KickArea
@onready var anim_sprite: AnimatedSprite2D = $Sprite2D

#Vajag lai butu atsperigs
#var velocity_before_collision:Vector2;

#Vajag lai butu atsperigs (slikts)
#var jump_count=1.0;
#var is_jumping=false;
var facing_direction := 1 ;
#rigid body ietekmas kaut kas
@export var push_force := 5.0

var is_kicking:bool = false

func _ready() -> void:
	anim_sprite.animation_finished.connect(_on_animation_finished)

func kick():
	for body in kick_area.get_overlapping_bodies():
		if body is RigidBody2D:
			var direction = Vector2(facing_direction, -0.3).normalized()
			body.apply_central_impulse(direction * kick_force)

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("ui_left", "ui_right")
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
	#Spersana
	kick_area.position.x = facing_direction * kick_range_offset
	if Input.is_action_just_pressed("kick"):
		kick()
		if not is_kicking:
			kick_animation()
	
	#Iedarbiba uz rigidbody
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
	#pagriesanas
	if(direction!=0):
		facing_direction=sign(direction)
	
	#x ass kustiba
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	update_animation(direction)
	move_and_slide()

func kick_animation():
	is_kicking = true
	anim_sprite.play("Kick")
	
func update_animation(direction: float) -> void:
	if direction > 0:
		anim_sprite.flip_h = false
	elif direction < 0:
		anim_sprite.flip_h = true
	
	if is_kicking:
		return
	
	if direction != 0:
		anim_sprite.play("Run")
	else:
		anim_sprite.play("Idle")

func _on_animation_finished():
	if anim_sprite.animation == "kick":
		is_kicking = false
