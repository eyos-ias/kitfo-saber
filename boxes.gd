extends Area3D

# Speed at which the beat cube moves towards the player
@export var speed: float = 50.0
@export var box_type: String = "blue"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	# Connect the body_entered signal to handle saber collisions
	#connect("body_entered", self, "_on_body_entered")
	#connect("body_entered", self, "_on_body_entered")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	translate(Vector3(0, 0, speed * delta))

	#if global_transform.origin.z < -10: # Adjust the value as needed
		#queue_free()

# Handle saber collisions
func _on_body_entered(body):
	if body.name == "LeftSaber" or body.name == "RightSaber":
		# Add logic for when the cube is hit by a saber
		queue_free() # Remove the cube
		# Optionally, you can add score increment or particle effects here


func _on_area_entered(area):
	if area.is_in_group("blue"):
		print("smashed")
		GameManager.box_freed.emit()
		queue_free()
	if area.is_in_group("red"):
		print("wrong smesh brev")

