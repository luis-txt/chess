import 'package:flutter/material.dart';

import 'package:chess/common/enumerations.dart' as enums;
import 'package:chess/classes/coordinate.dart';
import 'package:chess/classes/move.dart';
import 'package:chess/classes/opponent.dart';

class BoardModel extends ChangeNotifier {
  BoardModel() {
    _opponent = Opponent();
    _gamemode = enums.Mode.singlePlayer;
    _currentPlayer = enums.CurrentPlayer.player;
  }

  late Opponent _opponent;
  late enums.Mode _gamemode;
  late enums.CurrentPlayer _currentPlayer;
  final List<List<int>> _figures = [
    [10, 11, 12, 13, 14, 12, 11, 10],
    [9, 9, 9, 9, 9, 9, 9, 9],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0],
    [1, 1, 1, 1, 1, 1, 1, 1],
    [2, 3, 4, 5, 6, 4, 3, 2],
  ];

  List<List<int>> get figures => _figures;

  void changeGameMode(enums.Mode mode) {
    _gamemode = mode;
  }

  int getFigureAt(Coordinate coordinate) =>
      _figures[coordinate.y][coordinate.x];

  void updatePiece(Move move) {
    if (move.from != move.to) {
      _figures[move.to.y][move.to.x] = _figures[move.from.y][move.from.x];
      _figures[move.from.y][move.from.x] = 0;

      notifyListeners();
    }
    nextMove();
  }

  void nextMove() {
    if (_currentPlayer != enums.CurrentPlayer.player) {
      _currentPlayer = enums.CurrentPlayer.player;
    } else {
      _currentPlayer = enums.CurrentPlayer.opponent;

      if (_gamemode == enums.Mode.singlePlayer) {
        Move compMove = _opponent.calculateNextMove(_figures);

        updatePiece(compMove); //_currentPlayer is changed again
      }
    }
  }

  List<Coordinate> calculateLegalMoves(Coordinate cor) {
    List<Coordinate> cordis = [];

    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        cordis.add(Coordinate(i, j));
      }
    }
    return cordis;
  }
}
