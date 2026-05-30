import 'package:bodas/routes/exports.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Márquee Audiovisuales',
      theme: Themes.buildCustomTheme(),
      routerConfig: router,
    );
  }
}
