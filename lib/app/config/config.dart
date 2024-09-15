// lib/env/env.dart
import 'package:envied/envied.dart';

part 'config.g.dart';

@Envied(path: '.env', obfuscate: true)
abstract class Config {
  @EnviedField(varName: 'PIXABAY_API_KEY')
  static String pixabayApiKey = _Config.pixabayApiKey;
}
