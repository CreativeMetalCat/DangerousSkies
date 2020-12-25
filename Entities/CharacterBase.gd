extends Area2D

class_name CharacterBase, "res://Assets/Sprites/PlaneBase.png"

export var health:int = 1;

export var speed = 100

export var fireRate:float = 1;

# how many points will player get for killing this
export var killReward = 1;

var timeSinceLastShoot = 0;

# for simple checks
var dead = false;

export (String, FILE, "*.tscn") var bulletScene;


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Call this when player dies
func _die(damager:CharacterBase):
	dead = true;
	pass

func receive_damage(damage:int,damager:CharacterBase)->int:
	health-=damage;
	if(health<=0):
		_die(damager);
	return damage;
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
