extends Node2D

@export var level1:PackedScene
@export var level2:PackedScene
@export var level3:PackedScene
	

func _ready() -> void:
	Global.gameWin_changed.connect(onGameWinChanged)
	Global.gameOver_changed.connect(onGameOverChanged)
	Global.activePowerUp_changed.connect(onActivePowerUpChanged)
	Global.health_changed.connect(onHealthChanged)
	Global.coins_changed.connect(onCoinsChanged)
	
	setOnlyVisibleUI($Menu)


func onGameOverChanged(v:bool):$GameOver.visible=v

func onGameWinChanged(v:bool):$GameWin.visible=v

func onActivePowerUpChanged(v:bool):
	$InGame/Hearts/PowerupHearts.visible = v

func onHealthChanged(v:int):
	$InGame/Hearts/NormalHearts/H1.visible= v>=1
	$InGame/Hearts/NormalHearts/H2.visible= v>=2
	$InGame/Hearts/NormalHearts/H3.visible= v>=3
	

func onCoinsChanged(v:int):
	$InGame/Coin/Label.text = str(v)
	$GameWin/LabelCoins.text = "Coins: "+str(v)

func setOnlyVisibleUI(node:Node):
	for child in get_children():
		if child == node:
			child.visible = true
		else:
			child.visible = false


func _on_mute_btn_pressed() -> void:
	AudioServer.set_bus_mute(0,true)




func _on_level_pressed(lev:int) -> void:
	$Menu.visible = false
	$InGame.visible = true
	var currentLevel:PackedScene
	if lev ==1 :
		currentLevel = level1
	elif lev==2:
		currentLevel = level2
	else:
		currentLevel = level3
	add_sibling(currentLevel.instantiate())


func _on_menu_btn_pressed() -> void:
	get_tree().reload_current_scene()
	Global.resetValues()
