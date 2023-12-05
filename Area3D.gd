extends Area3D

signal exploded

@export var muzzle_velocity = 10

@export var g = Vector3.DOWN * 5

@export var velocity = Vector3.ZERO 

# Called when the node enters the scene tree for the first time.
func _ready():
	print("made bullet")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity += g * delta
	look_at(transform.origin + velocity.normalized(), Vector3.UP)
	transform.origin += velocity * delta
	#pass


func _on_body_entered(body):
	print("some collision",transform.origin)
	emit_signal("exploded", transform.origin)
	queue_free()


