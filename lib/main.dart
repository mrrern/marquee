import 'package:bodas/routes/exports.dart';

void main() async {
  Env.validate();
  await Supabase.initialize(
    url: Env.supabaseUrl,
    anonKey: Env.supabaseAnonKey,
  );
  runApp(ProviderScope(child: MyApp()));
}
