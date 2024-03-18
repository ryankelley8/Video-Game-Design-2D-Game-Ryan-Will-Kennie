extends Node2D

const projectile = preload("res://Scenes/fire_projectile.png")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Attack"):
		attack()
	else:
		pass


func _on_area_2d_body_entered(body):
	print(body)
	reparent(body)
#func attack():
	#projectile.instantiate()
	#projectile.position = $Area2D/Marker2D.position
	#add_child(projectile)
func attack():
	#make the projectile its own scene
	var new_bullet = projectile.instantiate()
	new_bullet.position = $Area2D/Marker2D.position
	add_child(new_bullet)
