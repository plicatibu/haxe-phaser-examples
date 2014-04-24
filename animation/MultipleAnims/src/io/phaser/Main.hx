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
	var bot:Sprite;
	var jellyfish:Sprite;
	var crab:Sprite;
	var greenJellyfish:Sprite;
	var octopus:Sprite;
	var purpleFish:Sprite;
	var seahorse:Sprite;
	var squid:Sprite;
	var stingray:Sprite;
	var flyingfish:Sprite;


	public function new ()
	{
		game = new Game(800, 600, Phaser.AUTO, 'phaser-example', { preload: preload, create: create });
	}

	function preload()
	{
		//  Here we load the Starling Texture Atlas and XML file
		game.load.atlasXML('seacreatures', 'assets/sprites/seacreatures.png', 'assets/sprites/seacreatures.xml');
		//	Here is the exact same set of animations but as a JSON file instead
		// game.load.atlas('seacreatures', 'assets/sprites/seacreatures_json.png', 'assets/sprites/seacreatures_json.json');

		//	Just a few images to use in our underwater scene
		game.load.image('undersea', 'assets/pics/undersea.jpg');
		game.load.image('coral', 'assets/pics/seabed.png');
	}
	
	function create()
	{
		game.add.sprite(0, 0, 'undersea');

		jellyfish = game.add.sprite(670, 20, 'seacreatures');

		//	In the texture atlas the jellyfish uses the frame names blueJellyfish0000 to blueJellyfish0032
		//	So we can use the handy generateFrameNames function to create this for us.
		jellyfish.animations.add('swim', Animation.generateFrameNames('blueJellyfish', 0, 32, '', 4), 30, true);
		jellyfish.animations.play('swim');

		//	Let's make some more sea creatures in the same way as the jellyfish

		crab = game.add.sprite(550, 480, 'seacreatures');
		crab.animations.add('swim', Animation.generateFrameNames('crab1', 0, 25, '', 4), 30, true);
		crab.animations.play('swim');

		greenJellyfish = game.add.sprite(330, 100, 'seacreatures');
		greenJellyfish.animations.add('swim', Animation.generateFrameNames('greenJellyfish', 0, 39, '', 4), 30, true);
		greenJellyfish.animations.play('swim');

		octopus = game.add.sprite(160, 400, 'seacreatures');
		octopus.animations.add('swim', Animation.generateFrameNames('octopus', 0, 24, '', 4), 30, true);
		octopus.animations.play('swim');

		purpleFish = game.add.sprite(800, 413, 'seacreatures');
		purpleFish.animations.add('swim', Animation.generateFrameNames('purpleFish', 0, 20, '', 4), 30, true);
		purpleFish.animations.play('swim');

		seahorse = game.add.sprite(491, 40, 'seacreatures');
		seahorse.animations.add('swim', Animation.generateFrameNames('seahorse', 0, 5, '', 4), 30, true);
		seahorse.animations.play('swim');

		squid = game.add.sprite(610, 215, 'seacreatures', 'squid0000');

		stingray = game.add.sprite(80, 190, 'seacreatures');
		stingray.animations.add('swim', Animation.generateFrameNames('stingray', 0, 23, '', 4), 30, true);
		stingray.animations.play('swim');

		flyingfish = game.add.sprite(60, 40, 'seacreatures', 'flyingFish0000');


		game.add.sprite(0, 466, 'coral');

		// to: function ( properties, duration, ease, autoStart, delay, repeat, yoyo ) {

		game.add.tween(purpleFish).to({ x: -200 }, 7500, Easing.Quadratic.InOut, true, 0, 1000, false);
		game.add.tween(octopus).to({ y: 530 }, 2000, Easing.Quadratic.InOut, true, 0, 1000, true);
		game.add.tween(greenJellyfish).to({ y: 250 }, 4000, Easing.Quadratic.InOut, true, 0, 1000, true);
		game.add.tween(jellyfish).to( { y: 100 }, 8000, Easing.Quadratic.InOut, true, 0, 1000, true);
	}

	static function main() 
	{
			new Main();
	}
}