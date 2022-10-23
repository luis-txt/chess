import 'package:chess/classes/coordinate.dart';
import 'package:chess/classes/move.dart';

class Opponent {
  Move calculateNextMove(List<List<int>> figures) {
    Coordinate start = Coordinate(2, 0);
    Coordinate end = Coordinate(4, 2);

    return Move(start, end);
  }
}
