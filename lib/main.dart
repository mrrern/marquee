import 'package:bodas/routes/linkspaper.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://vokwhcnpfzotvuvggjdt.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZva3doY25wZnpvdHZ1dmdnamR0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY2MDQyOTYsImV4cCI6MjA2MjE4MDI5Nn0.R67lil5UXfo6NqDbRrfQwa9KMyMZnLCQrgzMdUORNpc',
  );
  runApp(ProviderScope(child: MyApp()));
}
