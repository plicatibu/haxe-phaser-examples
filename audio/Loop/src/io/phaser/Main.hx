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
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create});
	}

	
	function preload()
	{
		game.load.image('spyro', 'assets/pics/spyro.png');

		//  Firefox doesn't support mp3 files, so use ogg
		game.load.audio('squit', ['assets/audio/SoundEffects/squit.mp3', 'assets/audio/SoundEffects/squit.ogg']);
	}

	function create()
	{
		game.stage.backgroundColor = '#255d3b';

		music = game.add.audio('squit',1,true);
		music.play('',0,1,true);

		s = game.add.sprite(game.world.centerX, game.world.centerY, 'spyro');
		s.anchor.setTo(0.5, 0.5);
	}
	static function main() 
	{
			new Main();
	}
}