extends CharacterBase

class_name Player

export var limit: float

var playerSprite:AnimatedSprite;

var score:int = 0;


# Called when the node enters the scene tree for the first time.
func _ready():
	
	playerSprite = get_node("AnimatedSprite");
	pass  # Replace with function body.

func _add_points(points:int):
	score += points;
	pass

# Call this when player dies
func _die(damager:CharacterBase):
	if !dead:
		._die(damager);
		if(playerSprite != null):
			playerSprite.animation = "Explosion";
			playerSprite.play();
		if(get_node("DeathSound")):
			get_node("DeathSound").play();
		pass

func _spawnBullet():
	if bulletScene != null:
		var bullet = load(bulletScene).instance() as BulletBase;
		bullet.position = position;
		bullet.movingUp = true;
		bullet._owner = self;
		get_parent().add_child(bullet);
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_right"):
		position.x += speed * delta
		
	elif Input.is_action_pressed("ui_left"):
		position.x -= speed * delta
	
	timeSinceLastShoot += delta;
	if(timeSinceLastShoot >= fireRate):
		_spawnBullet();
		timeSinceLastShoot = 0;

	pass

	#this function is used for debug input
func _unhandled_input(event):
	#only if it's in debug mode
	if !OS.has_feature("standalone") && event is InputEventKey:
		#debug even for dying
		if (event as InputEventKey).scancode == KEY_0:
			_die(self);
		
	pass


func _on_AnimatedSprite_animation_finished():
	if(playerSprite.animation == "Explosion"):
		queue_free();
	pass # Replace with function body.

