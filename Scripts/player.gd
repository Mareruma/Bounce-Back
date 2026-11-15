extends CharacterBody2D
const SPEED = 150.0
const JUMP_VELOCITY = -320.0
@export var kick_force := 400.0
@export var kick_range_offset := 5.0
#KickArea sprite
@onready var kick_area = $KickArea
@onready var skins = [$Sprite2D, $SpriteSamurai2D]
@onready var anim_sprite: AnimatedSprite2D = $Sprite2D



#Skanas
@onready var run_sound = $RunSound
@onready var jump_sound = $JumpSound
@onready var hit_sound = $HitSound
#Vajag lai butu atsperigs
#var velocity_before_collision:Vector2;

#Vajag lai butu atsperigs (slikts)
#var jump_count=1.0;
#var is_jumping=false;
var facing_direction := 1 ;
#rigid body ietekmas kaut kas
@export var push_force := 5.0

var jump_count = 1

var is_kicking:bool = false

func _ready() -> void:
	choose_skin(1)
	anim_sprite.animation_finished.connect(_on_animation_finished)

func choose_skin(selected:int):
	for i in range(skins.size()):
		if i==selected:
			skins[i].visible = true
			anim_sprite=skins[i]
		else:
			skins[i].visible = false

func kick():
	hit_sound.play()
	for body in kick_area.get_overlapping_bodies():
		if body is RigidBody2D:
			var direction = Vector2(facing_direction*0.05, -0.02).normalized()
			body.apply_central_impulse(direction * kick_force)
func kick_up():
	for body in kick_area.get_overlapping_bodies():
		if body is RigidBody2D:
			var direction = Vector2(facing_direction*0.2, -2).normalized()
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
		kick_animation()
	if Input.is_action_just_pressed("kick_up"):
		kick_up()
		kick_animation()
	#Iedarbiba uz rigidbody
	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		var body = collision.get_collider()

		if body is RigidBody2D:
			var push_direction = -collision.get_normal()
			body.apply_central_impulse(push_direction * push_force)
		
	
	#Leksana
	if Input.is_action_just_pressed("ui_accept") and jump_count > 0:
		#is_jumping=true;
		#jump_count=1;
		jump_count -= 1
		velocity.y = JUMP_VELOCITY
		jump_sound.play()
	#pagriesanas
	if is_on_floor():
		jump_count = 1
		
	if(direction!=0):
		facing_direction=sign(direction)
	
	#x ass kustiba
	if direction:
		velocity.x = direction * SPEED
		if not anim_sprite.animation=="Run" and not anim_sprite.animation == "Kick":
			anim_sprite.stop()
			anim_sprite.play("Run")
			run_sound.play()
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if not anim_sprite.animation == "Idle" and not anim_sprite.animation == "Kick":
			anim_sprite.stop()
			anim_sprite.play("Idle")

	update_animation(direction)
	move_and_slide()

func kick_animation():
	is_kicking = true
	anim_sprite.stop()
	anim_sprite.play("Kick")
	await anim_sprite.animation_finished
	anim_sprite.play("Idle")
	#print("hi mom")
	
func update_animation(direction: float) -> void:
	if direction > 0:
		anim_sprite.flip_h = false
	elif direction < 0:
		anim_sprite.flip_h = true
	
	if is_kicking:
		return
	
	if direction != 0:
		if anim_sprite.animation=="Idle":
			anim_sprite.stop()
		anim_sprite.play("Run")
	elif not anim_sprite.is_playing():
		#anim_sprite.play("Idle")
		pass

func _on_animation_finished():
	if anim_sprite.animation == "kick":
		is_kicking = false
