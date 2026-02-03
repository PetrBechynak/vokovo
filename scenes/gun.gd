extends Node3D

@onready var marker_3d: Marker3D = $Marker3D
@onready var shotgun: Node3D = $Shotgun
@onready var pistol: Node3D = $Pistol
@export var bullet_scene: PackedScene
@onready var muzzle: Node3D = $Marker3D
@onready var pumpshotgun: Node3D = $pumpshotgun

var CanChange := true
var weapontype := 1
var allowweapontype2 := false
var allowweapontype3 := false

func _physics_process(delta: float) -> void:
	var player := get_parent() as CharacterBody3D
	if Input.is_action_just_pressed("shoot1"):
		if player != null:
			if player.is_in_group("player_1"):
				player_shoot(player)
	if Input.is_action_just_pressed("shoot2"):
		if player != null:
			printt( player, player.get_groups())
			if player.is_in_group("player_2"):
				player_shoot(player)
	
	if CanChange == true:
		if Input.is_action_just_pressed("change_weapon1"):
			if player.is_in_group("player_1"):
				VisibleGuns(1)
		if Input.is_action_just_pressed("change_weapon1.2"):
			if player.is_in_group("player_1"):
				VisibleGuns(-1)
		
		if Input.is_action_just_pressed("change_weapon2"):
			if player.is_in_group("player_2"):
				VisibleGuns(+1)
		if Input.is_action_just_pressed("change_weapon2.2"):
			if player.is_in_group("player_2"):
				VisibleGuns(-1)
	
func player_shoot(player:CharacterBody3D):
	var bullet := bullet_scene.instantiate() as Node3D
	get_tree().current_scene.add_child(bullet)
	bullet.global_transform = muzzle.global_transform
	bullet.direction = Vector3(
		player.last_direction.x,
		0,
		player.last_direction.z
		).normalized()
		

func VisibleGuns(changeweapon: int):
	weapontype += changeweapon
	if weapontype > 3:
		weapontype = 1
	if weapontype < 1:
		weapontype = 3
	if weapontype == 1:
		shotgun.visible=false
		pistol.visible=true
		pumpshotgun.visible = false
	if weapontype == 2 and allowweapontype2:
		shotgun.visible=true
		pistol.visible=false
		pumpshotgun.visible = false
	if weapontype == 3 and allowweapontype3:
		shotgun.visible=false
		pistol.visible=false
		pumpshotgun.visible = true
	
func allowshotgun():
	pass
