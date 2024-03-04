extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var _animated_sprite_2d = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	move_and_slide()


func _process(delta):
	if Input.is_action_pressed("Run right"):
		position.x += 2.5
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("Run")
	elif Input.is_action_pressed("Run left"):
		position.x -= 2.5
		$AnimatedSprite2D.flip_h = true
		$AnimatedSprite2D.play("Run")
	#else: $AnimatedSprite2D.play("Idle")
	
	if Input.is_action_pressed("Attack"):
		$AnimatedSprite2D.play("Side Attack")
	elif Input.is_action_pressed("Attack2"):
		$AnimatedSprite2D.play("Front-facing Attack")
	else: $AnimatedSprite2D.play("Idle")
	#if Input.is_action_pressed("Attack"):
		#$AnimatedSprite2D.play("Side Attack")
		
	#if velocity.x < 0:
		#_animated_sprite_2d.play("Run")
	#else: _animated_sprite_2d.play("Idle")
	
	#if Input.is_action_pressed("Run left"):
		#position.x -= 2.5
		#$AnimatedSprite2D.flip_h = true
		#$AnimatedSprite2D.play("Run")
	#else: $AnimatedSprite2D.play("Idle")
	
	
	#if velocity.x > 0:
		#_animated_sprite_2d.play("Run")
	#else: _animated_sprite_2d.play("Idle")
	
	#check_for_death()
#func check_for_death():
	if position.y >1000:
		print("I'm Dead")
		var checkpoint = get_node("../Checkpoint")
		position = checkpoint.position
	
	



func _on_killbox_area_entered(body):
	print ("I'm Dead")
	var checkpoint = get_node ("../Checkpoint")
	body.position = checkpoint
