extends Area3D

# Speed at which the beat cube moves towards the player
@export var speed: float = 50
@export var box_type: String = "blue"
@export var opposite_box_type: String = "red"
@onready var collision= $CollisionShape3D
@onready var mesh = $MeshInstance3D
@onready var kitfo = $kitfo
@onready var queue_free_timer = $queue_free_timer

# Called when the node enters the scene tree for the first time.
func _ready():
	#speed = randf_range(30, 60)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	translate(Vector3(0, 0, speed * delta))


func _on_area_entered(area):
	if area.is_in_group(box_type):
		speed = 0
		print("smashed")
		GameManager.box_freed.emit()
		collision.disabled = true
		mesh.visible = false
		kitfo.visible = false
		$Particles.emitting = true
		$AudioStreamPlayer3D.play()
		queue_free_timer.start()
		#queue_free()
	if area.is_in_group(opposite_box_type):
		speed = 0
		print("wrong box brev")
		collision.disabled = true
		mesh.visible = false
		kitfo.visible = false
		GameManager.wrong_box_freed.emit()
		queue_free_timer.start()
		#$Particles.emitting = true
		#queue_free()
		
