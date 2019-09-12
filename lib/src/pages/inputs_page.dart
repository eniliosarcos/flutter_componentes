import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {
  @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {

  String _nombre = '';
  String _email = '';
  String _fecha = '';

  String _opcionSeleccioanda = 'Volar';

  TextEditingController _inputFieldDateController = new TextEditingController();

  List<String> _poderes = ['Volar', 'Rayos X', 'Super Aliento', 'Super fuerza'];

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
            _crearFecha(context), 
            Divider(),
            _crearDropdown(),          
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
      trailing: Text(_opcionSeleccioanda),
    );
  }

  Widget _crearEmail() {
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

  Widget _crearPassword() {
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

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration:  InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        hintText: 'Fecha de nacimiento de la persona',
        labelText: 'fecha de nacimiento',
        helperText: 'Solo es la fecha de nacimiento',
        icon: Icon(Icons.calendar_today),
      ),
      onTap: (){
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {

      DateTime picked = await showDatePicker(
      context: context,
      initialDate:  new DateTime.now(),
      firstDate: new DateTime(2018),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if(picked != null)
    {
      setState(() {
       _fecha = picked.toString();
       _inputFieldDateController.text = _fecha;        
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropDown(){
   
    List<DropdownMenuItem<String>> lista = new List();

    _poderes.forEach((poder){
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    });

    return lista;
  }

  Widget _crearDropdown() {

    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
            value: _opcionSeleccioanda,
            items: getOpcionesDropDown(),
            onChanged: (opt) {
             setState(() {
              _opcionSeleccioanda = opt;
            });
            },
          ),
        )
      ],
    );




  }
}