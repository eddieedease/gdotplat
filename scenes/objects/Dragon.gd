extends KinematicBody2D

onready var player = get_node("../Player")


var velocity = Vector2()
var speed = 4000
const HITTIME = 200
var hittimer = 0

var ismoving = true;


func _process(delta):
	
	if ismoving == false && hittimer < HITTIME:
		hittimer = hittimer + 1
	elif ismoving == false && hittimer > HITTIME:
		print("May Move again")
		hittimer = 0
		ismoving = true
		
	if ismoving == true:
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
	
	
	var collision = move_and_collide(velocity * delta)
	if collision && ismoving == true:
		if (collision.collider.name == "Player"):
			ismoving = false
			print("HitPlayer")
			velocity = velocity.bounce(collision.normal)
			if collision.collider.has_method("attacked"):
			 	collision.collider.attacked()
		
		
	pass
	

