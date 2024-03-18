extends CharacterBody2D


const SPEED = 800.0
const JUMP_VELOCITY = -700.0
var speed = 750

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var alive = true
@export var health = 20
func _physics_process(delta):
	# Add the gravity.
	if alive:
		if not is_on_floor():
			velocity.y += gravity * delta
# Handle jump.
		if Input.is_action_just_pressed("Jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY
		if Input.is_action_just_pressed('ui_select'):
			shoot()
# Get the input direction and handle the movement/deceleration.
# As good practice, you should replace UI actions with custom gameplay actions.
		#var direction = Input.get_axis("Run left", "Run right")
	
		
		#if -SPEED:
			#$Player2.flip_H = true
		#if direction:
			#velocity.x = direction * SPEED
			##$Player2.play("Run")
		#else:
			##velocity.x = move_toward(velocity.x, 0, SPEED)
			##$Player2.play("Idle")
		move_and_slide()
	
	
		#if velocity.x > 0:
			#$AnimatedSprite2D.flip_h = false
		#elif velocity.x < 0:
			#$AnimatedSprite2D.flip_h = true

func _process(delta):
	if alive:
		if Input.is_action_pressed("Run right"):
			velocity.x = 800
			$Player2.play ("Run")
			$Player2.flip_h = false
		elif Input.is_action_pressed("Run left"):
			velocity.x = -800
			$Player2.play ("Run")
			$Player2.flip_h = true
		else:
			$Player2.play("Idle")
			velocity.x = 0
			

func damage(amount):
	health -= amount
	if health <= 0:
		health = 0
		kill()
	

func kill():
	$".".position = $"../Spawn".position
	print ("I'm Dead!!")
	
func attack():
	if Input.is_action_just_pressed("Attack"):
		pass
		
func shoot():
	var b = $"../Projectile".instance()
	add_child(b)
	b.transform = $"../Projectile".transform

#func red_potion():
	#if body.is_in_group("Potion"):
		#health += 2
