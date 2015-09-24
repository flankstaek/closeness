import luxe.Component;
import luxe.Visual;
import luxe.Vector;

class Collider extends Component {

  private var vis : Visual;
  private var geo : phoenix.geometry.CircleGeometry;
  public var collider : luxe.collision.shapes.Circle;

  public var Position : Vector;
  public var Radius : Float;

  override function init() {
    vis = cast entity;
    geo = cast vis.geometry;

    trace(Position);

    collider = new luxe.collision.shapes.Circle(Position.x, Position.y, Radius);
  }

  public function new ( _Position : Vector, _Radius : Float ) {
    Position = _Position;
    Radius = _Radius;

    super({ name : "collider" });
  }

  override function update ( dt : Float ) {
    collider.position.set_xy(Position.x, Position.y);
  }

}
