extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var player_position = Vector2()
var target_position
var player = null
#var player_scene = load("res://Player(Will).tscn")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#@onready var player = get_parent().get_parent().get_node("Main_Character")

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += gravity * delta
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	#move_and_slide()
	
	velocity = Vector2.ZERO
	if player:
		velocity = position.direction_to(player.position) * SPEED
		move_and_slide()
		print(player.position)
	
	
func _on_area_2d_body_entered(body):
	player = body
	
func _on_Detection_Shape_body_exited(body):
	player = null


	#player_position = player.position
	#target_position = (player_position - position).normalized()
	#
	#if position.distance_to(player_position) > 3:
		#move_and_slide(target_position * speed)
		#look_at(player_position)
	#var _direction = (player_position - global_position).normalized()
	#global_position += direction * speed * delta

