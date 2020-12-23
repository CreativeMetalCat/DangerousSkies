extends "res://Entities/CharacterBase.gd"

export var Limit: float

export var Speed = 100


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.

# Call this when player dies
func _die():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += 100 * delta
		pass
	elif Input.is_action_pressed("ui_left"):
		position.x -= 100 * delta
		pass

	pass
