import 'package:controls_web/controls/strap_widgets.dart';
import 'package:flutter/material.dart';

class OpceosPage1 extends StatelessWidget {
  const OpceosPage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String nomePessoa = 'jose silva';
    String telefone = ' 43453453';
    String rua = ' av. ....';
    String numero = '123123';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            child: Image.asset('pagina1.png'),
          ),
          Container(
            width: double.maxFinite,
            child: Text(
              'Mostrar Imagem',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
              initialValue: nomePessoa,
              //controller: _nomePessoaController,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
              decoration: InputDecoration(
                //border: InputBorder.none,
                labelText: 'Nome da Pessoa',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Falta informar: nomePessoa';
                }
                return null;
              },
              onChanged: (x) {
                print('Digitou $x');
              },
              onSaved: (x) {
                nomePessoa = x;
              }),
          TextFormField(
              initialValue: telefone,
              //controller: _telefoneController,
              style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
              decoration: InputDecoration(
                //border: InputBorder.none,
                labelText: 'telefone',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Falta informar: telefone';
                }
                return null;
              },
              onSaved: (x) {
                telefone = x;
              }),
          Row(children: [
            Container(
              width: 180,
              child: TextFormField(
                  initialValue: rua,
//controller: _ruaController,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    labelText: 'rua',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Falta informar: rua';
                    }
                    return null;
                  },
                  onSaved: (x) {
                    rua = x;
                  }),
            ),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              width: 80,
              child: TextFormField(
                  initialValue: numero,
                  //controller: _numeroController,
                  style: TextStyle(fontSize: 16, fontStyle: FontStyle.normal),
                  decoration: InputDecoration(
                    //border: InputBorder.none,
                    labelText: 'numero',
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Falta informar: numero';
                    }
                    return null;
                  },
                  onSaved: (x) {
                    numero = x;
                  }),
            ),
          ]),
          SizedBox(height: 8),
          StrapButton(radius: 30, text: 'Salvar', onPressed: () {}),
        ],
      ),
    );
  }
}
