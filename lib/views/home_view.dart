import 'package:alpha/views/builders/theme_notifier.dart';
import 'package:alpha/views/clientes/clientes_view.dart';
import 'package:controls_web/controls/horizonta_tab_view.dart';
import 'package:controls_web/controls/masked_field.dart';
import 'package:controls_web/controls/tab_choice.dart';
import 'package:controls_web/themes/themes.dart';
import 'package:flutter/material.dart';

import 'drawer_view.dart';
import 'opcoes_page.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(child: DrawerView()),
        appBar: AppBar(
          title: Text('menu'),
          actions: [
            Container(
              width: 200,
              height: kMinInteractiveDimension,
              child: MaskedSwitchFormField(
                value: false,
                label: 'Custom',
                onChanged: (b) {
                  ThemeCustomNotifierStream().notify(b);
                },
              ),
            ),

            /// trocar o tema.
            IconButton(
                icon: Icon(Icons.settings_brightness),
                onPressed: () {
                  var dynamicTheme = DynamicTheme.of(context);
                  var b = (dynamicTheme.brightness == Brightness.light)
                      ? Brightness.dark
                      : Brightness.light;
                  dynamicTheme.setBrightness(b);
                })
          ],
        ),
        body: StreamBuilder<bool>(
            initialData: false,
            stream: ThemeCustomNotifierStream().stream,
            builder: (context, streamData) {
              /// noficação de uso custom
              bool customColor = streamData.data;

              /// menu de navegação esquerdo
              return HorizontalTabView(
                indicatorColor: !customColor ? null : Colors.red[200],
                iconColor: !customColor ? null : Colors.blue[400],
                tabColor: !customColor ? null : Colors.red[100],
                tagColor: !customColor ? null : Colors.lightBlue,
                color: !customColor ? null : Colors.amber[100],

                /// rodapé
                pageBottom: Container(
                    color: !customColor ? null : Colors.amber,
                    height: kMinInteractiveDimension,
                    alignment: Alignment.centerLeft,
                    child: Text('Demonstração controls_web package')),
                width: 200,

                /// opções do menu
                choices: [
                  TabChoice(
                      icon: Icons.account_box,
                      label: 'OpçõesView',
                      child: OpcoesPage()),
                  TabChoice(
                      icon: Icons.accessible,
                      label: 'ClientesView',
                      child: ClientesView()),
                ],
              );
            }));
  }
}
