import 'package:flutter/material.dart';

/// 跳轉畫面 動畫
class SlideLeftAnimation extends MaterialPageRoute {
  SlideLeftAnimation({WidgetBuilder builder, RouteSettings routeSettings})
      : super(builder: builder, settings: routeSettings);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
          .animate(animation),
      child: child,
    );
  }
}