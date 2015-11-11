import luxe.Component;
import luxe.Visual;
import luxe.Vector;

class Collider extends Component {

  private var vis : Visual;
  private var geo : phoenix.geometry.CircleGeometry;
  public var collider : luxe.collision.shapes.Circle;

  public var Position : Vector;
  public var Radius : Float;
  public var Scale : Float;

  override function init() {
    vis = cast entity;
    geo = cast vis.geometry;

    collider = new luxe.collision.shapes.Circle(Position.x, Position.y, Radius);
  }

  public function new ( _Position : Vector, _Radius : Float ) {
    Position = _Position;
    Radius = _Radius;
    Scale = 1;

    super({ name : "collider" });
  }

  override function update ( dt : Float ) {
    collider.position.set_xy(Position.x, Position.y);
    collider.scaleX = Scale;
    collider.scaleY = Scale;
  }

}
