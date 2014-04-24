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
import phaser.gameobjects.Events;
import phaser.physics.Physics;

class Main 
{
	var game:Game;
	

	public function new ()
	{
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create });
	}

	
	function preload()
	{
		//  Here we are loading an image. The first parameter is the unique
		//  string by which we'll identify the image later in our code.

		//  The second parameter is the URL of the image (relative)
		game.load.image('einstein', 'assets/pics/ra_einstein.png');
	}

	function create()
	{
		//  This creates a simple sprite that is using our loaded image and
		//  displays it on-screen
		//  and assign it to a variable
		var image = game.add.sprite(0, 0, 'einstein');

		game.physics.enable(image, Physics.ARCADE);

		image.body.velocity.x=150;
	}

	static function main() 
	{
			new Main();
	}
}