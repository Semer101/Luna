class AppConfig {
  static const appName = 'Luna AI';
  static const tagline = 'Your AI Wellness Copilot';

  static String supabaseUrl = const String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: '',
  );
  static String supabaseAnonKey = const String.fromEnvironment(
    'SUPABASE_ANON_KEY',
    defaultValue: '',
  );
  static String geminiApiKey = const String.fromEnvironment(
    'GEMINI_API_KEY',
    defaultValue: '',
  );

  static bool get isDemoMode =>
      supabaseUrl.isEmpty || supabaseAnonKey.isEmpty;

  static bool get hasGemini => geminiApiKey.isNotEmpty;

  static void loadFromEnv(Map<String, String> env) {
    if (env['SUPABASE_URL']?.isNotEmpty == true) {
      supabaseUrl = env['SUPABASE_URL']!;
    }
    if (env['SUPABASE_ANON_KEY']?.isNotEmpty == true) {
      supabaseAnonKey = env['SUPABASE_ANON_KEY']!;
    }
    if (env['GEMINI_API_KEY']?.isNotEmpty == true) {
      geminiApiKey = env['GEMINI_API_KEY']!;
    }
  }
}
