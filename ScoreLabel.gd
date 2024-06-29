extends Label3D

var score:int
var mistake_count: int
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	mistake_count = 0
	text = str(score)
	GameManager.box_freed.connect(self.on_box_freed)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_box_freed():
	score += 1
	text = str(score)

func on_mistake():
	score -= 1
	text = str(score)
