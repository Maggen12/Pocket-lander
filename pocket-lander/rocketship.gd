extends CharacterBody2D

const GRAVITY = 2.0
var thrust = 0
var fuel = 100


func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY
	velocity += Vector2.UP.rotated(rotation) * thrust
	
	move_and_slide()
	
func _process(delta):
	
	if Input.is_action_just_pressed("more_thrust") and thrust < 10:
		if fuel > 0:
			thrust += 2
	elif Input.is_action_just_pressed("less_thrust") and thrust >=2:
		thrust -= 2
	if Input.is_action_just_pressed("tilt_left"):
		rotation_degrees += 5
	elif Input.is_action_just_pressed("tilt_right"):
		rotation_degrees -= 5
	
	#fuel system
	if thrust == 2:
		fuel -= 4 * delta
	elif thrust == 4:
		fuel -= 6 * delta
	elif thrust == 6:
		fuel -= 8 * delta
	elif thrust == 8:
		fuel -= 10 * delta
	elif thrust == 10:
		fuel -= 12 * delta
	if fuel <= 0:
		thrust = 0
		fuel = 0
