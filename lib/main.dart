import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contato Form',
      theme: ThemeData(
         primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ContatoModel contato = new ContatoModel();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(contato.nome ?? ''),
      ),
      body: Form(
        //key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 20,
            runSpacing: 10,
            children: <Widget>[
              TextFormField(
                validator: nomeValidator() ,
                onChanged: updateNome,
                decoration: InputDecoration(labelText: "Nome"),
              )
            ],
          ),

        ),
      ),
    );
  }
}

class ContatoModel{
  String nome;
  String email;
  String cpf;
  String telefone;
  ContatoType tipo;
}

enum ContatoType{CELULAR, TRABALHO, FAVORITO, CASA}

void updateNome(nome) => contato.nome = nome;
FieldValidator nomeValidator(){
  return MultiValidator([
    RequiredValidator(errorText: 'Campo Obrigatório'),
    MinLengthValidator(4, errorText: 'Minimo 4')
  ]);
}