import 'package:alpha/views/clientes/clientes_view.dart';
import 'package:controls_web/controls/horizonta_tab_view.dart';
import 'package:controls_web/controls/tab_choice.dart';
import 'package:flutter/material.dart';

import 'drawer_view.dart';
import 'opcoes_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(child: DrawerView()),
      appBar: AppBar(title: Text('menu')),
      body: HorizontalTabView(
        choices: [
          TabChoice(
              icon: Icons.accessible,
              label: 'Op1',
              builder: () => ClientesView()),
          TabChoice(
              icon: Icons.account_box,
              label: 'Op2',
              builder: () => OpcoesPage()),
        ],
      ),
    );
  }
}


