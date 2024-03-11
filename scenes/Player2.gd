extends KinematicBody2D

export (int) var speed = 400
export (int) var jump_speed = -600
export (int) var GRAVITY = 1200

const UP = Vector2(0, -1)

var velocity = Vector2()

func get_input():
	var animation = "diri_kanan"
	
	velocity.x = 0
	if is_on_floor() and Input.is_action_just_pressed('up'):
		velocity.y = jump_speed
	if Input.is_action_pressed('right'):
		velocity.x += speed
		animation = "jalan_kanan"
	if Input.is_action_pressed('left'):
		velocity.x -= speed
		animation = "jalan_kiri"

	if $AnimatedSprite.animation != animation:
		if (animation == 'jalan_kiri'):
			$AnimatedSprite.flip_h = true
		elif (animation == 'jalan_kanan'):
			$AnimatedSprite.flip_h = false
		$AnimatedSprite.play(animation)

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)
