import 'package:berry/app_theme.dart';
import 'package:berry/berry_app/berry_app_home_screen.dart';
import 'package:berry/berry_app/berry_app_theme.dart';
import 'package:berry/berry_app/models/account_data.dart';
import 'package:berry/services/http_service.dart';
import 'package:flutter/material.dart';
import 'model/homelist.dart';
import 'dart:developer';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  HttpService httpService = HttpService();
  AnimationController animationController;
  bool multiple = true;

  Future<AccountData> futureAccountData;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
    futureAccountData = httpService.fetchAccountData();

    Future fetchAccountData() async {
      var result = await futureAccountData;
      print(result);
      AccountData.accountdata = AccountData(
          saving: result.saving,
          firstName: result.firstName,
          lastName: result.lastName,
          email: result.email,
          bonus: result.bonus,
          berries: result.berries,
          savingGoal: result.savingGoal + 3000,
          savingStretchGoal: result.savingStretchGoal + 6000,
          month: result.month);
    }

    fetchAccountData();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BerryAppTheme.background,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(
                top: 200,
                left: 110,
                right: 20,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 150),
                    SizedBox(
                        height: 60,
                        child: Text('Login To Berry',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: BerryAppTheme.fontName,
                              fontWeight: FontWeight.w700,
                              fontSize: 32,
                              letterSpacing: 1.2,
                              color: BerryAppTheme.accent,
                            ))),
                    SizedBox(height: 30),
                    Expanded(
                      child: FutureBuilder<bool>(
                        future: getData(),
                        builder: (BuildContext context,
                            AsyncSnapshot<bool> snapshot) {
                          if (!snapshot.hasData) {
                            return const SizedBox();
                          } else {
                            return Center(
                              child: GridView(
                                padding: const EdgeInsets.only(
                                    top: 0, left: 22, right: 0),
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.vertical,
                                children: List<Widget>.generate(
                                  homeList.length,
                                  (int index) {
                                    final int count = homeList.length;
                                    final Animation<double> animation =
                                        Tween<double>(begin: 0.0, end: 1.0)
                                            .animate(
                                      CurvedAnimation(
                                        parent: animationController,
                                        curve: Interval(
                                            (1 / count) * index, 1.0,
                                            curve: Curves.fastOutSlowIn),
                                      ),
                                    );
                                    animationController.forward();
                                    return HomeListView(
                                      animation: animation,
                                      animationController: animationController,
                                      listData: homeList[index],
                                      callBack: () {
                                        Navigator.push<dynamic>(
                                          context,
                                          MaterialPageRoute<dynamic>(
                                            builder: (BuildContext context) =>
                                                homeList[index].navigateScreen,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: multiple ? 2 : 1,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 12.0,
                                  childAspectRatio: 1.5,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final HomeList listData;
  final VoidCallback callBack;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Image.asset(
                      listData.imagePath,
                      fit: BoxFit.cover,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: () {
                          callBack();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
