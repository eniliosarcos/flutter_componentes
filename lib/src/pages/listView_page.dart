import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  List<int> _numerosEnteros = [1,2,3,4,5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: _crearListas(),
    );
  }

  Widget _crearListas() {
    return ListView.builder(
      itemCount: _numerosEnteros.length,
      itemBuilder: (BuildContext context,int index){
       
        final imagen = _numerosEnteros[index];
        
        return FadeInImage(
          image:  NetworkImage('https://picsum.photos/500/300/?images=$imagen'),
          placeholder: AssetImage('assets/jar-loading.gif') ,
        );
      },
    );
  }
}