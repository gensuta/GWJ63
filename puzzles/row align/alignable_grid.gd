extends Node2D

@onready var alignable_object = preload("res://puzzles/row align/alignable_object.tscn")
@onready var grid_container = $PanelContainer/MarginContainer/GridContainer

@export var grid_size : int;

var SYMBOLS = ["X","O","^"];


var grid = [];

# Called when the node enters the scene tree for the first time.
func _ready():
	_init_grid();


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#clears, instantiates, and randomizes the grid with a given pattern to be solved
func _init_grid():
	
	#first we clear up the grid container!
	for obj in grid_container.get_children():
		obj.queue_free();
		
	#Then we randomize the actual grid	
	_randomize_grid();
	
	#now we add everything to a physical grid
	for x in grid_size:
		for y in grid_size:
			var new_obj = alignable_object.instantiate();
			var obj_label = new_obj.find_child("Label");
			obj_label.text = grid[x][y];
			grid_container.add_child(new_obj)

func _randomize_grid():
	grid.clear()

	#for row!
	for x in grid_size:
		var col = [];
		col.resize(grid_size);
		SYMBOLS.shuffle();
		for y in grid_size:
			var current_val = SYMBOLS[y];
			col[y] = current_val;
	
		grid.append(col);
	
	print("////Begin/////");
	print(grid);
	print('//////////////')


func _update_grid():
	var size = grid.size();
	var objs = grid_container.get_children();
	var i = 0;
	
	for x in size:
		for y in size:
			var obj_label = objs[i].find_child("Label");
			obj_label.text = grid[x][y];
			i+=1;

	

# function should check for every object in our grid dictionary
#if all the items in each object equal the same
#(if the amount of times check for row alignment returned true is the same as the amt of objs)
# the puzzle is complete!
func _check_for_solution():
	pass

func _check_for_row_alignment(row):
	pass
	


func _on_grid_container_move_up(row_num):
	var size = sqrt(grid.size());
	var x = row_num; #SHOULD BE COL_NUM
	
	for y in size:
		var temp = grid[x][y];
		var y_change = 1;
		
		if(y == size - 1):
			y_change = -y; #3-3=0
		
		grid[x][y] = grid[x][y+ y_change];
		grid[x][y+ y_change] = temp;
	
	_update_grid();



func _on_grid_container_move_down(row_num):
	var size = grid.size() - 1;
	var x = row_num; #SHOULD BE COL_NUM
	
	
	#The below is moving the row instead of the column!
	for y in range(size,0,-1):
		var temp = grid[x][y];
		var y_change = -1;
		
		if(y == 0):
			y_change = 0;
		
		grid[x][y] = grid[x][y+ y_change];
		grid[x][y+ y_change] = temp;
	
	_update_grid();
