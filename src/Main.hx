import luxe.Input;
import luxe.Vector;
import luxe.Visual;
import luxe.Color;
import luxe.tween.Actuate;

class Main extends luxe.Game {

  var m : Visual; //Mom
  var y : Visual; //You

  var rm : Float;
  var ry : Float;

  var cm : Collider;
  var cy : Collider;

  var sm : Float;
  var sy : Float;

  var tsc : Float;
  var scalar : Float;

  var notFading : Bool;

  override function ready() {
    notFading = true;

    rm = 250;
    ry = 250;

    sm = .05;
    sy = 1;

    scalar = .05;

    new Visual({
      geometry: Luxe.draw.box({
        x:0,
        y:0,
        w: Luxe.screen.w,
        h: Luxe.screen.h,
      }),
      color : new Color(.28, .39, .53),
    });

    m = new Visual({
      pos : Luxe.screen.mid,
      geometry : Luxe.draw.circle({
        r : rm,
      }),
      color : new ColorHSL(0, .4, .72),
      scale : new Vector(sm, sm),
    });
    cm = new Collider(m.pos, rm, sm);
    m.add(cm);

    y = new Visual({
      pos : Luxe.screen.cursor.pos,
      geometry : Luxe.draw.circle({
        r : ry,
      }),
      color : new Color(.49, .81, 1),
      scale : new Vector(sy, sy),
    });
    cy = new Collider(y.pos, ry, sy);
    y.add(cy);
  }

  override function update(dt:Float) {
    if((y.scale.x <= .01 || m.scale.x >= 2) && notFading) {
      notFading = false;
      fadeOut();
    }
    else if(notFading){
      if(y.scale.x > m.scale.x) {
        y.depth = 2;
        m.depth = 1;
      }
      else {
        y.depth = 1;
        m.depth = 2;
      }

      y.pos = Luxe.screen.cursor.pos;
      cy.Position = y.pos;

      if(luxe.collision.Collision.shapeWithShape(cy.collider, cm.collider) != null) { //colliding this frame
        cm.Scale += scalar * dt;
        m.scale = new Vector(m.scale.x + scalar * dt, m.scale.y + scalar * dt);

        cy.Scale -= scalar * dt;
        y.scale = new Vector(y.scale.x - scalar * dt, y.scale.y - scalar * dt);

        tsc = haxe.Timer.stamp();

        var hsl = m.color.toColorHSL();
        if(hsl.l > .5) {
          hsl.l -= .001;
          m.color = hsl;
        }
      }
      else {
        if (tsc != null && haxe.Timer.stamp() - tsc > 10){
          cm.Scale += scalar * .5 * dt;
          m.scale = new Vector(m.scale.x + scalar * .5 * dt, m.scale.y + scalar * .5 * dt);

          var hsl = m.color.toColorHSL();
          if(hsl.l > .5) {
            hsl.l -= .001;
            m.color = hsl;
          }
        }
      }
    }
  }

  function fadeOut() {
    var black = new Visual({
      geometry: Luxe.draw.box({
        x:0,
        y:0,
        w: Luxe.screen.w,
        h: Luxe.screen.h,
      }),
      depth:10,
      color : new Color(0, 0, 0, 0),
    });
    luxe.tween.Actuate.tween(black.color, 5, {a: 1});
  }


}
