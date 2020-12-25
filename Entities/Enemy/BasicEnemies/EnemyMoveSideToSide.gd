extends "res://Entities/Enemy/Enemy.gd"

#simple script for enemy that movees right to left without ever moving up or down

export var maxHorizontalDistance: float = 200

export var movingToRight = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ! dead:
		if movingToRight:
			position = Vector2(position.x + speed * delta, position.y)
			if position.x >= maxHorizontalDistance:
				movingToRight = false
		else:
			position = Vector2(position.x - speed * delta, position.y)
			if position.x <= -1*maxHorizontalDistance:
				movingToRight = true
	pass
