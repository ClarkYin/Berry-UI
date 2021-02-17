import 'dart:math';

import 'package:berry/berry_app/berry_app_theme.dart';
import 'package:berry/main.dart';
import 'package:flutter/material.dart';
import 'package:berry/berry_app/models/account_data.dart';
import 'dart:math' as math;

int berries = AccountData.accountdata.berries;
int berryCount = 0;

class DashboardFullView extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;
  final AccountData accountData;
  final double bonusWidth = 150;
  final int berries;
  DashboardFullView({
    Key key,
    this.animationController,
    this.animation,
    this.accountData,
    this.berries,
  }) : super(key: key);

  @override
  _DashboardFullState createState() => _DashboardFullState();
}

class _DashboardFullState extends State<DashboardFullView> {
  @override
  Widget build(BuildContext context) {
    Random random = new Random();

    shakeTree(num) {
      setState(() {
        berries = berries + (random.nextInt(num) + 5);
        AccountData.accountdata.berries = berries;
      });
    }

    peelBerries(start, end) {
      setState(() {
        int peelAmt = random.nextInt(end - start) + start;
        if (berries - peelAmt > 0) {
          berries = berries - peelAmt;
          berryCount += peelAmt;
          AccountData.accountdata.berries = berries;
        } else {
          berries = 0;
          AccountData.accountdata.berries = berries;
        }
      });
      if (berryCount > 50) {
        prizeDialog();
        berryCount = 0;
      }
    }

    return AnimatedBuilder(
      animation: widget.animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: widget.animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation.value), 0.0),
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 16, bottom: 0),
              child: Container(
                decoration: BoxDecoration(
                  color: BerryAppTheme.background,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 4),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(1.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4, bottom: 2),
                                              child: Text(
                                                'Hi, ${widget.accountData.firstName[0].toUpperCase()}${widget.accountData.firstName.substring(1)}!',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontFamily:
                                                        BerryAppTheme.fontName,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 50,
                                                    letterSpacing: -0.1,
                                                    color: BerryAppTheme
                                                        .nearlyWhite),
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 8, bottom: 0),
                      child: Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: BerryAppTheme.background,
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 16, left: 16, right: 16),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8, right: 8, top: 50),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              '${((1.0 - widget.accountData.bonus) * 100).round()}% To Bonus',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                    BerryAppTheme.fontName,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                letterSpacing: -0.2,
                                                color:
                                                    BerryAppTheme.nearlyWhite,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 4),
                                              child: Container(
                                                height: 15,
                                                width: widget.bonusWidth,
                                                decoration: BoxDecoration(
                                                  color: HexColor('#EBEEEF')
                                                      .withOpacity(1),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(4.0)),
                                                ),
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      width: (((0.0 +
                                                                  widget.accountData
                                                                          .bonus *
                                                                      (widget.bonusWidth -
                                                                          0)) /
                                                              1.0) *
                                                          widget
                                                              .animation.value),
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              HexColor(
                                                                  '#00DDA3'),
                                                              HexColor(
                                                                      '#00DDA3')
                                                                  .withOpacity(
                                                                      0.5),
                                                            ]),
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    4.0)),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 5, top: 0, bottom: 10),
                              child: FlatButton(
                                onPressed: () {
                                  peelBerries(5, 10);
                                },
                                onLongPress: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: BerryAppTheme.nearlyWhite,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(24.0))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    child: Column(
                                      children: <Widget>[
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: EdgeInsets.all(0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 20),
                                                    child: Text(
                                                      'Berries',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              BerryAppTheme
                                                                  .fontName,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          fontSize: 30,
                                                          letterSpacing: -0.1,
                                                          color: BerryAppTheme
                                                              .background),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Align(
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "" + berries.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            BerryAppTheme
                                                                .fontName,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        fontSize: 42,
                                                        letterSpacing: -0.2,
                                                        color: BerryAppTheme
                                                            .accent,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, top: 10, bottom: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: BerryAppTheme.background,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8.0),
                              bottomLeft: Radius.circular(8.0),
                              bottomRight: Radius.circular(8.0),
                              topRight: Radius.circular(68.0)),
                        ),
                        child: FlatButton(
                          color: BerryAppTheme.background,
                          onPressed: () {
                            shakeTree(10);
                          },
                          child: Image.asset(
                              'assets/berry_app/Mulberry_Bush.png',
                              height: 430),
                        ),
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

  winPrize() {
    setState(() {
      AccountData.accountdata.saving += 50;
    });
  }

  void prizeDialog() {
    winPrize();
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              elevation: 16,
              child: Container(
                  height: 420,
                  width: 480,
                  child: ListView(children: <Widget>[
                    SizedBox(height: 20),
                    Center(
                        child: Text(
                      'Congratulations',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: BerryAppTheme.fontName,
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                          letterSpacing: -0.1,
                          color: BerryAppTheme.accent),
                    )),
                    SizedBox(height: 20),
                    Center(
                        child: SizedBox(
                            width: 200,
                            child:
                                Image.asset('assets/berry_app/moneytree.png'))),
                    SizedBox(height: 20),
                    Center(
                      child: SizedBox(
                          child: Text(
                        'You won 50 Dollars!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: BerryAppTheme.fontName,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            letterSpacing: -0.1,
                            color: BerryAppTheme.accent),
                      )),
                    )
                  ])));
        });
  }
}

class CurvePainter extends CustomPainter {
  final double angle;
  final List<Color> colors;

  CurvePainter({this.colors, this.angle = 140});

  @override
  void paint(Canvas canvas, Size size) {
    List<Color> colorsList = List<Color>();
    if (colors != null) {
      colorsList = colors;
    } else {
      colorsList.addAll([Colors.white, Colors.white]);
    }

    final shdowPaint = new Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final shdowPaintCenter = new Offset(size.width / 2, size.height / 2);
    final shdowPaintRadius =
        math.min(size.width / 2, size.height / 2) - (14 / 2);
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.3);
    shdowPaint.strokeWidth = 16;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.2);
    shdowPaint.strokeWidth = 20;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    shdowPaint.color = Colors.grey.withOpacity(0.1);
    shdowPaint.strokeWidth = 22;
    canvas.drawArc(
        new Rect.fromCircle(center: shdowPaintCenter, radius: shdowPaintRadius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        shdowPaint);

    final rect = new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
    final gradient = new SweepGradient(
      startAngle: degreeToRadians(268),
      endAngle: degreeToRadians(270.0 + 360),
      tileMode: TileMode.repeated,
      colors: colorsList,
    );
    final paint = new Paint()
      ..shader = gradient.createShader(rect)
      ..strokeCap = StrokeCap.round // StrokeCap.round is not recommended.
      ..style = PaintingStyle.stroke
      ..strokeWidth = 14;
    final center = new Offset(size.width / 2, size.height / 2);
    final radius = math.min(size.width / 2, size.height / 2) - (14 / 2);

    canvas.drawArc(
        new Rect.fromCircle(center: center, radius: radius),
        degreeToRadians(278),
        degreeToRadians(360 - (365 - angle)),
        false,
        paint);

    final gradient1 = new SweepGradient(
      tileMode: TileMode.repeated,
      colors: [Colors.white, Colors.white],
    );

    var cPaint = new Paint();
    cPaint..shader = gradient1.createShader(rect);
    cPaint..color = Colors.white;
    cPaint..strokeWidth = 14 / 2;
    canvas.save();

    final centerToCircle = size.width / 2;
    canvas.save();

    canvas.translate(centerToCircle, centerToCircle);
    canvas.rotate(degreeToRadians(angle + 2));

    canvas.save();
    canvas.translate(0.0, -centerToCircle + 14 / 2);
    canvas.drawCircle(new Offset(0, 0), 14 / 5, cPaint);

    canvas.restore();
    canvas.restore();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  double degreeToRadians(double degree) {
    var redian = (math.pi / 180) * degree;
    return redian;
  }
}
