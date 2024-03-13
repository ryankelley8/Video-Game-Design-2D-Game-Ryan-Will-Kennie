extends Node2D

#func _on_PurplePotionBottle_body_entered(body: Node) -> void:
	## Check if the colliding body is the player
	#if body.is_in_group("Player"):
		#$Area2D.hide()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Area2D/AnimatedSprite2D.play('Idol')


func _on_area_2d_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		$Area2D.hide()
