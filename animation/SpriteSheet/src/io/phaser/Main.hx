/**
 * @author       Richard Davey <rich@photonstorm.com>
 * @author       Marcio Andrey Oliveira <plicatibu@plicatibu.com>
 * @copyright    2014 Photon Storm Ltd.
 * @license      {@link https://github.com/photonstorm/phaser/blob/master/license.txt|MIT License}
 */
package io.phaser;

import js.Lib;
import phaser.animation.Animation;
import phaser.gameobjects.Sprite;
import phaser.Phaser;
import phaser.core.Game;
import phaser.gameobjects.Text;
import phaser.tween.Easing;

class Main 
{
	var game:Game;


	public function new ()
	{
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create });
	}

	function preload()
	{
		//  37x45 is the size of each frame

		//  There are 18 frames in the PNG - you can leave this value blank if the frames fill up the entire PNG, but in this case there are some
		//  blank frames at the end, so we tell the loader how many to load

		game.load.spritesheet('mummy', 'assets/sprites/metalslug_mummy37x45.png', 37, 45, 18);
	}
	
	function create()
	{
		var mummy = game.add.sprite(300, 200, 'mummy');

		//  Here we add a new animation called 'walk'
		//  Because we didn't give any other parameters it's going to make an animation from all available frames in the 'mummy' sprite sheet
		mummy.animations.add('walk');

		//  And this starts the animation playing by using its key ("walk")
		//  30 is the frame rate (30fps)
		//  true means it will loop when it finishes
		mummy.animations.play('walk', 20, true);
	}

	static function main() 
	{
			new Main();
	}
}