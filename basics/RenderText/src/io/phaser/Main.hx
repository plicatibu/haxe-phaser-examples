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
		game = new Game(800, 600, Phaser.CANVAS, 'phaser-example', { create: create });
	}

	
	function create()
	{
		var text = "- phaser -\n with a sprinkle of \n pixi dust.";
		var style = { font: "65px Arial", fill: "#ff0044", align: "center" };

		var t = game.add.text(game.world.centerX-300, 0, text, style);
	}

	
	static function main() 
	{
			new Main();
	}
}