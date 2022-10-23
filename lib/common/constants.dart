import 'package:flutter/material.dart';

///Holds constants for the entire application

//Colors
const tabSelectedColor = Colors.white;
const tabNotSelectedColor = Colors.white30;
const selectedTabBackgroundColor = Color.fromARGB(255, 80, 80, 80);

//TextStyles
const chessTitleTextStyle =
    TextStyle(fontWeight: FontWeight.w400, fontFamily: 'Rye');

const snackBarTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w400);

//Colors
const darkBoardColor = Color.fromARGB(255, 99, 63, 50);
const lightBoardColor = Color.fromARGB(255, 216, 192, 156);

//Widgets
const tabSpacerSizeBox = SizedBox(width: 17);

//Decorations
const roundedCornerDecoration = BoxDecoration(
    color: selectedTabBackgroundColor,
    borderRadius: BorderRadius.all(Radius.circular(4)));

//SnackBars
const notValidSnackBar = SnackBar(
  duration: Duration(seconds: 2),
  backgroundColor: selectedTabBackgroundColor,
  content: SizedBox(
    height: 20,
    child: Center(
      child: Text('Your move is not valid :(', style: snackBarTextStyle),
    ),
  ),
);

//Icons
const player2Icon = Icon(Icons.people_rounded);
const computerIcon = Icon(Icons.computer_rounded);

//Doubles
const minWindowWidth = 400.0;
const minWindowHeight = 499.0;
