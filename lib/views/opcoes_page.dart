import 'package:controls_web/controls/tab_choice.dart';
import 'package:controls_web/controls/vertical_toptab_navigator.dart';
import 'package:flutter/material.dart';

import 'opcoes_page1.dart';

class OpcoesPage extends StatelessWidget {
  const OpcoesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VerticalTopTabView(choices: [
      TabChoice(
        label: 'Opções',
        child: OpceosPage1(),
      ),
      TabChoice(
        label: 'Opções2',
        child: Text('xxxx2'),
      )
    ]);
  }
}
