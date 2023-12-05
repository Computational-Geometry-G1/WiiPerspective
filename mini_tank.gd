extends CharacterBody3D

@export var speed = 4.0
@export var turn_speed = 0.8
@export var mouse_sensitivity = 0.002
@export var projectile: PackedScene

@onready var head = $"mini_tank 230327/Head_Cube_001"
@onready var gun = $"mini_tank 230327/Cannon_Cube_005"

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var rng = RandomNumberGenerator.new()
func _physics_process(delta):
	velocity.y -= gravity * delta
	#get_input(delta)
	#move_and_slide()
	#var n = ($FrontRay.get_collision_normal() + $RearRay.get_collision_normal()) / 2.0
	#var xform = align_with_y(global_transform, n)
	#global_transform = global_transform.interpolate_with(xform, 12.0 * delta)

func _input(event):
	#if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
	#	head.rotate_y(-event.relative.x * mouse_sensitivity)
	#	gun.rotate_y(-event.relative.x * mouse_sensitivity)
	if Input.is_action_just_pressed("shoot"):
		#if(rng.randi()%3==0):
		#	shoot()
		shoot()

func get_input(delta):
	var vy = velocity.y
	velocity = Vector3.ZERO
	var move = Input.get_axis("back", "forward")
	var turn = Input.get_axis("right", "left")
	velocity += -transform.basis.z * move * speed
	rotate_y(turn_speed * turn * delta)
	velocity.y = vy



func shoot()->void:
	var inst =projectile.instantiate()
	owner.add_child(inst)
	inst.transform = get_node("BarellPosition").global_transform
	inst.velocity = -inst.transform.basis.z * inst.muzzle_velocity

func align_with_y(xform, new_y):
	xform.basis.y = new_y
	xform.basis.x = -xform.basis.z.cross(new_y)
	xform.basis = xform.basis.orthonormalized()
	return xform
