extends CharacterBody3D

@export var speed: float = 10
@export var health: float = 10
@export var spawn: Marker3D
@export var gravity: float = 30.0
@onready var label: Label3D = $label

var direction := Vector3.ZERO
var last_direction := Vector3.FORWARD

func _ready() -> void:
	label.text = str(health)

func common_physics_process(delta: float, forward_action: String, back_action: String, left_action: String, right_action: String, jump_action: String) -> void:
	if Input.is_action_pressed(forward_action):
		direction.z -= 1
		rotation_degrees.y = 180
	if Input.is_action_pressed(back_action):
		direction.z += 1
		rotation_degrees.y = 0
	if Input.is_action_pressed(left_action):
		direction.x -= 1
		rotation_degrees.y = -90
	if Input.is_action_pressed(right_action):
		direction.x += 1
		rotation_degrees.y = 90
	if Input.is_action_pressed(jump_action):
		position.y += 0.25

	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0

	direction = direction.normalized()

	velocity.x = direction.x * speed
	velocity.z = direction.z * speed

	move_and_slide()
	if direction != Vector3.ZERO:
		last_direction = direction
	direction = Vector3.ZERO

func modifyHealth(addHealth: float) -> void:
	health += addHealth
	if health < 0:
		queue_free()
	label.text = str(health)
