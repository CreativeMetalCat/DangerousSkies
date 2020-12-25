extends Area2D

class_name BulletBase

export var movingUp = true

export var speed: float = 100

export var damage: int = 1

# owner is used for telling who killed who and avoid self damage
var _owner: CharacterBase


# Called when the node enters the scene tree for the first time.
func _ready():
	if get_node("SpawnSound"):
		get_node("SpawnSound").play()
	pass  # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if movingUp:
		position.y -= speed * delta;
	else:
		position.y += speed * delta;
	pass


func _on_Area2D_area_entered(area):
	if area is CharacterBase && area != _owner:
		(area as CharacterBase).receive_damage(damage, _owner)
	pass
