extends Area2D

class_name CharacterBase, "res://Assets/Sprites/PlaneBase.png"

export var health:int = 1;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Call this when player dies
func _die():
	pass

func receive_damage(damage:int,damager:CharacterBase)->int:
	print(damage);
	return damage;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
