extends KinematicBody2D

onready var player = get_node("../Player")


var velocity = Vector2()
var speed = 4000
const HITTIME = 100
var hittimer = 0

var ismoving = true;


func _process(delta):

	if ismoving == true:
		$Sprite.play("Fly")
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
	else:
		$Sprite.play("Attack")
		hittimer = hittimer + 1
		if hittimer > HITTIME:
			hittimer = 0
			ismoving = true
	pass

func _physics_process(delta):
	
	velocity = move_and_slide(velocity * delta)
	
	
	var collision = move_and_collide(velocity * delta)
	if collision && ismoving == true:
		if (collision.collider.name == "Player"):
			ismoving = false
			print("HitPlayer")
			velocity = velocity.bounce(collision.normal)
			if collision.collider.has_method("attacked"):
			 	collision.collider.attacked()
		
		
	pass
	

