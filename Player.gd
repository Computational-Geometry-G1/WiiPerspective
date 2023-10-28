extends Area2D


export var speed = 400  # How fast the player will move (pixels/sec).
var screen_size 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"



func explode():
	#this will let us add more points to our polygon later on
	var points = polygon
	for i in range(shard_count):
		points.append(Vector2(randi()%128, randi()%128))
	
	
	var delaunay_points = Geometry.triangulate_delaunay_2d(points)
	
	if not delaunay_points:
		print("serious error occurred no delaunay points found")
	
	#loop over each returned triangle
	for index in len(delaunay_points) / 3:
		var shard_pool = PoolVector2Array()
		#find the center of our triangle
		var center = Vector2.ZERO
		
		# loop over the three points in our triangle
		for n in range(3):
			shard_pool.append(points[delaunay_points[(index * 3) + n]])
			center += points[delaunay_points[(index * 3) + n]]
			
		# adding all the points and dividing by the number of points gets the mean position
		center /= 3
		
		#create a new polygon to give these points to
		
		var shard = Polygon2D.new()
		shard.polygon = shard_pool
		
		if rand_color:
			shard.color = Color(randf(), randf(), randf(), 1)
		else:
			shard.texture = texture
			
		shard_velocity_map[shard] = Vector2(64, 64) - center #position relative to center of sprite
			
			
		add_child(shard)
		print(shard)
		
	#this will make our base sprite invisible
	color.a = 0
		

func reset():
	color.a = 1
	for child in get_children():
		if child.name != "Camera2D":
			child.queue_free()
	shard_velocity_map = {}




# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
		
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)


