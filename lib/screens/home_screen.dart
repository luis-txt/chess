import 'package:chess/components/home_tab.dart';
import 'package:flutter/material.dart';

import 'package:chess/common/enumerations.dart' as enums;
import 'package:chess/common/constants.dart' as constants;
import 'package:chess/models/board_model.dart';
import 'package:chess/components/board.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Function setMode = context.read<BoardModel>().changeGameMode;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Chess',
              style: constants.chessTitleTextStyle,
            ),
          ),
          bottom: TabBar(
            onTap: (value) => setMode((value == 0)
                ? enums.Mode.singlePlayer
                : enums.Mode.multiPlayer),
            tabs: const [
              HomeTab(title: 'Computer', icon: constants.computerIcon),
              HomeTab(title: 'Player 2', icon: constants.player2Icon)
            ],
          ),
        ),
        body: const SafeArea(
          child: Center(
            child: SizedBox(
              child: Board(),
            ),
          ),
        ),
      ),
    );
  }
}
