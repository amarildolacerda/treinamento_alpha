# alpha

* carregando chrome com Gitpod
  
* instalar no chrome: Dart Debug extension
    Quando aparecer uma pagina em branco, 
    clique no botão -> Dart Debug extension


* Instruções básicas 

flutter create --org com.storeware alfa1


flutter upgrade
flutter pub get / flutter pub upgrade

flutter config -h


flutter config --enable-web
flutter config --enable-windows-desktop


* package controls_web
controls_web:
    git:
      url: https://github.com/amarildolacerda/flutter_dart.git
      path: controls_web


* reponsivo
****************************************************************
 ResponsiveInfo responsive;

  ThemeData theme;

****************************************************************

* declarando o theme

DynamicTheme(
        initial: Brightness.light,
        onData: (b) {
          print(b);
          if (b == Brightness.light)
            return ThemeData.light();
          else
            return ThemeData.dark();
        },
        builder: (ctx, theme) =>


----------------------------------------------------------------
// mudando o theme

IconButton(
              icon: Icon(Icons.settings_brightness),
              onPressed: () {
                var d =
                    (DynamicTheme.of(context).brightness == Brightness.light)
                        ? Brightness.dark
                        : Brightness.light;
                DynamicTheme.of(context).setBrightness(d);
              },
            )

****************************************************************


