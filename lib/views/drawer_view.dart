import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBar(title: Text('Opções')),
          Container(
              height: 100,
              //width: double.maxFinite,
              color: Colors.amber,
              child: Container(
                height: 30,
                width: 30,
                child: CircleAvatar(
                  //maxRadius: 10,
                  //radius: 5,

                  child: Icon(
                    Icons.pages,
                    size: 30,
                  ),
                ),
              )),
          Expanded(
            child: ListView(
              //shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.flaky),
                  title: Text('drawer'),
                  trailing: IconButton(
                      icon: Icon(Icons.arrow_right),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  subtitle: Text('subtitle'),
                ),
                ListTile(title: Text('drawer2')),
                RaisedButton(
                  child: Text('ok'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
