extends Label3D

var score:int
var chances_left: int
# Called when the node enters the scene tree for the first time.
func _ready():
	score = 0
	chances_left= 10
	text = str(score)
	GameManager.box_freed.connect(self.on_box_freed)
	GameManager.wrong_box_freed.connect(self.on_mistake)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_box_freed():
	score += 1
	modulate = Color(0, 255, 0)
	text = "Score: " + str(score) + "\n" + "chances left: " + str(chances_left)

func on_mistake():
	score -= 1
	chances_left -= 1
	modulate = Color(255,0,0)
	text = "Score: " + str(score) + "\n" + "chances left: " + str(chances_left)
