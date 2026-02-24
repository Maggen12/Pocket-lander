extends Label

func _process(delta):
	text = "Fuel(%): " + str("%5.1f" % (GlobalVariables.fuel*0.2))
	
