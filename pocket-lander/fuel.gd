extends Label

func _process(delta):
	text = "Fuel:" + str(GlobalVariables.fuel)
