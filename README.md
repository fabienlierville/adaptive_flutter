# Adaptive Flutter

Apprendre à créer un package qui s'adapte selon l'OS utilisé.
Ce package est destinée à la création d'applications [Flutter](https://flutter.io)

![ScreenShot](https://github.com/fabienlierville/adaptive_flutter/blob/master/screenshots/screen01.PNG)

## Getting Started

Pour utiliser ce package, ajouter au `pubspec.yaml`:

```yaml
dependencies:
 adaptive_codabee: ^1.0.2
```

## Usage

Dans le fichier Dart, importez :
```dart
import 'package:adaptive_flutter/adaptive_flutter.dart';
```

Utilisez le Scaffold
```dart
  Widget build(BuildContext context) {
    return Adaptive.scaffold(
        string: "Test package Adaptive",
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Adaptive.text(
                  string: "Notre application s'adapte selon la plateforme",
                color: Colors.red,
                size: 25,
                align: TextAlign.center
              ),
              Adaptive.button(
                  child: Adaptive.text(string: "Press Me"),
                  onPressed: (){
                    print("test");
                  }
              ),
              Adaptive.button(
                  child: Adaptive.text(string: "Alert"),
                  onPressed: (){
                    Adaptive.alert(context: context);
                  }
              )
            ],
          ),
        )
    );
  }
```

