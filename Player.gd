extends KinematicBody2D

const UP = Vector2(0, -1)
const GRAVITY = 20
const MAXFALLSPEED = 500
const MAXSPEED = 80
const JUMPFORCE = 500
const ACCEL = 10

var motion = Vector2()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _physics_process(_delta):
	
	motion.y += GRAVITY
	if motion.y > MAXFALLSPEED:
		motion.y = MAXFALLSPEED
	
	motion.x = clamp(motion.x,-MAXSPEED,MAXSPEED)
	
	if Input.is_action_pressed("right"):
		motion.x += ACCEL
	elif Input.is_action_pressed("left"):
		motion.x -= ACCEL
	else:
		motion.x = lerp(motion.x,0,0.2)
	
	if is_on_floor():
		if Input.is_action_just_pressed("jump"):
			motion.y = -JUMPFORCE
	
	motion = move_and_slide(motion, UP)
