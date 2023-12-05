extends Sprite3D

var rng = RandomNumberGenerator.new()
var kicker_children = []


func _on_timer_timeout() -> void:
	var i = rng.randi()%len(kicker_children)
	kicker_children[i].shoot()
		
# Called when the node enters the scene tree for the first time.
func _ready():
	for z in get_children():
		if z is CharacterBody3D:
			kicker_children.append(z)
	
	var timer := Timer.new()
	add_child(timer)

	timer.start()
	timer.timeout.connect(_on_timer_timeout)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
