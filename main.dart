import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Login',
                    hintText: 'Login'
                  ),
                  controller: _emailController,
                  validator: validateEmail,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    hintText: '* * * * * * * *'
                  ),
                  controller: _passwordController,
                  obscureText: true,
                  validator: validatePassword,
                ),
                SizedBox(
                  height: 40,
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      if (_emailController.text == 'flutter' &&
                          _passwordController.text == 'dart') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecondRoute()),
                        );
                      } else {
                        _showMyDialog();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String validateEmail(String text) {
    if (_emailController.text == '' || _emailController.text == null) {
      return 'O campo não pode estar vazio!';
    } else {
      return null;
    }
  }

  String validatePassword(String text) {
    if (_passwordController.text == '' || _passwordController.text == null) {
      return 'O campo não pode estar vazio!';
    } else {
      return null;
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Senha inválida'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Por favor, revise as informações inseridas.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok!'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Text('Você está logado!'),
      ),
    );
  }
}
