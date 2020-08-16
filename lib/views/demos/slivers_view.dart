import 'package:controls_web/controls/sliver_scaffold.dart';

import 'package:flutter/material.dart';

class SliverScaffoldView extends StatefulWidget {
  SliverScaffoldView({Key key}) : super(key: key);

  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<SliverScaffoldView> {
  @override
  Widget build(BuildContext context) {
    return SliverScaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('SliverScaffold Demo'),
      ),
      backgroundColor: Theme.of(context).primaryColor.withAlpha(5),
      topRadius: 10,
      bottomRadius: 0,
      //padding: EdgeInsets.all(8),
      //sliverAppBar: SliverAppBar(
      //  title:  Text('SliverAppbar')
      //  ,),

      drawer: Drawer(
        child: Text('drawer'),
      ),

      extendedBar: ExtendedAppBar(
        height: 150,
        color: Colors.cyan,
      ),

      body: Center(
          child: RaisedButton(
        child: Text('body'),
        onPressed: () {},
      )),
      bodyTop: -20,
      slivers: <Widget>[
        SliverToBoxAdapter(child: Container(height: 80, color: Colors.red)),
      ],
      bottomSlivers: _lists(),
      gridCrossAxisCount: 3,
      grid: <Widget>[
        Text('10'),
        Text('11'),
        Text('12'),
        Text('13'),
        Text('14'),
        Text('15'),
      ],
    );
  }

  _lists() {
    List<Widget> rt = [];
    for (var i = 0; i < 50; i++) {
      rt.add(ListTile(title: Text(i.toString())));
    }
    return rt;
  }
}
