tool
extends Button


export(String, FILE) var next_scene_path: = "res://Scenes/polygone.tscn"


func _on_button_up() -> void:
	get_tree().change_scene("res://Scenes/polygone.tscn")


func _get_configuration_warning() -> String:
	return "The property Next Level can't be empty" if next_scene_path == "" else ""
