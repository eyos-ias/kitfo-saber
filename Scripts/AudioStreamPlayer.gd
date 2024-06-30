extends AudioStreamPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#GameManager.box_freed.connect(self.on_box_freed())
	#GameManager.wrong_box_freed.connect(self.on_box_miss())



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_box_freed():
	volume_db

func on_box_miss():
	pass
