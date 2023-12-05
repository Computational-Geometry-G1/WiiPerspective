extends Sprite3D



func _input(event):
	#if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
	#	head.rotate_y(-event.relative.x * mouse_sensitivity)
	#	gun.rotate_y(-event.relative.x * mouse_sensitivity)
	if Input.is_action_just_pressed("shoot"):
		#if(rng.randi()%3==0):
		#	shoot()
		for child in get_children():
			if child is CharacterBody3D:
				child.shoot()

		
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
