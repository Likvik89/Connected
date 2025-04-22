extends RigidBody2D



var speed = 60
var maxspeed = 300

var stoppingpower = 30

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



func _physics_process(delta: float) -> void:

	
	if Input.is_action_pressed("move_up") and self.linear_velocity.y > -1 * maxspeed:
		var direction = Vector2(0,-speed)
		self.apply_central_impulse(direction)
	
	elif Input.is_action_pressed("move_down") and self.linear_velocity.y < 1 * maxspeed:
		var direction = Vector2(0,speed)
		self.apply_central_impulse(direction)
	
	else:
		var direction = Vector2(0,(-1 * linear_velocity.y)/stoppingpower)
		self.apply_central_impulse(direction)
	
	
	
	if Input.is_action_pressed("move_left") and self.linear_velocity.x > -1 * maxspeed:
		var direction = Vector2(-speed,0)
		self.apply_central_impulse(direction)
	
	elif Input.is_action_pressed("move_right") and self.linear_velocity.x < 1 * maxspeed:
		var direction = Vector2(speed,0)
		self.apply_central_impulse(direction)
	
	else:
		var direction = Vector2((-1 * linear_velocity.x)/stoppingpower,0)
		self.apply_central_impulse(direction)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	 
	pass
