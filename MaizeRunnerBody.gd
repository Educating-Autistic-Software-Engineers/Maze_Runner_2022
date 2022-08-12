extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var screen_size
var is_walking = false
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	position.y = 40

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
		
	move_and_slide(240 * velocity * delta)
	
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	
	is_walking = velocity != Vector2.ZERO

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
