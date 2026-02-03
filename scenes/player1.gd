extends CharacterBody3D

@onready var floor: Node3D = $"../floor"
@onready var label: Label3D = $label
@onready var guy: Node3D = $"."

@export var speed:float=10
@export var health:float=10
@export var spawn: Marker3D
@export var gravity: float = 30.0

var direction:= Vector3.ZERO
var last_direction:= Vector3.FORWARD
var animation_tree : AnimationTree

func _ready() -> void:
	label.text = str(health)
	animation_tree = guy.find_child("AnimationTree")

func _physics_process(delta):
	if Input.is_action_pressed("foward"):
		direction.z -= 1
		rotation_degrees.y = 180
	if Input.is_action_pressed("back"):
		direction.z += 1
		rotation_degrees.y = 0
	if Input.is_action_pressed("left"):
		direction.x -= 1
		rotation_degrees.y = -90
	if Input.is_action_pressed("right"):
		direction.x += 1
		rotation_degrees.y = 90
	if Input.is_action_pressed("jump"):
		position.y += 0.25
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0
	direction=direction.normalized()
	
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()
	if direction != Vector3.ZERO:
		last_direction = direction
	direction = Vector3.ZERO

	if velocity.length()>1:
		print("t")
		animation_tree["parameters/StateMachine/conditions/run"] = true
		animation_tree["parameters/StateMachine/conditions/idle"] = false
	else:
		animation_tree["parameters/StateMachine/conditions/run"] = false
		animation_tree["parameters/StateMachine/conditions/idle"] = true
		print("f")
		
func modifyHealth(addHealth: float) -> void:
	health += addHealth
	animation_tree["parameters/OneShot/request"] = AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE

	if health < 0:
		#animation_tree["parameters/StateMachine/conditions/die"] = true
		pass
	label.text = str(health)
