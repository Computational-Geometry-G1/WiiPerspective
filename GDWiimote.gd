extends GDWiimote

var gdwiimote
var num_connected
# Called when the node enters the scene tree for the first time.
func _ready():
	#gdwiimote = GDWiimote.new()
	print("connecting....")
	num_connected = wiimote_connect(5)
	set_x_sensitivity(0.1)
	set_y_sensitivity(0.1)
	set_z_sensitivity(0.1)
	set_auto_position(false);
	print("turn on your wiimote now....")
	# pass # Replace with function body.
	if num_connected == 0:
		print("none connected")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if num_connected > 0:
		poll()
	else:
		#simulate_data(delta)
		pass
		
		
	#adjust_pos(get_x(), get_y(), null, true)
	#print(delta)
	#print(get_position())
	#print()
	
func adjust_pos(x,y,z, absolute=false):
	if not absolute:
		self.global_position = Vector3(self.global_position.x+x if x else self.global_position.x, self.global_position.y+y if y else self.global_position.y, self.global_position.z+z if z else self.global_position.z)
	else:
		self.global_position = Vector3(x if x else self.global_position.x,y if y else self.global_position.y, z if z else self.global_position.z)
