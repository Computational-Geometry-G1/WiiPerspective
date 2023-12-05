extends Sprite3D

var rng = RandomNumberGenerator.new()
var kicker_children = []
func _input(event):
	#if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
	#	head.rotate_y(-event.relative.x * mouse_sensitivity)
	#	gun.rotate_y(-event.relative.x * mouse_sensitivity)
	if Input.is_action_just_pressed("shoot"):
		#if(rng.randi()%3==0):
		#	shoot()
		var i = rng.randi()%len(kicker_children)
		kicker_children[i].shoot()

		
# Called when the node enters the scene tree for the first time.
func _ready():
	for z in get_children():
		if z is CharacterBody3D:
			kicker_children.append(z)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
