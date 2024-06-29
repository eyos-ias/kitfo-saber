extends Node3D
const BLUE_CUBE_PREFEB = preload("res://blue_cube_prefeb.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	var instance = BLUE_CUBE_PREFEB.instantiate()
	#BLUE_CUBE_PREFEB.instantiate()
	
	#instance.global_position.y + 50
	add_child(instance)
	instance.global_position = global_position
