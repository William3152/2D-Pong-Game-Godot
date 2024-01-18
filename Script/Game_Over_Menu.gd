extends Node

func _on_MainMenuButton_pressed() -> void:
	change_scene("res://Scene/main_scene.tscn")

func _on_PlayButton_pressed() -> void:
	change_scene("res://Scene/play_scene.tscn")

func change_scene(scene_path: String) -> void:
	get_tree().change_scene_to_file(scene_path)
