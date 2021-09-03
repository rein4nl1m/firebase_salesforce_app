import 'package:flutter/material.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktopOrWeb;

  const ResponsiveWidget({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktopOrWeb,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1100;

  static bool isDesktopOrWeb(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    if (isDesktopOrWeb(context) && desktopOrWeb != null) {
      return desktopOrWeb!;
    }

    if (isTablet(context) && tablet != null) {
      return tablet!;
    }

    return mobile;
  }
}
