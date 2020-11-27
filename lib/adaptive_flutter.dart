library adaptive_flutter;

import 'package:flutter/material.dart'; // Material Design Google
import 'package:flutter/cupertino.dart'; // Material Design Apple
import 'dart:io'; // Pour connaitre la plateforme

class Adaptive {
  /// Check Platform
  static bool isIOS() {
    return !Platform.isIOS;
  }

  /// Fonction pour le Scaffold adapté
  static Widget scaffold({@required String string, @required Widget body}) {
    return (isIOS())
        ? iOSScaffold(string, body)
        : androidScaffold(string, body);
  }

  /// Fonction pour le Text adapté
  static text(
      {@required String string, Color color, double size, TextAlign align}) {
    TextStyle style = textStyle(color: color, size: size);
    return (isIOS())
        ? iOSText(string: string, style: style)
        : androidText(string: string, style: style);
  }

  /// Fonction pour le bouton adapté
  static button({@required Widget child, @required VoidCallback onPressed}) {
    return (isIOS())
        ? iOSButton(child: child, onPressed: onPressed)
        : androidRaisedButton(child: child, onPressed: onPressed);
  }

  /// Fonction pour alert adapté
  static Future alert({@required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return isIOS()
              ? iOSErrorAlert(context: context)
              : androidErrorAlert(context: context);
        });
  }

  /// Android Material
  /// A ne pas intégrer directementau code mais plutot utiliser les fonctions

  /// Le Scaffold Android
  static Scaffold androidScaffold(String string, Widget body) {
    return Scaffold(
        appBar: AppBar(
          title: Text(string),
        ),
        body: body);
  }

  /// Le Text Android
  static Text androidText(
      {@required String string, @required TextStyle style, TextAlign align}) {
    return Text(
      string,
      style: style,
      textAlign: align ?? TextAlign.left,
    );
  }

  /// Le RaisedButton Android
  static RaisedButton androidRaisedButton(
      {@required Widget child, @required VoidCallback onPressed}) {
    return RaisedButton(child: child, onPressed: onPressed);
  }

  /// Le Alert Android
  static androidErrorAlert({@required BuildContext context}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min, // Pour ne pas prendre toute la hauteur
        children: [
          text(string: "Une erreur est apparue"),
        ],
      ),
      actions: [
        button(
            child: text(string: "OK"),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }

  /// IOS Material
  /// A ne pas intégrer directementau code mais plutot utiliser les fonctions

  /// Le Scaffold Ios
  static CupertinoPageScaffold iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(string),
      ),
      child: body,
    );
  }

  /// Le Text + Style Ios
  static DefaultTextStyle iOSText(
      {@required String string, @required TextStyle style, TextAlign align}) {
    return DefaultTextStyle(
      style: style,
      child: Text(string),
      textAlign: align ?? TextAlign.left,
    );
  }

  /// Le Bouton Ios
  static CupertinoButton iOSButton(
      {@required Widget child, @required VoidCallback onPressed}) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }

  /// Le Alert Ios
  static iOSErrorAlert({@required BuildContext context}) {
    return CupertinoAlertDialog(
      content: Column(
        children: [
          text(string: "Une erreur est apparue"),
        ],
      ),
      actions: [
        button(
            child: text(string: "Ok"),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }

  /// BOTH Material
  /// A ne pas intégrer directementau code mais plutot utiliser les fonctions

  /// Le TextStyle partagé
  static TextStyle textStyle({Color color, double size}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size,
    );
  }
}
