extends CharacterBody2D


const GRAVITY = 1.0
var thrust = 0


func _physics_process(delta: float) -> void:
	velocity.y += GRAVITY
	velocity += Vector2.UP.rotated(rotation) * thrust
	move_and_slide()
	
func _process(delta):
	if Input.is_action_just_pressed("more_thrust"):
		if thrust <10:
			thrust += 2
	if Input.is_action_just_pressed("less_thrust"):
		if thrust >=2:
			thrust -= 2
	if Input.is_action_just_pressed("tilt_left"):
		rotation_degrees += 5
	if Input.is_action_just_pressed("tilt_right"):
		rotation_degrees -= 5
	
	
	
