import 'package:controls_data/local_storage.dart';
import 'package:controls_extensions/extensions.dart';
import 'package:controls_web/controls.dart';
import 'package:controls_web/controls/clean_ui.dart';
import 'package:flutter/material.dart';

class CleanView extends StatelessWidget {
  const CleanView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Wrap(spacing: 10, runSpacing: 10, children: [
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
          //height: 60,
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
        CleanContainer(
          color: Colors.white,
          //child: ,
        ),
        Labeled(
          label: 'Labeled grupo',
          children: [
            for (var i in 0.range(1, 5))
              ActionText(
                color: genColor(i),
                //padding: EdgeInsets.all(18),
                child: Text(
                  i.toString(),
                ),
              ),
          ],
        ),
        ActionCounter(
          charCount: 5,
          label: 'ActionCounter',
          value: getVisitantes(),
          builder: (v) {
            return Container(
              width: 40,
              height: 30,
              child: Stack(
                children: [
                  Icon(Icons.favorite,
                      size: 40,
                      color: genColor(
                        v.toInt(),
                      )),
                  Center(child: Text(v)),
                ],
              ),
            );
          },
        ),
        ActionTimer(
          label: 'ActionTimer',
          interval: Duration(seconds: 60),
          onTransform: (v) => '${v}min',
        ),
        ActionTimer(
          label: 'ActionTimer',
          onGetValue: (t) {
            return (t.tick % 60).toString();
          },
          onTransform: (v) {
            return '${v}s';
          },
          builder: (v) {
            return Labeled(label: 'ActionTimer', children: [
              for (var c in v.characters)
                CircleAvatar(
                  child: Text(c),
                )
            ]);
          },
        ),
      ]),
    );
  }

  getVisitantes() {
    int i = LocalStorage().getInt('visitantes') ?? 0;
    i++;
    LocalStorage().setInt('visitantes', i);
    return i.toString();
  }
}
