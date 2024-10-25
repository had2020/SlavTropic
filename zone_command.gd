extends Node2D

@onready var my_polygon = $Area2D/CollisionPolygon2D
@onready var point_mesh = $MeshInstance2D

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Left"):
		var click_pos = get_local_mouse_position()
			
		if my_polygon.polygon.size() >= 3:
			var point_index = 2  
			
			var polygon = my_polygon.polygon
			polygon[point_index] = click_pos
			my_polygon.polygon = polygon
			
			point_mesh.global_position = click_pos
