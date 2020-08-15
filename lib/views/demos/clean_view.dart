import 'package:controls_web/controls/clean_ui.dart';
import 'package:flutter/material.dart';

class CleanView extends StatelessWidget {
  const CleanView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CleanContainer(
          //radius: 20,
          width: 350,
          height: 100,
          color: Colors.amber,
          elevation: 0,
          leftRadius: 50,
          //selected: true,
          child: Text('           CleanContainer'),
        ),
        TabButton(
          icon: Icon(Icons.person),
          label: 'TabButton',
        ),
        CleanButton(
          icon: Icon(Icons.person_outline),
          label: 'CleanButton',
          color: Colors.blue,
          labelColor: Colors.white,
          subLabel: 'sublabel',
        ),
        SizedBox(
          height: 10,
        ),
        ActionButton(
          label: 'ActionButton',
          child: Text('ok'),
          height: 50,
        ),
        SizedBox(
          height: 8,
        ),
        ActionText(
          label: 'ActionText',
          sublabel: 'sublabel',
          radius: 20,
        ),
        SizedBox(
          height: 8,
        ),
        ButtonAvatar(
          label: 'ButtonAvatar',
          icon: Icon(Icons.person),
        ),
      ]),
    );
  }
}
