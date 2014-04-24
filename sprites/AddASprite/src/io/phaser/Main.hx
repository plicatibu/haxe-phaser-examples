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
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create });
	}

	
	function preload()
	{

		game.load.image('mushroom', 'assets/sprites/mushroom2.png');

	}

	function create()
	{

		//  This simply creates a sprite using the mushroom image we loaded above and positions it at 200 x 200
		var test = game.add.sprite(200, 200, 'mushroom');
	}

	static function main() 
	{
			new Main();
	}
}