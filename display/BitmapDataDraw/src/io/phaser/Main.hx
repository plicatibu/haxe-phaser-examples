/**
 * @author       Richard Davey <rich@photonstorm.com>
 * @author       Marcio Andrey Oliveira <plicatibu@plicatibu.com>
 * @copyright    2014 Photon Storm Ltd.
 * @license      {@link https://github.com/photonstorm/phaser/blob/master/license.txt|MIT License}
 */
package io.phaser;

import js.Lib;
import phaser.gameobjects.BitmapData;
import phaser.gameobjects.Sprite;
import phaser.Phaser;
import phaser.core.Game;


class Main 
{
	var game:Game;
	var bmd:BitmapData;

	public function new ()
	{
		game = new Game(800, 600, Phaser.CANVAS, 'phaser-example', { preload: preload, create: create, update: update });
	}

	
	function preload()
	{
		game.load.image('ball', 'assets/sprites/shinyball.png');
	}

	function create()
	{
		bmd = game.add.bitmapData(800, 600);

		bmd.context.fillStyle = 'rgba(255, 0, 0, 0.3)';

		//	Add the bmd as a texture to an Image object.
		//	If we don't do this nothing will render on screen.
		game.add.sprite(0, 0, bmd);
	}

	function update()
	{
		if (game.input.activePointer.isDown)
		{
			bmd.context.fillRect(game.input.activePointer.position.x, game.input.activePointer.position.y, 20, 20);

			//	Because we're changing the context manually, we need to tell Phaser the texture is dirty.
			//	You only need to do this in WebGL mode. In Canvas it's not needed.
			bmd.dirty = true;
		}

	}
	
	static function main() 
	{
			new Main();
	}
}