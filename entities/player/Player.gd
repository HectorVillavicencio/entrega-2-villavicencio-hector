extends Sprite

onready var  cannon:Sprite = $Canion

var speed = 200 #Pixeles

var projectile_container:Node



func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta):
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	
	var mouse_position:Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)
	#var origen: Vector2 = global_position -- version larga
	#var direction_vectior:Vector2 = (mouse_position - origen).normalized() -- version larga
	#var cannon = $Canion -- lo cambien por onready
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
	
	
	position.x += direction_optimized * speed * delta
