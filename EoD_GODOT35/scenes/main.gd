extends Node2D

onready var anim = $Player/AnimatedSprite

# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("down_idle")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
