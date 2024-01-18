extends Node2D


func _on_quit_button_pressed():
	pass # Replace with function body.
	get_tree().quit()


func _on_play_button_pressed():
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://Scene/play_scene.tscn")
