extends CharacterBody3D


var player = null
var damage = 1



const SPEED = 4.0
const ATTACK_RANGE = 2.0

@export var player_path : NodePath

@onready var nav_agent = $NavigationAgent3D
@onready var ray = $RayCast3D

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node(player_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray.is_colliding():
		var target = ray.get_collider()
		if target.is_in_group("player"):
			print("player is hit")
			target.health -= damage



	velocity = Vector3.ZERO
	nav_agent.set_target_position(player.global_transform.origin)
	var next_nav_point = nav_agent.get_next_path_position()
	velocity = (next_nav_point - global_transform.origin).normalized() * SPEED
	rotation.y = lerp_angle(rotation.y, atan2(-velocity.x, -velocity.z), delta * 10.0)

	move_and_slide()


# func _target_in_range():
# 	return global_position.distance_to(player.global_position) < ATTACK_RANGE


# func _hit_finished():
# 	if global_position.distance_to(player.global_position) < ATTACK_RANGE + 1.0:
# 		var dir = global_position.direction_to(player.global_position)
# 		player.hit(dir)
