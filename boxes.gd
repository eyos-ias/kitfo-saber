extends Area3D

# Speed at which the beat cube moves towards the player
@export var speed: float = 40
@export var box_type: String = "blue"
@export var opposite_box_type: String = "red"

# Called when the node enters the scene tree for the first time.
func _ready():
	#speed = randf_range(30, 60)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	translate(Vector3(0, 0, speed * delta))


func _on_area_entered(area):
	if area.is_in_group(box_type):
		print("smashed")
		GameManager.box_freed.emit()
		queue_free()
	if area.is_in_group(opposite_box_type):
		print("wrong box brev")
		GameManager.wrong_box_freed.emit()
