import 'package:berry/berry_app/dashboard/dashboard_screen.dart';
import 'package:berry/berry_app/models/tabIcon_data.dart';
import 'package:berry/berry_app/prize/prize_screen.dart';
import 'package:flutter/material.dart';
import 'account/account_screen.dart';
import 'bottom_navigation_view/bottom_bar_view.dart';
import 'top_information_view/top_bar_view.dart';
import 'berry_app_theme.dart';

class BerryAppHomeScreen extends StatefulWidget {
  @override
  _BerryAppHomeScreenState createState() => _BerryAppHomeScreenState();
}

class _BerryAppHomeScreenState extends State<BerryAppHomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  List<TabIconData> tabIconsList = TabIconData.tabIconsList;

  Widget tabBody = Container(
    color: BerryAppTheme.background,
  );

  @override
  void initState() {
    tabIconsList.forEach((TabIconData tab) {
      tab.isSelected = false;
    });
    tabIconsList[0].isSelected = true;

    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    tabBody = PrizeScreen(animationController: animationController);
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: BerryAppTheme.background,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  Positioned(
                    child: tabBody,
                  ),
                  Positioned(
                    child: bottomBar(),
                  ),
                  Positioned(top: 32, child: TopBarView())
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {},
          changeIndex: (int index) {
            if (index == 0) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      PrizeScreen(animationController: animationController);
                });
              });
            } else if (index == 1) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      DashboardScreen(animationController: animationController);
                });
              });
            } else if (index == 2) {
              animationController.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  tabBody =
                      AccountScreen(animationController: animationController);
                });
              });
            }
          },
        ),
      ],
    );
  }
}
