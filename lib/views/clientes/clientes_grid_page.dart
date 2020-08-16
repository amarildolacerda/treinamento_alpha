import 'package:controls_web/controls/data_viewer.dart';
import 'package:controls_web/controls/data_viewer_helper.dart';
import 'package:controls_web/controls/dialogs_widgets.dart';
import 'package:controls_web/controls/masked_field.dart';
import 'package:controls_web/controls/paginated_grid.dart';
import 'package:controls_web/controls/strap_widgets.dart';
import 'package:flutter/material.dart';

import 'radio_grouped.dart';

class ClienteGridPage extends StatefulWidget {
  const ClienteGridPage({Key key}) : super(key: key);

  @override
  _ClienteGridPageState createState() => _ClienteGridPageState();
}

bool customColumns = true;

class _ClienteGridPageState extends State<ClienteGridPage> {
  ValueNotifier<bool> notifier = ValueNotifier<bool>(false);
  bool canEdit = false;
  bool canSearch = false;
  bool showPageNavigatorButtons = false;
  DataViewerController controller;
  var source = [
    {
      'codigo': 1,
      "nome": 'Jose Silva',
      'ender': 'Rua abc,23',
      'inativo': 'N',
      'data': DateTime.now()
    },
    {
      'codigo': 2,
      "nome": 'Roberto Silva',
      'ender': 'Rua Parque Domingos Luiz, 690',
      'data': DateTime.now()
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: notifier,
            builder: (ctr, b, widget) => DataViewer(
              canInsert: canEdit,
              canDelete: canEdit,
              canEdit: canEdit,
              canSearch: canSearch,
              controller: controller ??= DataViewerController(
                  keyName: 'codigo', future: () async => source),
              showPageNavigatorButtons: showPageNavigatorButtons,
              source: source,
              columns: (customColumns) ? getColumns() : null,
            ),
          ),
        ),
        buildContainer(),
      ],
    );
  }

  Widget buildContainer() {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (ctr, b, widget) => Container(
              width: 300,
              child: Column(children: [
                MaskedSwitchFormField(
                  label: 'canEdit',
                  value: canEdit,
                  onChanged: (b) {
                    print(b);
                    canEdit = b;
                    notifier.value = !notifier.value;
                  },
                ),
                MaskedSwitchFormField(
                  label: 'canSearch',
                  value: canSearch,
                  onChanged: (b) {
                    print(b);
                    canSearch = b;
                    notifier.value = !notifier.value;
                  },
                ),
                MaskedSwitchFormField(
                  label: 'showPageNavigatorButtons',
                  value: showPageNavigatorButtons,
                  onChanged: (b) {
                    showPageNavigatorButtons = b;
                    notifier.value = !notifier.value;
                  },
                ),
                MaskedSwitchFormField(
                  label: 'customColumns',
                  value: customColumns,
                  onChanged: (b) {
                    customColumns = b;
                    notifier.value = !notifier.value;
                  },
                ),
                StrapButton(
                    text: 'Form Edit',
                    type: buttonType,
                    width: 140,
                    height: 60,
                    subtitle: Text(buttonType.toString().split('.')[1]),
                    onPressed: () {
                      Dialogs.showPage(context,
                          child: DadosEditDialog(
                            controller: controller,
                            row: source[0],
                          ));
                    }),
                RadioGrouped(
                  itemWidth: 150,
                  selected: buttonType.index,
                  title: Text('StrapButton - opções para o botão'),
                  direction: Axis.horizontal,
                  children: [
                    for (var item in StrapButtonType.values)
                      item.toString().split('.')[1],
                  ],
                  onChanged: (x) {
                    buttonType = StrapButtonType.values[x];
                    print(buttonType);
                    notifier.value = !notifier.value;
                  },
                )
              ]),
            ));
  }

  var buttonType = StrapButtonType.danger;
  List<PaginatedGridColumn> getColumns() {
    return [
      DataViewerColumn(
          name: 'codigo',
          isPrimaryKey: true,
          width: 100,
          numeric: true,
          label: 'Cód.  '),
      DataViewerColumn(
        name: 'nome',
        label: 'Nome do Contato',
        editWidth: 350,
        //maxLength: 50,
        //minLength: 10,
      ),

      /// [width] marca uma largura da coluna
      DataViewerColumn(
          name: 'ender',
          width: 250,
          align: Alignment.center,
          label: 'Endereço|Cobrança'),

      /// usando helper para transformar funcionalidade da coluna
      ///  [DataViewerHelper] -> helpers
      (DataViewerHelper.simnaoColumn(
        DataViewerColumn(name: 'inativo', align: Alignment.center),
        trueValue: 'S',
        falseValue: 'N',
      ) as PaginatedGridColumn) // "as" para fazer cast para tipo de coluna
        ..builder = (i, x) {
          /// [builder] criar um component no grid
          return MaskedSwitchFormField(label: '', value: x['inativo'] == 'S');
        },
      DataViewerColumn(
          name: 'data',
          label: 'Data|Registro',
          align: Alignment.centerRight,

          /// [onGetValue] permite fazer um translate do valor
          onGetValue: (x) {
            return (x as DateTime)?.toIso8601String()?.substring(0, 10) ?? '';
          },

          /// cria um componente de edição para o valor da coluna
          editBuilder: (a, b, x, d) => Container(
                width: 150,
                child: MaskedDatePicker(
                  initialValue: x ?? DateTime.now(),
                ),
              )),
    ];
  }
}

/*-------------------------------- edição ------------------------------*/
class DadosEditDialog extends StatelessWidget {
  final DataViewerController controller;
  final dynamic row;
  const DadosEditDialog({Key key, this.controller, this.row}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataViewerEditGroupedPage(
      title: 'Alteração dados do contato',
      event: PaginatedGridChangeEvent.update,
      controller: controller,
      data: row,
      grouped: [
        DataViewerGroup(title: 'Identificação', children: ['codigo', 'nome']),
        DataViewerGroup(title: 'Endereço de Cobrança', children: ['ender']),
        DataViewerGroup(title: 'Validação', children: ['inativo']),
      ],
      onSaved: (x) {
        Navigator.pop(context);
      },
    );
  }
}
