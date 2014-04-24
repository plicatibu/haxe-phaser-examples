/**
 * @author       Richard Davey <rich@photonstorm.com>
 * @author       Marcio Andrey Oliveira <plicatibu@plicatibu.com>
 * @copyright    2014 Photon Storm Ltd.
 * @license      {@link https://github.com/photonstorm/phaser/blob/master/license.txt|MIT License}
 */
package io.phaser;

import js.Lib;
import phaser.gameobjects.Sprite;
import phaser.Phaser;
import phaser.core.Game;
import phaser.sound.Sound;

class Main 
{
	var game:Game;
	var s:Sprite;
	var music:Sound;


	public function new ()
	{
		game = new Game(800, 600, Phaser.CANVAS, 'phaser-example', { preload: preload, create: create, update: update, render: render });
	}

	
	function preload()
	{
		game.load.image('disk', 'assets/sprites/ra_dont_crack_under_pressure.png');

		//  Firefox doesn't support mp3 files, so use ogg
		game.load.audio('boden', ['assets/audio/bodenstaendig_2000_in_rock_4bit.mp3', 'assets/audio/bodenstaendig_2000_in_rock_4bit.ogg']);
	}

	function create()
	{
		game.stage.backgroundColor = '#182d3b';
		game.input.touch.preventDefault = false;

		music = game.add.audio('boden');
		music.play();

		s = game.add.sprite(game.world.centerX, game.world.centerY, 'disk');
		s.anchor.setTo(0.5, 0.5);

		game.input.onDown.add(changeVolume, this);
	}
	
	function changeVolume(pointer) 
	{
		if (pointer.y < 300)
		{
			music.volume += 0.1;
		}
		else
		{
			music.volume -= 0.1;
		}

	}

	function update()
	{
		s.rotation += 0.01;
	}

	function render() 
	{
		game.debug.soundInfo(music, 20, 32);
	}


	static function main() 
	{
			new Main();
	}
}