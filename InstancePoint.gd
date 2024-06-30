extends Node3D
const BLUE_CUBE_PREFAB = preload("res://blue_cube_prefeb.tscn")
const RED_CUBE_PREFAB = preload("res://red_cube_prefeb.tscn")

var placed_positions = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#$Timer.connect("timeout", self, "_on_timer_timeout")
	#$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var blue_instance = BLUE_CUBE_PREFAB.instantiate()
	var red_instance = RED_CUBE_PREFAB.instantiate()
	
	# Add instances to the scene
	add_child(blue_instance)
	add_child(red_instance)
	
	# Get biased random positions
	var blue_position = get_biased_position("right")
	var red_position = get_biased_position("left")

	# Ensure positions do not overlap
	while is_overlapping(blue_position, red_position):
		red_position = get_biased_position("left")

	# Set positions
	blue_instance.global_position = blue_position
	red_instance.global_position = red_position

	# Store positions
	placed_positions.append(blue_position)
	placed_positions.append(red_position)

func get_biased_position(side: String) -> Vector3:
	var x_bias = 0
	if side == "right":
		x_bias = randf_range(0, 1) # Favor right side
	elif side == "left":
		x_bias = randf_range(-1, 0) # Favor left side
	return global_position + Vector3(
		x_bias,
		0,
		randf_range(-1, 1)
	)

func randf_range(min: float, max: float) -> float:
	return randf() * (max - min) + min

func is_overlapping(pos1: Vector3, pos2: Vector3) -> bool:
	return pos1.distance_to(pos2) < 1.0
