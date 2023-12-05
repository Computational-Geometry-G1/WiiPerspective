extends CharacterBody3D


	
func _process(delta):
	adjust_tilt(get_parent().get_x(), get_parent().get_y(), null, true)
	#print(delta)
	#print(get_position())
	#print()
	
func adjust_tilt(x,y,z, absolute=false):
	x=x*300
	y=y*300
	
	var min_x = 0
	var max_x = 600
	var half_x = (max_x-min_x)/2
	
	var tilt = x-(half_x) # +/- half of the max x
	
	var max_tilt = 45 # degrees
	
	tilt = tilt/half_x * max_tilt
	
	
	
	get_parent().rotation.z = deg_to_rad(tilt)

