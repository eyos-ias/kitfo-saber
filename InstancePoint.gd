extends Node3D

const BLUE_CUBE_PREFAB = preload("res://blue_cube_prefeb.tscn")
const RED_CUBE_PREFAB = preload("res://red_cube_prefeb.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():

	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var instance
	if randi() % 2 == 0:
		instance = RED_CUBE_PREFAB.instantiate()
	else:
		instance = BLUE_CUBE_PREFAB.instantiate()
	
	# Add instance to the scene
	add_child(instance)
	
	# Set random position and scale
	instance.global_position = global_position + Vector3(randf_range(-25, 2.5), 0, 0)
	instance.scale = Vector3(0.4, 0.4, 0.4)

func randf_range(min: float, max: float) -> float:
	return randf() * (max - min) + min
