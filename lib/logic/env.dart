class Env {
  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const String supabaseAnonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  static void validate() {
    if (supabaseUrl.isEmpty || supabaseAnonKey.isEmpty) {
      throw Exception(
        'Error: Missing Supabase configuration.\n'
        'Please run the project using a configuration file:\n'
        '  flutter run --dart-define-from-file=.env.json\n\n'
        'Or by passing parameters directly:\n'
        '  flutter run --dart-define=SUPABASE_URL=YOUR_URL --dart-define=SUPABASE_ANON_KEY=YOUR_KEY'
      );
    }
  }
}
