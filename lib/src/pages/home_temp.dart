import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget 
{

  final opciones = ['Uno','dos','tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Text('Componentes Temp'),
      ),
      body: ListView
      (
        //children: _crearItems()
        children: _crearItemsCortos()
      ),
    );
  }

  List<Widget> _crearItems()
  {
    List<Widget> lista = new List<Widget>();

    for (String opt in opciones) 
    {
      final tempWidget = ListTile
      (
        title: Text(opt),
      );

      lista..add(tempWidget)
           ..add(Divider(color: Colors.deepOrange,));
    }
    return lista;
  }

  List<Widget> _crearItemsCortos()
  {
    return opciones.map((item)
    {
      return Column(
        children: <Widget>
        [
          ListTile
          (
           title: Text(item +'!'), 
           subtitle: Text('Cualquier Cosa'),
           leading: Icon(Icons.account_balance_wallet),
           trailing: Icon(Icons.keyboard_arrow_right),
           onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}