/**
 * @author       Richard Davey <rich@photonstorm.com>
 * @author       Marcio Andrey Oliveira <plicatibu@plicatibu.com>
 * @copyright    2014 Photon Storm Ltd.
 * @license      {@link https://github.com/photonstorm/phaser/blob/master/license.txt|MIT License}
 */
package io.phaser;

import js.Lib;
import phaser.Phaser;
import phaser.core.Game;

class Main 
{
	var game:Game;

	public function new ()
	{
		game = new Game(800, 600, Phaser.CANVAS, 'phaser-example', { preload: preload, create: create });
	}

	
	function preload()
	{
		//  You can fill the preloader with as many assets as your game requires

		//  Here we are loading an image. The first parameter is the unique
		//  string by which we'll identify the image later in our code.

		//  The second parameter is the URL of the image (relative)
		game.load.image('einstein', 'assets/pics/ra_einstein.png');
	}

	function create()
	{
		//  This creates a simple sprite that is using our loaded image and
		//  displays it on-screen
		game.add.sprite(0, 0, 'einstein');
	}


	static function main() 
	{
			new Main();
	}
}