import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: 'api.env', requireEnvFile: true)
class Env {
  @EnviedField(varName: 'SUPABASE_URL', defaultValue: '', obfuscate: true)
  static String supabaseUrl = _Env.supabaseUrl;

  @EnviedField(varName: 'SUPABASE_ANON_KEY', defaultValue: '', obfuscate: true)
  static String supabaseAnonKey = _Env.supabaseAnonKey;
}
