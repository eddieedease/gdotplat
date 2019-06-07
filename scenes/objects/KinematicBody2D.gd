extends KinematicBody2D


# what is up
const UP = Vector2(0, -1)
const GRAVITY = 40
const ACCELERATION = 60
const MAXSPEED = 400
const JUMP_HEIGHT = -1000
# x and y vector2
var motion = Vector2()

var flipped = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAXSPEED)
		$Sprite.flip_h = false
		flipped = true
		$Sprite.play("Run")
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x - ACCELERATION, -MAXSPEED)
		$Sprite.flip_h = true
		flipped = false
		$Sprite.play("Run")
	else:
		# friction
		$Sprite.play("Idle")
		friction = true
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
	# Does the actual moving
	motion = move_and_slide(motion, UP)
	pass
