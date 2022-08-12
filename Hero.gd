extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var GRAVITY = 20.0
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var desired_velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		desired_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		desired_velocity.x -= 1
	
	velocity.y += GRAVITY
	velocity.x = 200 * desired_velocity.x
	
	move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor() || is_on_ceiling():
		velocity.y = 0
	
	if is_on_floor() && Input.is_action_pressed("move_up"):
		velocity.y = -600
	
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)


func _process(delta):
	if velocity != Vector2.ZERO:
		$AnimatedSprite.animation = "walk"
		$AnimatedSprite.flip_v = false
		$AnimatedSprite.flip_h = velocity.x > 0
		if position.y > 1900:
			if !$GrassWalking.playing:
				$StoneWalking.stop()
				$GrassWalking.play()
		else:
			if !$StoneWalking.playing:
				$GrassWalking.stop()
				$StoneWalking.play()
	else:
		$AnimatedSprite.animation = "stand"
		$GrassWalking.stop()
		$StoneWalking.stop()
	
	

#func _physics_process(delta):
	#move_and_slide(Vector2(10, 1))
