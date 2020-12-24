extends Area2D

export var movemingUp = true;

export var speed:float = 100;

export var damage:int = 1;

var _owner:CharacterBase;

# Called when the node enters the scene tree for the first time.
func _ready():
	if(get_node("SpawnSound")):
		get_node("SpawnSound").play();
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	if(area is CharacterBase):
		(area as CharacterBase).receive_damage(damage,_owner);
	pass
