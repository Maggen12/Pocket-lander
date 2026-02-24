extends Label

func _process(delta):
	text = "Altitude(meter): " + str("%5.1f" % (GlobalVariables.altitude))
	
