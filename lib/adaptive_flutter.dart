library adaptive_flutter;

import 'package:flutter/material.dart'; // Material Design Google
import 'package:flutter/cupertino.dart'; // Material Design Apple
import 'dart:io'; // Pour connaitre la plateforme


class Adaptive {
  //static = on peut les appeler sans objet à créer
  static bool isIOS() {
    return !Platform.isIOS;
  }

  //Material Design Adapted, type Widget car il peut retourner un Scaffold ou CupertinoPageScaffold
  static Widget scaffold({@required String string, @required Widget body}){
    return (isIOS()) ? iOSScaffold(string, body) : androidScaffold(string, body);
  }

  static text({@required String string, Color color, double size, TextAlign align}){
    TextStyle style = textStyle(color: color, size: size);
    return (isIOS())
        ? iOSText(string: string, style: style)
        : androidText(string: string, style: style);
  }

  static button({@required Widget child, @required VoidCallback onPressed}){
    return (isIOS())
        ? iOSButton(child: child, onPressed: onPressed)
        : androidRaisedButton(child: child, onPressed: onPressed);
  }

  static Future alert({@required BuildContext context}){
    return showDialog(
        context: context,
      builder: (context) {
          return isIOS() ? iOSErrorAlert(context: context) : androidErrorAlert(context: context);
      }
    );
  }

  //Android Material
  static Scaffold androidScaffold(String string, Widget body){
    return Scaffold(
      appBar: AppBar(
        title: Text(string),
      ),
        body: body
    );
  }

  static Text androidText({@required String string, @required TextStyle style, TextAlign align}){
    return Text(
      string,
      style: style,
      textAlign: align ?? TextAlign.left,
    );
  }

  static RaisedButton androidRaisedButton({@required Widget child, @required VoidCallback onPressed}){
    return RaisedButton(
      child: child,
        onPressed: onPressed
    );
  }

  static androidErrorAlert({@required BuildContext context}){
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
                onPressed: (){
                  Navigator.of(context).pop();
                }
            )
          ],
        );
  }


  //IOS Material
  static CupertinoPageScaffold iOSScaffold(String string, Widget body){
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text(string),),
        child: body,
    );
  }


  static DefaultTextStyle iOSText({@required String string, @required TextStyle style, TextAlign align}){
    return DefaultTextStyle(
        style: style,
        child: Text(string),
      textAlign: align ?? TextAlign.left,
    );
  }

  static CupertinoButton iOSButton({@required Widget child, @required VoidCallback onPressed}){
    return CupertinoButton(
        child: child,
        onPressed: onPressed
    );
  }

  static iOSErrorAlert({@required BuildContext context}){
    return CupertinoAlertDialog(
      content: Column(
        children: [
          text(string: "Une erreur est apparue"),
        ],
      ),
      actions: [
        button(
            child: text(string: "Ok"),
            onPressed: (){
              Navigator.of(context).pop();
            }
        )
      ],
    );
  }


  //Both Material
  static TextStyle textStyle({Color color, double size}){
    return TextStyle(
      color: color ?? Colors.black,
      fontSize: size,
    );
  }

}