extends CharacterBody2D

const GRAVITY = 10.0
var thrust = 0
@onready var crash = $crash
@onready var victory = $victory
@onready var floor_node = $"../floor/floor_collision"

func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta 
	velocity += Vector2.UP.rotated(rotation) * thrust * delta
	
	move_and_slide()
	
func _process(delta):
	#altitude calculation
	GlobalVariables.altitude = floor_node.global_position.y - global_position.y
	
	#controls
	if Input.is_action_just_pressed("more_thrust") and thrust < 20:
		if GlobalVariables.fuel > 0:
			thrust += 4
	elif Input.is_action_just_pressed("less_thrust") and thrust >=2:
		thrust -= 4
	if Input.is_action_just_pressed("tilt_left"):
		rotation_degrees += 5
	elif Input.is_action_just_pressed("tilt_right"):
		rotation_degrees -= 5
	
	#fuel system
	if thrust > 0:
		GlobalVariables.fuel -= thrust * delta
		if GlobalVariables.fuel <= 0:
			GlobalVariables.fuel = 0
			thrust = 0

	
func _on_floor_body_entered(body: Node2D) -> void:
	if velocity.length() >= 50:
		crash.play()
	elif velocity.length() < 50:
		victory.play()
