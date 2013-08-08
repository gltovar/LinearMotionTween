package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;

import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
  /**
   * Function that is called up when to state is created to set it up. 
   */
  override public function create():Void
  {
    // Set a background color
    FlxG.cameras.bgColor = 0xff131c1b;
    // Show the mouse (in case it hasn't been disabled)
    #if !FLX_NO_MOUSE
    FlxG.mouse.show();
    #end

    FlxG.log.redirectTraces = false;
    super.create();

    var s = new FlxSprite(10, 10);
    s.makeGraphic(50, 50, 0xffff0000);

    add(s);

    FlxG.watch.add(FlxG.mouse, "x");
    FlxG.watch.add(FlxG.mouse, "y");

    FlxTween.linearMotion(s,
        10, 10, 100, 100,
        0.2, true,
        {ease : FlxEase.quadIn,
          type : FlxTween.ONESHOT,
          complete : function(t)
            {
              s = new FlxSprite(100, 100);
              s.makeGraphic(50, 50, 0xff00ff00);
              add(s);
            }
        });
  }
  
  /**
   * Function that is called when this state is destroyed - you might want to 
   * consider setting all objects this state uses to null to help garbage collection.
   */
  override public function destroy():Void
  {
    super.destroy();
  }

  /**
   * Function that is called once every frame.
   */
  override public function update():Void
  {
    super.update();
  } 
}