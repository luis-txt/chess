class Coordinate {
  Coordinate(this._x, this._y);

  final int _x;
  final int _y;

  get x => _x;
  get y => _y;

  @override
  String toString() => 'x: $_x and y: $_y';

  @override
  bool operator ==(Object other) =>
      other is Coordinate && _x == other._x && _y == other._y;

  @override
  int get hashCode => (_x.hashCode * _y.hashCode) % 32;
}
