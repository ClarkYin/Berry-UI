import 'package:berry/berry_app/berry_app_theme.dart';
import 'package:flutter/material.dart';

class GenericRecView extends StatelessWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController animationController;
  final Animation animation;

  const GenericRecView(
      {Key key,
      this.titleTxt: "",
      this.subTxt: "",
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 24, right: 24, top: 5, bottom: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: BerryAppTheme.nearlyWhite,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topRight: Radius.circular(8.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: BerryAppTheme.grey.withOpacity(0.2),
                        offset: Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          titleTxt,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: BerryAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                            color: BerryAppTheme.accent,
                          ),
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                subTxt,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: BerryAppTheme.fontName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  color: BerryAppTheme.accent,
                                ),
                              ),
                              SizedBox(
                                height: 38,
                                width: 26,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: BerryAppTheme.accent,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
