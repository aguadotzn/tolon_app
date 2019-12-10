import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tolon_app/styles/ImagesReferences.dart';

import '../../../widgets/PrimaryButton.dart';

class LoginPageIB {
  static Widget build(
      BuildContext context,
      Function() onPressed,
      Function() onSeeEvents,
      Function() onPressedRegister,
      TextEditingController usernameController,
      TextEditingController passwordController,
      Function() checkEnableLogin,
      bool isEnable) {
    FocusNode passwordFocus = FocusNode();

    return SafeArea(
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
                  onChanged: (value) {
                    checkEnableLogin();
                  },
                  onFieldSubmitted: (value) {
                    passwordFocus.requestFocus();
                  },
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  focusNode: passwordFocus,
                  controller: passwordController,
                  decoration: InputDecoration(
                      labelText: "Contraseña", border: OutlineInputBorder()),
                  obscureText: true,
                  onChanged: (value) {
                    checkEnableLogin();
                  },
                  onEditingComplete: () {
                    FocusNode newFocus = FocusNode();
                    newFocus.requestFocus();
                  },
                ),
              ],
            ),
            SizedBox(
              height: 36,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                PrimaryButton(
                  onPressed: isEnable == true ? onPressed : null,
                  title: "Iniciar sesión",
                ),
                FlatButton(
                  child: Text(
                    "Registrarse",
                    style: TextStyle(color: Theme.of(context).accentColor),
                  ),
                  onPressed: onPressedRegister,
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
    );
  }
}
