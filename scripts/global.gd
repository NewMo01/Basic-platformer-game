extends Node


signal gameOver_changed(v:bool)
signal gameWin_changed(v:bool)
signal activePowerUp_changed(v:bool)
signal health_changed(v:int)
signal coins_changed(v:int)
signal isInBossBattle_changed(v:bool)
signal defeatedBoss_changed(v:bool)



var gameOver := false:
	set(value):
		gameOver = value
		gameOver_changed.emit(gameOver)
		
var gameWin := false:
	set(value):
		gameWin = value
		gameWin_changed.emit(gameWin)
		
var activePowerUp := false:
	set(value):
		activePowerUp = value
		activePowerUp_changed.emit(activePowerUp)

var health := 3:
	set(value):
		health = value
		health_changed.emit(health)
		
var coins := 0:
	set(value):
		coins = value
		coins_changed.emit(coins)
		
var isInBossBattle := false:
	set(value):
		isInBossBattle = value
		isInBossBattle_changed.emit(isInBossBattle)
		
var defeatedBoss := false:
	set(value):
		defeatedBoss = value
		defeatedBoss_changed.emit(defeatedBoss)


func resetValues():
	gameOver = false
	gameWin = false
	activePowerUp = false
	health = 3
	coins = 0
	isInBossBattle = false
	defeatedBoss = false
	AudioServer.set_bus_mute(0,false)
