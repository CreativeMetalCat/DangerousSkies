extends CharacterBase

export var limit: float

export var speed = 100

export var fireRate:float = 1;

var timeSinceLastShoot = 0;

var playerSprite:AnimatedSprite;


# Called when the node enters the scene tree for the first time.
func _ready():
	playerSprite = get_node("AnimatedSprite");
	pass  # Replace with function body.

# Call this when player dies
func _die():
	if(playerSprite != null):
		playerSprite.animation = "Explosion";
		playerSprite.play();
	if(get_node("DeathSound")):
		get_node("DeathSound").play();
	pass

func _spawnBullet():
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
			_die();
		
	pass


func _on_AnimatedSprite_animation_finished():
	if(playerSprite.animation == "Explosion"):
		queue_free();
	pass # Replace with function body.

func receive_damage(damage:int,damager:CharacterBase)->int:
	print(damage-50);
	print(damager.to_string());
	return damage;
