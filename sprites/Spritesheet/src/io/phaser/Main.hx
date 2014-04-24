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
import phaser.gameobjects.Sprite;
import phaser.tween.Easing;

class Main 
{
	var game:Game;
	var sprite:Sprite;
	

	public function new ()
	{
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create, update: update });
	}

	
	function preload()
	{
		//  37x45 is the size of each frame
		//  There are 18 frames in the PNG - you can leave this value blank if the frames fill up the entire PNG, but in this case there are some
		//  blank frames at the end, so we tell the loader how many to load
		game.load.spritesheet('ms', 'assets/sprites/metalslug_mummy37x45.png', 37, 45, 18);
	}

	function create()
	{
		sprite = game.add.sprite(40, 100, 'ms');

		sprite.animations.add('walk');

		sprite.animations.play('walk', 50, true);

		game.add.tween(sprite).to({ x: game.width }, 10000, Easing.Linear.None, true);
	}

	//  update isn't called until 'create' has completed. If you need to process stuff before that point (i.e. while the preload is still happening)
	//  then create a function called loadUpdate() and use that
	function update()
	{
		if (sprite.x >= 300)
		{
			sprite.scale.x += 0.01;
			sprite.scale.y += 0.01;
		}
	}

	static function main() 
	{
			new Main();
	}
}