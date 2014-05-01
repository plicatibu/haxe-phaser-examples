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
		//  Here we load the Starling Texture Atlas and XML file
		game.load.atlasXML('octopus', 'assets/sprites/octopus.png', 'assets/sprites/octopus.xml');
	}
	
	function create()
	{
		//  A more suitable underwater background color
		game.stage.backgroundColor = '#1873CE';

		//  Create our octopus
		var octopus = game.add.sprite(300, 200, 'octopus');

		//  Create an animation called 'swim', the fact we don't specify any frames means it will use all frames in the atlas
		octopus.animations.add('swim');

		//  Play the animation at 30fps on a loop
		octopus.animations.play('swim', 30, true);

		//  Bob the octopus up and down with a tween
		game.add.tween(octopus).to({ y: 300 }, 2000, Quadratic.InOut, true, 0, 1000, true);
	}

	static function main() 
	{
			new Main();
	}
}