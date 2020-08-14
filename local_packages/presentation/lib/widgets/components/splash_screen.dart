import 'package:core/helpers/image-service/image-service.dart';
import 'package:flutter/material.dart';
import 'package:presentation/design/metrics.dart';
import 'package:presentation/design/style.dart';
import 'package:presentation/widgets/progress_indicators.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) => Container(
        color: Style.current.background.color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: Metrics.layout.xxlPadding,
              child: Image.asset(
                ImageService.getAsset('logo.png'),
              ),
            ),
            progressIndicator(),
          ],
        ),
      );
}
