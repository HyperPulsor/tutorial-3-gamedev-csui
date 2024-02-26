extends KinematicBody2D

export (int) var speed = 400
export (int) var GRAVITY = 1200
export (int) var jump_speed = -600

const UP = Vector2(0,-1)
const DASH_SPEED = 500
const CROUCH_SPEED = 100
const NORMAL_SPEED = 400

onready var ap = $AnimationPlayer
onready var sprite = $Sprite

var velocity = Vector2()
var is_dashing = false
var is_crouching = false
var can_dash = true
var jump_max = 2
var jump_count = 0

func get_input():
	velocity.x = 0
	
	if is_on_floor() and jump_count != 0:
		jump_count = 0
	
	if jump_count < jump_max:
		if Input.is_action_just_pressed('up'):
			velocity.y = jump_speed
			jump_count += 1
	
	if Input.is_action_just_pressed('dash') and can_dash and not is_crouching:
		is_dashing = true
		can_dash = false
		$dash_timer.start()
		$can_dash_timer.start()
	
	if is_crouching:
		speed = CROUCH_SPEED
	else:
		speed = NORMAL_SPEED
	
	if Input.is_action_pressed('right'):
		sprite.flip_h = false

		if is_dashing:
			velocity.x += speed + DASH_SPEED
		else:
			velocity.x += speed
		
	if Input.is_action_pressed('left'):
		sprite.flip_h = true
		if is_crouching:
			speed = CROUCH_SPEED
			
		if is_dashing:
			velocity.x -= speed + DASH_SPEED
		else:
			velocity.x -= speed
	
	if Input.is_action_pressed('down'):
		crouch()
	elif Input.is_action_just_released('down'):
		stand()

func crouch():
	if is_crouching:
		return
	is_crouching = true
	
func stand():
	if is_crouching == false:
		return
	is_crouching = false;
	
func update_animations(horizontal_direction):
	if is_on_floor():
		if horizontal_direction == 0:
			if is_crouching:
				ap.play("crouch")
			else:
				ap.play("idle")
		else:
			if is_crouching:
				ap.play("crouch_walk")
			elif is_dashing:
				ap.play("dash")
			else:
				ap.play("run")
	else:
		if velocity.y < 0:
			ap.play("jump")
		elif velocity.y > 0:
			ap.play("fall")

func _physics_process(delta):
	var horizontal_direction = Input.get_axis("left", "right")
	velocity.y += delta * GRAVITY
	get_input()
	velocity = move_and_slide(velocity, UP)
	update_animations(horizontal_direction)

func _on_dash_timer_timeout():
	is_dashing = false

func _on_can_dash_timer_timeout():
	can_dash = true
