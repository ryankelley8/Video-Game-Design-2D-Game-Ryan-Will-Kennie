
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const projectile = preload("res://Scenes/Enemy/projectile.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = velocity.x
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	#move_left()
	move_and_slide()


func _on_fire_rate_timeout():
	var new_bullet = projectile.instantiate()
	new_bullet.position = $Marker2D.position
	add_child(new_bullet)



#func _on_wall_1_body_entered(body):
	#$".".flip_h = false


func move_left():
	velocity.x = -200
func move_right():
	velocity.x = 200


#func _on_wall_2_body_entered(body):
	#$".".flip_h = true
