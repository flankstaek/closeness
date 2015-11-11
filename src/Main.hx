import luxe.Input;
import luxe.Vector;
import luxe.Visual;
import luxe.Color;

class Main extends luxe.Game {

  var m : Visual; //Mom
  var y : Visual; //You

  var rm : Float;
  var ry : Float;

  var cm : Collider;
  var cy : Collider;

  override function ready() {
    rm = 200;
    ry = 20;

    m = new Visual({
      pos : Luxe.screen.mid,
      geometry : Luxe.draw.circle({
        color : new Color(1, 1, 1),
        r : rm,
      }),
    });
    cm = new Collider(m.pos, rm);
    m.add(cm);

    y = new Visual({
      pos : Luxe.screen.cursor.pos,
      geometry : Luxe.draw.circle({
        color : new Color(1, 1, 1),
        r : ry
      }),
    });
    cy = new Collider(y.pos, ry);
    y.add(cy);
  }

  override function update(dt:Float) {
    y.pos = Luxe.screen.cursor.pos;
    cy.Position = y.pos;

    if(luxe.collision.Collision.shapeWithShape(cy.collider, cm.collider) != null) { //colliding this frame
      trace('bang');
    }
    else { //not colliding this frame 
    }
  }


}
