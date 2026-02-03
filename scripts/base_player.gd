extends CharacterBody3D
class_name BasePlayer

@export var speed: float = 10
@export var health: float = 10
@export var spawn: Marker3D
@export var gravity: float = 30.0
@onready var label: Label3D = $label

var direction := Vector3.ZERO
var last_direction := Vector3.FORWARD

func _ready() -> void:
	label.text = str(health)
	_player_ready()

# Override this in child classes for player-specific initialization
func _player_ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	_handle_input()
	_apply_gravity(delta)
	_update_velocity()
	move_and_slide()
	_reset_direction()
	_player_physics_process(delta)

# Override this in child classes for player-specific physics
func _player_physics_process(delta: float) -> void:
	pass

func _handle_input() -> void:
	var forward_action = _get_forward_action()
	var back_action = _get_back_action()
	var left_action = _get_left_action()
	var right_action = _get_right_action()
	var jump_action = _get_jump_action()
	
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

# Override these methods in child classes to use different input actions
func _get_forward_action() -> String:
	return "foward"

func _get_back_action() -> String:
	return "back"

func _get_left_action() -> String:
	return "left"

func _get_right_action() -> String:
	return "right"

func _get_jump_action() -> String:
	return "jump"

func _apply_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity.y -= gravity * delta
	else:
		velocity.y = 0

func _update_velocity() -> void:
	direction = direction.normalized()
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	if direction != Vector3.ZERO:
		last_direction = direction

func _reset_direction() -> void:
	direction = Vector3.ZERO

func modifyHealth(addHealth: float) -> void:
	health += addHealth
	_on_health_changed()
	if health < 0:
		_on_death()
	label.text = str(health)

# Override this in child classes for health change effects
func _on_health_changed() -> void:
	pass

# Override this in child classes for death handling
func _on_death() -> void:
	queue_free()
