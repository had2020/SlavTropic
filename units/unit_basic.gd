extends CharacterBody2D

@onready var nav_agent = $NavigationAgent2D
@onready var nav = get_node("NavigationAgent2D")

var unit_selected:bool = false 

#move orders
var move_ordered:bool = false
var SPEED = 200
var move_done:bool = true

func unselected():
	$Area2D/Box.visible = false 
	unit_selected = false

func selected():
	$Area2D/Box.visible = true 
	unit_selected = true 

func _ready():
	nav_agent.connect("velocity_computed", Callable(self, "_on_NavigationAgent_velocity_computed"))


func _physics_process(delta):
	if move_done == false: 
		move_agent()
	
	if unit_selected == true and move_ordered == true:
		move_ordered = false
		move_done = false
		nav.set_target_position(get_global_mouse_position())

func move_agent():
	var direction = to_local(nav.get_next_path_position()).normalized()
	velocity = direction * SPEED
	move_and_slide()

func _on_navigation_agent_2d_target_reached():
	move_done = true
