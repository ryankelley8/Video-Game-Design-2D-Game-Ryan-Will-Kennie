extends Node2D

const arrow = preload("res://Scenes/arrow.tscn")
var canAttack = true
@export var reload_time = 0.7
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Attack") and canAttack:
		attack()
		startReload()
	else:
		pass


func _on_area_2d_body_entered(body):
	if body.is_in_group("Player"):
		print(body)
		reparent(body)
	else:
		pass

#func attack():
	#projectile.instantiate()
	#projectile.position = $Area2D/Marker2D.position
	#add_child(projectile)
func attack():
	var new_arrow = arrow.instantiate()
	new_arrow.position = $Marker2D.position
	add_child(new_arrow)


func _on_reload_timer_timeout():
	canAttack = true
	$"Reload Timer".stop()

func startReload():
	canAttack = false
	$"Reload Timer".start(reload_time)
