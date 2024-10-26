extends Node2D

#box points
var point_1:Vector2 # top left
var point_2:Vector2 # buttom right
var point_1_made:bool = false
var point_2_made:bool = false

#units 
var units_selected:Array
var shift:bool = false

func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("shift"):
		shift = true
	
	if Input.is_action_just_released("shift"):
		shift = false
	
	if Input.is_action_just_released("Left_Mouse"):
		point_1_made = false
		$"../Polygon2D".visible = false
		# resetting the selection area 
		$"../Polygon2D".polygon = [Vector2(0, 0), Vector2(0, 0), Vector2(0, 0), Vector2(0, 0)]
		$"../Selection_area/CollisionPolygon2D".polygon = [Vector2(0, 0), Vector2(0, 0), Vector2(0, 0), Vector2(0, 0)]
		#for Area2D in units_selected:
			#print(Area2D.get_parent())
	
	if point_1_made == true:
		point_2 = get_global_mouse_position()
		point_2_made = true 
		get_middle()
	
	if Input.is_action_just_pressed("Left_Mouse"):
		if point_1_made == false:
			point_1 = get_global_mouse_position()
			point_1_made = true
			$"../Polygon2D".visible = true
			if shift == false:
				for node in units_selected:
					node.get_parent().unselected()
				units_selected.clear()
	
	if Input.is_action_just_pressed("Right_Mouse"):
		for node in units_selected:
			node.get_parent().move_ordered = true

func get_middle():
	var top_right = Vector2(point_2.x, point_1.y)
	var bottom_left = Vector2(point_1.x, point_2.y)
	$"../selection area/CollisionPolygon2D".polygon = [point_1, top_right, point_2, bottom_left] # setting polygon array of points
	$"../Polygon2D".polygon = [point_1, top_right, point_2, bottom_left] # setting polygon array of points
	for node in units_selected:
		node.get_parent().selected()

func _on_area_2d_area_entered(area):
	if area.is_in_group("unit") and point_1_made == true:
		units_selected.append(area)
