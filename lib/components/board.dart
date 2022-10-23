import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:chess/common/constants.dart' as constants;
import 'package:chess/components/figure.dart';
import 'package:chess/models/board_model.dart';
import 'package:chess/classes/coordinate.dart';

class Board extends StatelessWidget {
  const Board({Key? key}) : super(key: key);

  List<Widget> _makeGrid(List<List<int>> figures) {
    List<Widget> grid = [];

    for (var y = 0; y < 8; y++) {
      for (var x = 0; x < 8; x++) {
        grid.add(
          Container(
            //Every second field gets a different color
            color: ((x % 2 == 0 && y % 2 == 0) || (x % 2 != 0 && y % 2 != 0))
                ? constants.darkBoardColor
                : constants.lightBoardColor,
            child: Figure(coordinate: Coordinate(x, y)),
          ),
        );
      }
    }
    return grid;
  }

  @override
  Widget build(BuildContext context) {
    List<List<int>> figures = context.read<BoardModel>().figures;

    return AspectRatio(
      aspectRatio: 1,
      child: Consumer<BoardModel>(
        builder: ((context, value, child) {
          return GridView.count(
            primary: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 8,
            children: _makeGrid(figures),
          );
        }),
      ),
    );
  }
}
