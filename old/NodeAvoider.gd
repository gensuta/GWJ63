## This script should be a attached to a node to avoid another Node that
## will be dragged into the 'objectToAvoid' variable

extends Node2D
@export var speed : float
@export var objectToAvoid : Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position = position.move_toward(objectToAvoid.position,delta * speed);
	pass
