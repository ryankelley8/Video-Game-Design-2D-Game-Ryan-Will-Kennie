extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var _animated_sprite = $AnimatedSprite2D
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

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
	else: $AnimatedSprite2D.play("Idle")
	
	if Input.is_action_pressed("Attack") and Input.is_action_pressed("Run right"):
		$AnimatedSprite2D.play("Side Attack")
		

