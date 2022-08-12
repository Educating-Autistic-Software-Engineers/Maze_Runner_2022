extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	rng.randomize()
	$AnimatedSprite.flip_h = rng.randf() < .5


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
