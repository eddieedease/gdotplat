extends KinematicBody2D

onready var player = get_node("../Player")


var velocity = Vector2()
var speed = 150


func _process(delta):
	if player.position.x > position.x:
		$Sprite.flip_h = false
		velocity.x += speed
	if player.position.x < position.x:
		velocity.x -= speed
		$Sprite.flip_h = true
	if player.position.y > position.y:
        velocity.y += speed
	if player.position.y < position.y:
        velocity.y -= speed
	pass

func _physics_process(delta):
	$Sprite.play("Fly")
	velocity = move_and_slide(velocity * delta)
	pass
