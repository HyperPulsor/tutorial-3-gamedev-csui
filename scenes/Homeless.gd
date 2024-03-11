extends RigidBody2D

var animation = "Idle"

func _physics_process(delta):
	$AnimatedSprite.play(animation)

func _on_Homeless_body_entered(body):
	if (body.name == "Player2"):
		animation = "hurt"
		$AnimatedSprite.play(animation)
		$AudioTimer.start()
		$AudioStreamPlayer2D.play()

func _on_AudioTimer_timeout():
	animation = "Idle"
	$AudioStreamPlayer2D.stop()
	
