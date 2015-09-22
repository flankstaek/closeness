import luxe.Input;
import luxe.Vector;
import luxe.Visual;
import luxe.Color;

class Main extends luxe.Game {

  var m : Visual;

  override function ready() {
    m = new Visual({
      pos : Luxe.screen.mid,
      geometry : Luxe.draw.circle({
        color : new Color(1, 1, 1),
        r : 20,
      }),
    });
    m.add(new Collider());
  }

  override function onkeyup( e:KeyEvent ) {
    if(e.keycode == Key.escape) {
        Luxe.shutdown();
    }

  }

  override function update(dt:Float) {

  }


}
