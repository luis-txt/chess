import 'package:flutter/material.dart';

import 'package:chess/common/constants.dart' as constants;

class HomeTab extends StatelessWidget {
  const HomeTab({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  final String title;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        icon,
        constants.tabSpacerSizeBox,
        Text(title),
      ]),
    );
  }
}
