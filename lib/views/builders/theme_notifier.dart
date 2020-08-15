import 'package:controls_web/drivers/bloc_model.dart';

/// Singleton para notificar que as cores a usar é custom.
/// usa Stream para noficar o client;
class ThemeCustomNotifierStream extends BlocModel<bool> {
  static final _singleton = ThemeCustomNotifierStream._create();
  ThemeCustomNotifierStream._create();
  factory ThemeCustomNotifierStream() => _singleton;
}
