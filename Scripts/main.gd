extends Node3D

@onready var player = get_node("player")

func _physics_process(delta):
	get_tree().call_group("enemy","update_target_location",player.global_position)




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(player.global_transform.origin)
