extends Control



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$"start_screen music".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_quit_pressed():
	get_tree().quit()


func _on_info_pressed():
	get_tree().change_scene_to_file("res://Infoscreen.tscn")
	
	


func _on_play_button_down() -> void:
	get_tree().change_scene_to_file("res://Gameplay.tscn")
