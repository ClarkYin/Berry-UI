import 'dart:async';

import 'package:berry/berry_app/berry_app_theme.dart';
import 'package:berry/main.dart';
import 'package:flutter/material.dart';

import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:berry/berry_app/models/account_data.dart';
import 'dart:math' as math;

double saving = AccountData.accountdata.saving;
Timer _savingTimed;

class SavingData {
  SavingData(this.month, this.savingAmt);
  final String month;
  final double savingAmt;
}

class AccountInfoView extends StatefulWidget {
  final AnimationController animationController;
  final Animation animation;
  final AccountData accountData;
  final double bonusWidth = 150;

  const AccountInfoView({
    Key key,
    this.animationController,
    this.animation,
    this.accountData,
  }) : super(key: key);
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfoView> {
  @override
  void initState() {
    //   void savingIncrement() {
    //     const duration = const Duration(milliseconds: 5);
    //     _savingTimed = new Timer.periodic(
    //       duration,
    //       (Timer timer) {
    //         if (saving >= 1000000) {
    //           setState(() {
    //             timer.cancel();
    //           });
    //         } else {
    //           setState(() {
    //             saving += 0.001;
    //           });
    //         }
    //       },
    //     );
    //   }

    //   savingIncrement();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    saving = AccountData.accountdata.saving;
    var moneyController = new MoneyMaskedTextController(
        precision: 4,
        leftSymbol: '\$',
        thousandSeparator: ',',
        decimalSeparator: '.');
    moneyController.updateValue(saving);

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
                          const EdgeInsets.only(top: 16, left: 0, right: 0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 0, right: 0, top: 0),
                              child: Column(
                                children: <Widget>[
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
                                              'Total Savings',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                    BerryAppTheme.fontName,
                                                fontWeight: FontWeight.w200,
                                                fontSize: 18,
                                                letterSpacing: -0.2,
                                                color:
                                                    BerryAppTheme.nearlyWhite,
                                              ),
                                            ),
                                            Text(
                                              '${moneyController.text}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                    BerryAppTheme.fontName,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 29,
                                                letterSpacing: -0.2,
                                                color:
                                                    BerryAppTheme.nearlyWhite,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                                              '${widget.accountData.savingGoal - widget.accountData.saving} To Saving Goal',
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
                                                                  (widget.accountData
                                                                              .saving /
                                                                          widget
                                                                              .accountData
                                                                              .savingGoal) *
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
                                                                  '00FFFF7146'),
                                                              HexColor(
                                                                      '00FFFF7146')
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
                                  left: 30, right: 5, top: 0, bottom: 30),
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
                                                  padding:
                                                      EdgeInsets.only(left: 20),
                                                  child: Text(
                                                    'Berries',
                                                    textAlign: TextAlign.center,
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
                                                    '${widget.accountData.berries}',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontFamily: BerryAppTheme
                                                          .fontName,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: 42,
                                                      letterSpacing: -0.2,
                                                      color:
                                                          BerryAppTheme.accent,
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 1, right: 1, top: 1, bottom: 10),
                      child: SizedBox(
                          height: 270,
                          child: DecoratedBox(
                            decoration:
                                BoxDecoration(color: BerryAppTheme.nearlyWhite),
                            child: Center(
                                child: Container(
                                    child: SfCartesianChart(
                                        primaryXAxis: CategoryAxis(),
                                        // Chart title
                                        title:
                                            ChartTitle(text: 'Saving History'),
                                        // Enable legend
                                        legend: Legend(isVisible: false),
                                        // Enable tooltip
                                        tooltipBehavior:
                                            TooltipBehavior(enable: true),
                                        series: <
                                            LineSeries<SavingData, String>>[
                                  LineSeries<SavingData, String>(
                                      dataSource: <SavingData>[
                                        SavingData('Jan', 0),
                                        SavingData('Feb', saving - 1000),
                                        SavingData('Mar', saving - 800),
                                        SavingData('Apr', saving - 700),
                                        SavingData('May', saving - 600),
                                        SavingData('Jun', saving - 300),
                                        SavingData('Jul', saving),
                                      ],
                                      xValueMapper: (SavingData saving, _) =>
                                          saving.month,
                                      yValueMapper: (SavingData saving, _) =>
                                          saving.savingAmt,
                                      // Enable data label
                                      dataLabelSettings:
                                          DataLabelSettings(isVisible: true))
                                ]))),
                          )),
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
