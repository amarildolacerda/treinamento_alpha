import 'package:controls_web/controls.dart';
import 'package:controls_web/controls/applience_values.dart';
import 'package:flutter/material.dart';

class AplienciesView extends StatelessWidget {
  const AplienciesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 70,
              child: ApplienceCarrousel(
                navColor: Colors.amber,
                height: 40,
                children: [
                  Text('ApplienceCarrousel'),
                  Text('bbbb'),
                ],
              ),
            ),
            ApplienceCards(
              children: [Text('xxx')],
            ),
            Container(
              height: 200,
              width: 280,
              child: ApplienceTicket(
                title: 'ApplienceTicket',
                value: '1111,2',
                color: Colors.blue,
                subTitle: 'valores',
                //image: Icon(Icons.perm_device_info_sharp),
              ),
            ),
            ApplienceTimeline(
              body: Text('ApplienceTimeline'),
              //leadding: Icon(Icons.camera_enhance),
              color: Colors.orange[50],
              tagColor: Colors.amber,
            ),
            ApplienceStatus(
              width: 100,
              title: 'ApplienceStatus',
              icon: Icons.access_alarm,
              // image: Icon(Icons.person_add_alt),
              value: '10',
            ),
            ApplienceTag(
              width: 180,
              value: '11.2',
              tagColor: Colors.amber,
              title: 'ApplienceTag',
            ),
            ApplienceTile(
              color: Colors.lightBlue[50],
              width: 200,
              height: 150,
              title: 'ApplienceTile',
              value: '123.2',
              body: Text('sample body'),
              appBar: Text('appbar'),
              bottomBar: Text('bottomBar'),
              //chart: Icon(Icons.drive_eta),
              image: Icon(Icons.add_circle),
            ),
            ApplienceValue(
              title: 'ApplienceValue',
              value: '1233.1',
              width: 250,
              height: 180,
            ),
          ],
        ),
      ),
    );
  }
}
