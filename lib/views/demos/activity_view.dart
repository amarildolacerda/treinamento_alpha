import 'package:controls_web/controls/activities.dart';
import 'package:flutter/material.dart';

class ActivityView extends StatelessWidget {
  const ActivityView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          children: [
            ActivityTile(
              title: 'ActivityTile',
              subtitle: 'subtitle',
              icon: Icons.access_alarm,
              color: Colors.amber,
              radius: 15,
              trailing: Icon(Icons.pedal_bike),
            ),
            Container(
              height: 200,
              child: ActivityPanel(
                  color: Colors.red,
                  width: 200,
                  height: 200,
                  child: Center(
                      child: Column(
                    children: [
                      Text('ActivityPanel'),
                      ActivityAvatar(
                        icon: Icons.ac_unit,
                        avatarBackgroudColor: Colors.green,
                        iconColor: Colors.blue,
                      ),
                    ],
                  ))),
            ),
            Container(
              height: 200,
              child: ActivityButton(
                title: 'Button',
                icon: Icons.add,
              ),
            ),
            Container(
              height: 200,
              child: ActivityCard(
                icon: Icons.search_off,
                title: 'ActivityCard',
                subtitle: 'subtitle',
                image: Icon(Icons.perm_camera_mic),
                width: 300,
                children: [
                  Divider(),
                  ActivityCount(
                    title: 'ActivityCount',
                    value: '10.8kb',
                  ),
                ],
              ),
            ),
            ActivityTextSection(
                title: 'ActivityTextSection',
                text: 'Teste de mensagem para um artigo',
                ordemLabel: 'Artigo',
                ordem: 1),
            ActivityTextTitle(title: 'ActivityTextTitle'),
            ActivityTextSubtitle(
              subtitle: 'ActivityTextSubtitle',
            ),
            Container(
              height: 200,
              child: ActivityInfo(
                title: Text('ActivityInfo'),
                text: 'Exemplo de infomrções a serem mostradas para user',
                image: Icon(Icons.person),
              ),
            ),
            Container(
              height: 100,
              child: ActivityPercentValue(
                percent: 10,
                percentDec: 1,
                percentLabel: 'ActivityPercentValue',
              ),
            ),
            Container(
              height: 160,
              child: ActivitySummary(
                title: 'ActivitySummary',
                percent: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
