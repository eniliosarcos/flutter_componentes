import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _nombre = '';
  String _email = '';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Ingreso de inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
            _crearInputs(),
            Divider(),
            _crearEmail(),
            Divider(),
            _crearPassword(),
            Divider(),
            _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInputs() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        counter: Text('Letras ${_nombre.length}'),
        hintText: 'Nombre de la persona',
        labelText: 'Nombre',
        helperText: 'Solo es el nombre',
        icon: Icon(Icons.accessibility_new),
      ),
      onChanged: (value){
        setState(() {
        _nombre = value;
        });
      },
    );
  }

    Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es $_nombre'),
      subtitle: Text('Correo : $_email'),
    );
  }

  _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Email de la persona',
        labelText: 'Email',
        helperText: 'Solo es el Email',
        icon: Icon(Icons.email),
      ),
      onChanged: (value){
        setState(() {
        _email = value;
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Password de la persona',
        labelText: 'Password',
        helperText: 'Solo es el password',
        icon: Icon(Icons.lock),
      ),
      onChanged: (value){
        setState(() {
       // _email = value;
        });
      },
    );
  }
}