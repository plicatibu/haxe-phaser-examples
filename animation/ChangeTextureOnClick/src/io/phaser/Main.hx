/**
 * @author       Richard Davey <rich@photonstorm.com>
 * @author       Marcio Andrey Oliveira <plicatibu@plicatibu.com>
 * @copyright    2014 Photon Storm Ltd.
 * @license      {@link https://github.com/photonstorm/phaser/blob/master/license.txt|MIT License}
 */
package io.phaser;

import js.Lib;
import phaser.animation.Animation;
import phaser.animation.AnimationManager;
import phaser.gameobjects.Image;
import phaser.gameobjects.Sprite;
import phaser.Phaser;
import phaser.core.Game;
import phaser.physics.Physics;
import phaser.gameobjects.Text;

class Main 
{
	var game:Game;
	var bot:Sprite;

	public function new ()
	{
		game = new Game(800, 600, Phaser.CANVAS, 'phaser-example', { preload: preload, create: create, render: render });
	}

	function preload()
	{
		game.load.atlasJSONHash('bot', 'assets/sprites/running_bot.png', 'assets/sprites/running_bot.json');
		game.load.spritesheet('mummy', 'assets/sprites/metalslug_mummy37x45.png', 37, 45, 18);
	}
	
	function create()
	{
		bot = game.add.sprite(200, 200, 'bot');

		bot.animations.add('run');

		bot.animations.play('run', 15, true);

		game.input.onDown.addOnce(changeMummy, this);
	}

	function changeMummy() {

		bot.loadTexture('mummy', 0);

		bot.animations.add('walk');

		bot.animations.play('walk', 30, true);

	}

	function render() {

		game.debug.body(bot);

	}
	
	static function main() 
	{
			new Main();
	}
}