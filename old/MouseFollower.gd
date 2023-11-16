extends Node2D
@export var mousePos : Vector2;

# Called when the node enters the scene tree for the first time.
func _ready():
	#cat hand is following the cursor for this so normal cursor is hidden!
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN);
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	mousePos = get_global_mouse_position();
	transform.origin = mousePos;
	pass

func _input(event):
	if event.is_action_pressed("click"):
		slam();
		
func slam():
	print("slam!");
