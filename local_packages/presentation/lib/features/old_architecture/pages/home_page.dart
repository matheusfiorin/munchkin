import 'package:flutter/material.dart';
import 'package:munchkin/app/settings/settings.dart';
import 'package:presentation/widgets/scaffold.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) => scaffold(
        appBar: appBar(Settings.current.title),
        body: Container(
          color: Colors.grey[200],
        ),
      );
}
