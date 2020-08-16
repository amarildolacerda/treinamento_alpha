import 'package:controls_web/controls/masked_field.dart';
import 'package:controls_web/controls/responsive.dart';
import 'package:controls_web/controls/sliver_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:controls_extensions/extensions.dart';

bool globalBValue = false;

class GridResponsiveView extends StatelessWidget {
  const GridResponsiveView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResponsiveInfo responsive = ResponsiveInfo(context);

    ValueNotifier<bool> larguraFixa = ValueNotifier<bool>(globalBValue);

    int colunas = (responsive.isSmalest)
        ? 1
        : responsive.isSmall
            ? 3
            : responsive.isMobile ? 5 : responsive.isTablet ? 7 : 9;
    return ScaffoldLight(
        appBar: appBarLight(title: Text('app bar light'), actions: [
          Container(
            width: 180,
            height: 42,
            child: MaskedSwitchFormField(
              value: larguraFixa.value,
              label: 'fixa',
              onChanged: (b) {
                larguraFixa.value = b;
              },
            ),
          )
        ]),
        body: ValueListenableBuilder(
            valueListenable: larguraFixa,
            builder: (_, b, w) => GridView.count(
                  crossAxisCount:
                      (!b) ? colunas : (responsive.size.width ~/ 80),
                  children: [
                    for (var i in 0.range(1, 50))
                      Container(
                        alignment: Alignment.center,
                        color: [Colors.green[50], Colors.green[200]][i % 2],
                        child: Text(
                          i.toString(),
                        ),
                      ),
                  ],
                )));
  }
}
