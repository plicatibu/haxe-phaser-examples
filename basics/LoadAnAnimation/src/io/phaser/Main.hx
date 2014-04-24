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
import phaser.physics.Physics;

class Main 
{
	var game:Game;
	var sprite:Sprite;
	

	public function new ()
	{
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create });
	}

	
	function preload()
	{
		game.load.atlasJSONHash('bot', 'assets/sprites/running_bot.png', 'assets/sprites/running_bot.json');
	}

	function create()
	{
		//  This sprite is using a texture atlas for all of its animation data
		var bot = game.add.sprite(200, 200, 'bot');

		//  Here we add a new animation called 'run'
		//  We haven't specified any frames because it's using every frame in the texture atlas
		bot.animations.add('run');

		//  And this starts the animation playing by using its key ("run")
		//  15 is the frame rate (15fps)
		//  true means it will loop when it finishes
		bot.animations.play('run', 15, true);
	}

	
	static function main() 
	{
			new Main();
	}
}