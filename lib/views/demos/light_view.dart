import 'package:alpha/widgets/light_ui2.dart';
import 'package:controls_web/controls/light_ui.dart';
import 'package:controls_web/controls/colores.dart';
import 'package:controls_web/controls/strap_widgets.dart';
import 'package:flutter/material.dart';

class LightView extends StatelessWidget {
  const LightView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
        direction: Axis.horizontal,
        spacing: 10,
        runSpacing: 10,
        children: [
          LightInfo(
            image: Icon(Icons.person),
            label: 'Hi Marcos,',
            sublabel: 'What do you want todo today?',
          ),
          LightTile(
            title: Text('LightTile'),
            subtitle: Text('subtitle'),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            LightAmmount(
              value: '\$1.024,22',
              label: 'Checking Account',
              sublabel: 'Balance',
            ),
            SizedBox(
              width: 20,
            ),
            LightAmmount(
              value: '\$24,22',
              label: 'Saldo Projetado',
              sublabel: 'LightAmmount',
            ),
          ]),
          LightButton(
              label: 'Statement|Kg',
              sublabel: 'June 2020|Available',
              image: Icon(Icons.person_add),
              value: '10.0 pc'),
          LightButton(
            color: genColor(2),
            backgroundColor: Colors.red[100],
            image: Icon(Icons.face),
            label: 'Transfer',
            sublabel: '12.984 points',
          ),
          LightButton(
            color: genColor(4),
            backgroundColor: Colors.deepOrange[100],
            image: Icon(Icons.shopping_bag),
            label: 'Bill Pay',
            sublabel: 'Due on May 14 th',
          ),
          LightImageTile(
            image: Image.network(
              'https://cdn.pixabay.com/photo/2020/07/23/17/54/mountain-5431950_960_720.png',
              width: 180,
              semanticLabel: 'Teste',
            ),
            label: 'Body warm up',
            sublabel: 'You shoud prepare your muscles1',
          ),
          Container(
            height: 150,
            width: 290,
            child: LightContainer(label: 'Share you pictures', children: [
              LightValueButton(
                leading: Icon(Icons.person),
                label: '32 min',
                sublabel: 'Total Time',
                onPressed: () {},
              ),
              LightValueButton(
                leading: Icon(Icons.person_add_alt),
                label: '62 min',
                sublabel: 'Total Time2',
                onPressed: () {},
              ),
            ]),
          ),
          StrapButton(
              width: 170,
              height: 90,
              //radius: 40,
              text: 'OK',
              leading: Icon(Icons.person),
              //trailing: Text('ok'),
              title: Text('StrapButton', style: TextStyle(fontSize: 18)),
              subtitle: Text('Vamos la ?'),
              onPressed: () {})
        ],
      ),
    );
  }
}
