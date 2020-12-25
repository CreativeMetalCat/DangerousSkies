extends CharacterBase

var sprite:AnimatedSprite;

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite = get_node("AnimatedSprite");
	pass # Replace with function body.

func _die(damager:CharacterBase):
	if !dead:
		._die(damager);
		if(sprite != null):
			sprite.animation = "Explosion";
			sprite.play();
		if(get_node("DeathSound")):
			get_node("DeathSound").play();
		if(damager is Player):
			(damager as Player)._add_points(killReward);
		pass

func _spawnBullet():
	if bulletScene != null:
		var bullet = load(bulletScene).instance() as BulletBase;
		bullet.position = position;
		bullet.movingUp = false;
		bullet._owner = self;
		get_parent().add_child(bullet);
	pass	
		

func _on_AnimatedSprite_animation_finished():
	if(sprite.animation == "Explosion"):
		queue_free();
	pass # Replace with function body.
