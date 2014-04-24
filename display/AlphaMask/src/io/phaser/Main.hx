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

	public function new ()
	{
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create });
	}

	
	function preload()
	{
		game.load.image('pic', 'assets/pics/questar.png');
		game.load.image('mask', 'assets/pics/mask-test2.png');
	}

	function create()
	{
		game.stage.backgroundColor = 0x4d4d4d;

		game.add.text(64, 10, 'Source image', { font: '16px Arial', fill: '#ffffff' } );
		game.add.image(64, 32, 'pic');

		game.add.text(400, 10, 'Alpha mask', { font: '16px Arial', fill: '#ffffff' } );
		game.add.image(400, 32, 'mask');

		//	Create a new bitmap data the same size as our picture
		var bmd:BitmapData = game.make.bitmapData(320, 256);

		//	And create an alpha mask image by combining pic and mask from the cache
		bmd.alphaMask('pic', 'mask');

		//	A BitmapData is just a texture. You need to apply it to a sprite or image
		//	to actually display it:
		game.add.image(game.world.centerX, 320, bmd).anchor.set(0.5, 0);
	}

	static function main() 
	{
			new Main();
	}
}