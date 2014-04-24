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
import phaser.core.Group;
import phaser.Phaser;
import phaser.core.Game;
import phaser.physics.Physics;
import phaser.gameobjects.Text;

class Main 
{
	var game:Game;


	public function new ()
	{
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create });
	}

	function preload()
	{
		game.load.atlas('seacreatures', 'assets/sprites/seacreatures_json.png', 'assets/sprites/seacreatures_json.json');
		game.load.image('undersea', 'assets/pics/undersea.jpg');
		game.load.image('coral', 'assets/pics/seabed.png');
	}
	
	function create()
	{
		game.add.sprite(0, 0, 'undersea');

		//  Here we create our group and populate it with 6 sprites
		var group:Group = game.add.group();

		for (i in 0...6)
		{
			//  They are evenly spaced out on the X coordinate, with a random Y coordinate
			var sprite = group.create(120 * i, game.rnd.integerInRange(100, 400), 'seacreatures', 'octopus0000');
		}

		//  These are the frame names for the octopus animation. We use the generateFrames function to help create the array.
		var frameNames = Animation.generateFrameNames('octopus', 0, 24, '', 4);

		//  Here is the important part. Group.callAll will call a method that exists on every child in the Group.
		//  In this case we're saying: child.animations.add('swim', frameNames, 30, true, false)
		//  The second parameter ('animations') is really important and is the context in which the method is called.
		//  For animations the context is the Phaser.AnimationManager, which is linked to the child.animations property.
		//  Everything after the 2nd parameter is just the usual values you'd pass to the animations.add method.
		group.callAll('animations.add', 'animations', 'swim', frameNames, 30, true, false);

		//  Here we just say 'play the swim animation', this time the 'play' method exists on the child itself, so we can set the context to null.
		group.callAll('play', null, 'swim');

		game.add.sprite(0, 466, 'coral');
	}

	
	static function main() 
	{
			new Main();
	}
}