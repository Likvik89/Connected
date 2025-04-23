extends Node

var range = 100
var maxrange = 100
var distance
var direction
var elasticity = 0.198
var drag = 5

@onready var player = $"%player_character"
@onready var ball = $"%Ball"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	direction = (player.global_position-ball.global_position).normalized()
	distance = (player.global_position-ball.global_position).length()
	
	if distance > range:
		ball.apply_central_impulse(direction * elasticity * (distance-range))
	
	var drag_direction = -(ball.linear_velocity).normalized()
	ball.apply_central_impulse(drag_direction*drag)
	
	reelin()

func reelin():
	if Input.is_action_pressed("reel_in"):
		range = 0
		elasticity = 20
		drag = 5
	else:
		elasticity = 0.198
		drag = 5
		range = maxrange
	print(range)

func bounce():
	pass
