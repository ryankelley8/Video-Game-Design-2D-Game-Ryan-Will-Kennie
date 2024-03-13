
extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const projectile = preload("res://Scenes/Enemy/projectile.tscn")
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	

	move_and_slide()
	


#func _on_fire_rate_timeout():
	#var new_bullet = projectile.instantiate()
	#new_bullet.position = $"../Marker2D".position
	#add_child(new_bullet)





func _on_fire_rate_timeout():
	var new_bullet = projectile.instantiate()
	new_bullet.position = $Marker2D.position
	add_child(new_bullet)
