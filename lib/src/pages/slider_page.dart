import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  
  double _valorSlider = 100.0;
  bool _bloquearcheck = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: <Widget>[
            _crearSlider(),
            _checkBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen()
            )
          ],
        )
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      //divisions: 20,
      value: _valorSlider,
      min: 10.0,
      max: 400.0,
      onChanged: (_bloquearcheck) ? null :  (valor){
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

 Widget _crearImagen() {
   return Image(
     image: NetworkImage('https://img.pngio.com/pogchamp-pogchamp-png-free-png-images-clipart-download-17943-pogchamp-png-920_737.png'),
     width: _valorSlider,
     fit: BoxFit.contain,
   );
 }

  Widget _checkBox() {
    return CheckboxListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearcheck,
      onChanged: (valor){
        setState(() {
        _bloquearcheck = valor;      
        });
      },
    );
  }

  Widget _crearSwitch() {

    return SwitchListTile(
      title: Text('Bloquear Slider'),
      value: _bloquearcheck,
      onChanged: (valor){
        setState(() {
        _bloquearcheck = valor;      
        });
      },
    );
  }
}