import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tolon_app/styles/ImagesReferences.dart';

class LoginPageIB {
  static Widget build(
    BuildContext context,
    Function() onPressed,
    Function() onSeeEvents,
    TextEditingController usernameController,
    TextEditingController passwordController,
  ) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 8,
              ),
              Image.asset(
                ImageReferences.icon,
                width: 140,
              ),
              SizedBox(
                height: 36,
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                        labelText: "Usuario", border: OutlineInputBorder()),
                    onChanged: null,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: "Contraseña", border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                ],
              ),
              SizedBox(
                height: 36,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  RaisedButton(
                    child: Text("Iniciar sesión"),
                    onPressed: onPressed,
                  ),
                  FlatButton(
                    child: Text(
                      "Registrarse",
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    onPressed: onPressed,
                    color: Colors.transparent,
                  ),
                  FlatButton(
                    child: Text(
                      "Ver eventos",
                      style: TextStyle(color: Theme.of(context).accentColor),
                    ),
                    onPressed: onSeeEvents,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
