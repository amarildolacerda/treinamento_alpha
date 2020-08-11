import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'clientes/clientes_view.dart';
import 'drawer_view.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Widget pagina;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerView(),
      ),
      appBar: AppBar(
        title: Text('App Alpha'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (x) => ClientesView()));
              }),
        ],
      ),
      body: SizedBox.expand(
        child: Row(children: [
          SizedBox(
              width: 180,
              height: double.infinity,
              child: Container(
                  color: Colors.amber,
                  child: ListView(children: [
                    ListTile(
                        title: Text('op1'),
                        onTap: () {
                          setState(() {
                            pagina = ClientesView();
                          });
                          /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (x) => ClientesView()));*/
                        }),
                    ListTile(
                        title: Text('op12'),
                        onTap: () {
                          setState(() {
                            pagina = Container();
                          });
                          /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (x) => ClientesView()));*/
                        }),
                  ]))),
          Expanded(child: pagina ?? Container()),
        ]),
      ),
    );
  }
}
