extends Area2D





func _on_body_entered(body):
	print (body)
	body.position = $"../Spawn Point".position
	
