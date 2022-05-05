extends Sprite

onready var  cannon:Sprite = $Canion

export (float) var ACCELERATION: float = 20.0
export (float) var H_SPEED_LIMIT:float  = 600.0
export (float) var FRICTION_WEIGHT:float = 0.1

var velocity : Vector2 = Vector2.ZERO
var speed = 200 #Pixeles
var projectile_container:Node



func set_projectile_container(container:Node):
	cannon.projectile_container = container
	projectile_container = container

func _physics_process(delta):	
	var mouse_position:Vector2 = get_global_mouse_position()
	cannon.look_at(mouse_position)
	#var origen: Vector2 = global_position -- version larga
	#var direction_vectior:Vector2 = (mouse_position - origen).normalized() -- version larga
	#var cannon = $Canion -- lo cambien por onready
	
	if Input.is_action_just_pressed("fire"):
		cannon.fire()
		
		
	var direction_optimized:int = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
		
	if direction_optimized != 0:
		velocity.x = clamp(velocity.x + (direction_optimized * ACCELERATION), -H_SPEED_LIMIT, H_SPEED_LIMIT)
	else:
		velocity.x = lerp(velocity.x, 0, FRICTION_WEIGHT) if abs(velocity.x) > 1 else 0
	
	position += velocity * delta
