
extends CharacterBody2D


var SPEED = 150.0
const JUMP_VELOCITY = -400.0
const projectile = preload("res://Scenes/Enemy/projectile.tscn")
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1
var turnAround_timer = .5
var CanturnAround = true
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	$"../Direction timer".start()
	_turnAround()
	move_enemy()
	move_and_slide()


func _on_fire_rate_timeout():
	var new_bullet = projectile.instantiate()
	new_bullet.position = $Marker2D.position
	add_child(new_bullet)

func move_enemy():
	$"../Direction timer".start(turnAround_timer)
	if CanturnAround:
		velocity.x = -150
	else:
		velocity.x = 150


func _on_direction_timer_timeout():
	var CanturnAround = false
	$"../Direction timer".stop()

func _turnAround():
	var CanturnAround = true
	$"../Direction timer".start()
