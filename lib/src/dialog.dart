import 'package:flutter/material.dart';

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
 }

enum DialogAction{
  yes,
  no
}

class _MyDialogState extends State<MyDialog> {

  String  inputValue="";

  void  alertResult(DialogAction  action){
    print("Tu seleccion es $action");
  }

  void  showAlert(String  value){
    AlertDialog dialog=AlertDialog(
      content: Text(value),
      actions: <Widget>[
        FlatButton(
          child: Text("Si"),
          onPressed: (){alertResult(DialogAction.yes);},
          ),
        FlatButton(
          child: Text("No"),
          onPressed: (){alertResult(DialogAction.no);},
          )
      ],
    );

    showDialog(
      context:  context,
      builder: (BuildContext  context){
        return dialog;} );
  }

  void onChange(String value){
    setState(() {
      inputValue=value;
    });

  }

  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     appBar: AppBar(
       title: Text("Dialog App"),
     ),
     body: Container(
       child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(hintText: "Ingrese Texto Aqui"),
            onChanged: onChange,
          ),
          RaisedButton(
                child: Text("Alert",style: TextStyle(color: Colors.white),),
                color: Colors.blueAccent,
                onPressed: (){showAlert(inputValue);},
                )
        ],),
     ),
   );
  }
}