extends Label

func _process(delta):
	text = "Velocity(m/s): " + str("%5.1f" % $"../..".velocity.length())
	
