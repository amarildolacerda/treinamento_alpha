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
    int i = 0;
    ValueNotifier<int> paginaMudou = ValueNotifier<int>(0);

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
                          //setState(() {
                          /// usando notifer para indicar mudança de pagina
                          pagina = ClientesView();
                          paginaMudou.value = i++;
                          //});
                          /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (x) => ClientesView()));*/
                        }),
                    ListTile(
                        title: Text('op12'),
                        onTap: () {
                          //setState(() {
                          pagina = Container();
                          paginaMudou.value = i++;
                          //});
                          /*  Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (x) => ClientesView()));*/
                        }),
                  ]))),
          Expanded(
              child: ValueListenableBuilder<int>(

                  /// escutando que a pagina mudou.
                  valueListenable: paginaMudou,
                  builder: (ctr, i, w) => pagina ?? Container())),
        ]),
      ),
    );
  }
}

/// exemplo usando notificar a pagina (direto) - sem intermediarios

class Home2View extends StatefulWidget {
  Home2View({Key key}) : super(key: key);

  @override
  _Home2ViewState createState() => _Home2ViewState();
}

class _Home2ViewState extends State<Home2View> {
  @override
  Widget build(BuildContext context) {
    /// onde Widget é a pagina a ser mostrada
    ValueNotifier<Widget> paginaMudou = ValueNotifier<Widget>(null);
    ValueNotifier<int> index = ValueNotifier<int>(0);

    return Scaffold(
      drawer: Drawer(
        child: DrawerView(),
      ),
      appBar: AppBar(
        title: Text('App Alpha 2'),
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
                  child: ValueListenableBuilder(
                    valueListenable: index,
                    builder: (ctx, idx, w) => ListView(children: [
                      Container(
                        color: ((idx == 0) ? Colors.grey : Colors.transparent),
                        child: ListTile(
                            leading: Icon(Icons.add),
                            title: Text('op1'),
                            subtitle: Text('xxx'),
                            onTap: () {
                              //setState(() {
                              /// usando notifer para indicar mudança de pagina

                              paginaMudou.value = ClientesView();
                              index.value = 0;
                              //});
                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (x) => ClientesView()));*/
                            }),
                      ),
                      Divider(),
                      Container(
                        color: ((idx == 1) ? Colors.grey : Colors.transparent),
                        child: ListTile(
                            title: Text('op12'),
                            onTap: () {
                              //setState(() {

                              paginaMudou.value = Container();
                              index.value = 1;
                              //});
                              /*  Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (x) => ClientesView()));*/
                            }),
                      ),
                      Divider(),
                    ]),
                  ))),
          Expanded(
              child: ValueListenableBuilder<Widget>(

                  /// escutando que a pagina mudou.
                  valueListenable: paginaMudou,
                  builder: (ctr, widget, w) {
                    return widget ?? Container();
                  })),
        ]),
      ),
    );
  }

  desenhar(widget) {
    if (widget == null)
      return Container();
    else
      return widget;
  }
}
