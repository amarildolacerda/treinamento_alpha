import 'package:alpha/views/clientes/clientes_view.dart';
import 'package:controls_web/controls/tab_choice.dart';
import 'package:controls_web/controls/vertical_toptab_navigator.dart';
import 'package:flutter/material.dart';

import 'clientes/clientes_grid_page.dart';
import 'opcoes_page1.dart';

class OpcoesPage extends StatelessWidget {
  const OpcoesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerticalTopTabNavigatorController controller;
    return VerticalTopTabView(
        controller: controller ??= VerticalTopTabNavigatorController(),
        leading: Text('menu topdown ->', style: TextStyle(color: Colors.pink)),
        choices: [
          TabChoice(
            label: 'DataViewer',
            builder: () =>
                ClienteGridPage(), // carrega somente quando for selecionado
          ),
          /*  TabChoice(label: 'Configurações', items: [
            TabChoice(label: 'Opção A', onPressed: () {}),
            TabChoice(label: 'Opção B', onPressed: () {}),
          ]),
        */
          TabChoice(
            label: 'Dados Clientes',
            child: ClientesView(),
          ),
        ]);
  }
}
