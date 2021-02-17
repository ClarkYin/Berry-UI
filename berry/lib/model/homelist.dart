import 'package:berry/berry_app/berry_app_home_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/berry_app/berry_icon.png',
      navigateScreen: BerryAppHomeScreen(),
    ),
  ];
}
