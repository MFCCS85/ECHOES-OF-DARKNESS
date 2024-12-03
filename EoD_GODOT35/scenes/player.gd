extends KinematicBody2D

var speed = 100
var last_dir = "up"

func _ready():
	$AnimatedSprite.play("up_idle")

func _process(delta):
	var direction = Vector2.ZERO
	# Input detection
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
		$AnimatedSprite.flip_h = true
		last_dir="right"
	elif Input.is_action_pressed("ui_left"):
		direction.x -= 1
		$AnimatedSprite.flip_h = false
		last_dir="left"
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
		last_dir="down"
	elif Input.is_action_pressed("ui_up"):
		direction.y -= 1
		last_dir="up"
	# Movement
	position += direction.normalized() * speed * delta

	# Animation control
	if direction.x == 1:
		$AnimatedSprite.play("side_walk")
	elif direction.x == -1:
		$AnimatedSprite.play("side_walk")
	
	if direction.y == 1:
		$AnimatedSprite.play("down_walk")
	elif direction.y == -1:
		$AnimatedSprite.play("up_walk")

	if direction == Vector2.ZERO:
		if last_dir == "right" or last_dir == "left":
			$AnimatedSprite.play("side_idle")
		if last_dir == "down":
			$AnimatedSprite.play("down_idle")
		if last_dir == "up":
			$AnimatedSprite.play("up_idle")
