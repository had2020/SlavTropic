extends Node2D

@onready var col_poly = $Area2D/CollisionPolygon2D
@onready var mesh_poly = $Polygon2D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Left_Mouse"):
		var click_pos = get_local_mouse_position()
			
		if col_poly.polygon.size() >= 3:
			#var point_index = 2  
			
			#var polygon = col_poly.polygon
			#polygon[point_index] = click_pos
			#col_poly.polygon = polygon
			update_polygon_point(mesh_poly, 2, click_pos)
	elif Input.is_action_just_released("Left_Mouse"):
		var click_pos1 = get_local_mouse_position()
		update_polygon_point(mesh_poly, 0, click_pos1)

func update_polygon_point(sel_poly, point_index, click_pos):
	if sel_poly.polygon.size() >= 3:
		var polygon = sel_poly.polygon
		
		var new_width = abs(polygon[2].x - click_pos.x)
		var new_height = abs(polygon[2].y - click_pos.y)
		
		polygon[3].x = -click_pos.x - new_width
		polygon[3].y = -click_pos.y
		polygon[1].x = -polygon[2].x
		polygon[1].y = -click_pos.y + new_height
		polygon[3].x = -click_pos.x
		polygon[3].y = -polygon[0].y
		
		sel_poly.polygon = polygon
