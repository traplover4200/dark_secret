extends CanvasLayer

var time_start = Time.get_ticks_msec()




# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_node("health_bar").value = get_parent().health
	get_node("fps_Label").text = "fps " + str(Engine.get_frames_per_second())
	get_node("time_Label").text = "elapsed time " + str(Time.get_ticks_msec() - time_start / 1000.0)
	get_node("kills_Label").text = "kills " + str(22)
