import 'dart:io';

import 'package:chess/models/board_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:window_size/window_size.dart';

import 'common/constants.dart' as constants;
import 'common/themes.dart' as themes;
import 'package:chess/screens/home_screen.dart';

void main() {
  _setupWindow();
  runApp(const Chess());
}

void _setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Chess!');
    setWindowMinSize(
        const Size(constants.minWindowWidth, constants.minWindowHeight));
  }
}

class Chess extends StatelessWidget {
  const Chess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //TODO remove later
      theme: themes.appTheme,
      home: ChangeNotifierProvider(
        create: (_) => BoardModel(),
        builder: (context, child) {
          return const HomeScreen();
        },
      ),
    );
  }
}
