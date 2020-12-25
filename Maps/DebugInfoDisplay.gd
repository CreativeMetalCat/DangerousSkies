extends RichTextLabel

var player:Player;

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_parent();

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	text = String(player.score);
	pass
