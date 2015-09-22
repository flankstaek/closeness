import luxe.Component;
import luxe.Visual;

class Collider extends Component {

  private var vis : Visual;
  private var geo : phoenix.geometry.CircleGeometry;
  public var collider : luxe.collision.shapes.Circle;

  override function init() {
    vis = cast entity;
    geo = cast vis.geometry;

    collider = new luxe.collision.shapes.Circle(geo.);
  }
}
