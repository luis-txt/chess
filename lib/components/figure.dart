import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chess/common/constants.dart' as constants;
import 'package:chess/classes/coordinate.dart';
import 'package:chess/classes/move.dart';
import 'package:chess/models/board_model.dart';

class Figure extends StatelessWidget {
  const Figure({Key? key, required this.coordinate}) : super(key: key);

  final Coordinate coordinate;

  @override
  Widget build(BuildContext context) {
    BoardModel boardModel = context.watch<BoardModel>();

    Widget _piece() {
      return Image.asset(
        'assets/${boardModel.getFigureAt(coordinate)}.png',
        scale: 20,
      );
    }

    void _checkMove(Coordinate from, Coordinate to) {
      List<Coordinate> legalMoves = boardModel.calculateLegalMoves(from);

      if (legalMoves.contains(to)) {
        boardModel.updatePiece(Move(from, to));
        //nextMove will be called in updatePiece
      } else {
        ScaffoldMessenger.of(context).showSnackBar(constants.notValidSnackBar);
        boardModel.nextMove();
      }
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: DragTarget(
          builder: (BuildContext context, List<Object?> candidateData,
              List<dynamic> rejectedData) {
            return Draggable(
              data: coordinate,
              feedback: _piece(),
              childWhenDragging: Container(),
              child: (boardModel.getFigureAt(coordinate) != 0)
                  ? _piece()
                  : Container(),
            );
          },
          //only acceps drag when field has a figure in it
          onWillAccept: ((data) => true),
          onAccept: ((Coordinate? from) => _checkMove(from!, coordinate)),
        ),
      ),
    );
  }
}
