import 'package:flutter/material.dart';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  ScrollController _scrollController = new ScrollController();
  List<int> _numerosEnteros = new List();
  int _ultimoItem = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _agregar10();

    _scrollController.addListener((){
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent)
      {
        _agregar10();
      }
    });
  }

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
      controller:  _scrollController,
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

  void _agregar10(){
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _numerosEnteros.add(_ultimoItem);
    }

    setState(() {
      
    });
  }
}