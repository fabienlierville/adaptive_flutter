library adaptive_flutter;

import 'package:flutter/material.dart'; // Material Design Google
import 'package:flutter/cupertino.dart'; // Material Design Apple
import 'dart:io'; // Pour connaitre la plateforme

class Adaptive {
  /// Check Platform
  static bool _isIOS() {
    return !Platform.isIOS;
  }

  /// Fonction pour le Scaffold adapté
  static Widget scaffold({@required String string, @required Widget body}) {
    return (_isIOS())
        ? _iOSScaffold(string, body)
        : _androidScaffold(string, body);
  }

  /// Fonction pour le Text adapté
  static text(
      {@required String string, Color color, double size, TextAlign align}) {
    TextStyle style = _textStyle(color: color, size: size);
    return (_isIOS())
        ? _iOSText(string: string, style: style)
        : _androidText(string: string, style: style);
  }

  /// Fonction pour le bouton adapté
  static button({@required Widget child, @required VoidCallback onPressed}) {
    return (_isIOS())
        ? _iOSButton(child: child, onPressed: onPressed)
        : _androidRaisedButton(child: child, onPressed: onPressed);
  }

  /// Fonction pour alert adapté
  static Future alert({@required BuildContext context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return _isIOS()
              ? _iOSErrorAlert(context: context)
              : _androidErrorAlert(context: context);
        });
  }

  /// Android Material
  /// A ne pas intégrer directementau code mais plutot utiliser les fonctions

  /// Le Scaffold Android
  static Scaffold _androidScaffold(String string, Widget body) {
    return Scaffold(
        appBar: AppBar(
          title: Text(string),
        ),
        body: body);
  }

  /// Le Text Android
  static Text _androidText(
      {@required String string, @required TextStyle style, TextAlign align}) {
    return Text(
      string,
      style: style,
      textAlign: align ?? TextAlign.left,
    );
  }

  /// Le RaisedButton Android
  static RaisedButton _androidRaisedButton(
      {@required Widget child, @required VoidCallback onPressed}) {
    return RaisedButton(child: child, onPressed: onPressed);
  }

  /// Le Alert Android
  static _androidErrorAlert({@required BuildContext context}) {
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
  static CupertinoPageScaffold _iOSScaffold(String string, Widget body) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(string),
      ),
      child: body,
    );
  }

  /// Le Text + Style Ios
  static DefaultTextStyle _iOSText(
      {@required String string, @required TextStyle style, TextAlign align}) {
    return DefaultTextStyle(
      style: style,
      child: Text(string),
      textAlign: align ?? TextAlign.left,
    );
  }

  /// Le Bouton Ios
  static CupertinoButton _iOSButton(
      {@required Widget child, @required VoidCallback onPressed}) {
    return CupertinoButton(child: child, onPressed: onPressed);
  }

  /// Le Alert Ios
  static _iOSErrorAlert({@required BuildContext context}) {
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
  static TextStyle _textStyle({Color color, double size}) {
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size,
    );
  }
}
