extends CharacterBody2D

const GRAVITY = 2.0
var thrust = 0



func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY
	velocity += Vector2.UP.rotated(rotation) * thrust
	
	move_and_slide()
	
func _process(delta):
	if Input.is_action_just_pressed("more_thrust") and thrust < 10:
		if GlobalVariables.fuel > 0:
			thrust += 2
	elif Input.is_action_just_pressed("less_thrust") and thrust >=2:
		thrust -= 2
	if Input.is_action_just_pressed("tilt_left"):
		rotation_degrees += 5
	elif Input.is_action_just_pressed("tilt_right"):
		rotation_degrees -= 5
	
	#fuel system
	if thrust > 0:
		GlobalVariables.fuel -= thrust * delta
		if GlobalVariables.fuel <= 0:
			GlobalVariables.fuel = 0
