extends CharacterBody2D

const GRAVITY = 10.0
var thrust = 0
@onready var crash = $crash
@onready var victory = $victory
@onready var floor_node = $"../floor/floor_collision"
@onready var lunar_music = $lunar_music
@onready var slider = $CanvasLayer/HSlider

func _ready():
	$CanvasLayer/Victory.hide()
	$CanvasLayer/Lose.hide()
	$CanvasLayer/PlayAgain.hide()
	$CanvasLayer/ReturnToMenu.hide()

func _physics_process(delta: float) -> void:
	
	velocity.y += GRAVITY * delta 
	velocity += Vector2.UP.rotated(rotation) * thrust * delta
	
	move_and_slide()
	
func _process(delta):
	#thrust
	slider.value = thrust
	
	#altitude calculation
	GlobalVariables.altitude = floor_node.global_position.y - global_position.y
	
	#controls
	if Input.is_action_pressed("more_thrust") and thrust < 20:
		if GlobalVariables.fuel > 0:
			thrust += 0.3
	elif Input.is_action_pressed("less_thrust") and thrust >=2:
		thrust -= 0.3
	if Input.is_action_pressed("tilt_left"):
		rotation_degrees += 1
	elif Input.is_action_pressed("tilt_right"):
		rotation_degrees -= 1
	
	#fuel system
	if thrust > 0:
		GlobalVariables.fuel -= thrust * delta
		if GlobalVariables.fuel <= 0:
			GlobalVariables.fuel = 0
			thrust = 0

	
func _on_floor_body_entered(body: Node2D) -> void:
	if velocity.length() >= 50:
		crash.play()
		$CanvasLayer/Lose.show()
		$CanvasLayer/PlayAgain.show()
		$CanvasLayer/ReturnToMenu.show()
	elif velocity.length() < 50:
		victory.play()
		$CanvasLayer/Victory.show()
		$CanvasLayer/PlayAgain.show()
		$CanvasLayer/ReturnToMenu.show()


func _on_play_again_pressed():
	GlobalVariables.fuel = 500
	get_tree().change_scene_to_file("res://Gameplay.tscn")
	

func _on_return_to_menu_pressed():
	GlobalVariables.fuel = 500
	get_tree().change_scene_to_file("res://MainScreen.tscn")
