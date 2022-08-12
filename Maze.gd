extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var game_over = preload("res://GameOver.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if $Hero.position.y < 0:
		get_parent().add_child(game_over.instance())
		queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
