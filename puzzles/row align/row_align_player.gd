extends GridContainer

signal move_up(row_num)
signal move_down(row_num)

signal move_left(row_num)
signal move_right(row_num)

var current_row = 0;



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event.is_action_pressed("move_up"):
		_move_row(true);
	if event.is_action_pressed("move_down"):
		_move_row(false);
	if event.is_action_pressed("move_right"):
		_switch_row(true);
	if event.is_action_pressed("move_left"):
		_switch_row(false);
	
	
func _move_row(is_moving_up):
	if is_moving_up:
		emit_signal("move_up",current_row);
	else:
		emit_signal("move_down",current_row);
	
func _switch_row(is_moving_right):
	if is_moving_right:
		current_row+= 1;
	else:
		current_row -= 1;
	
	if current_row < 0:
		current_row = 0;
	#TODO: Make sure curr row doesn't go outside the grid size!!
	

	
