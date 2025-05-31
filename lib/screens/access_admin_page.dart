

import 'package:bodas/routes/linkspaper.dart';

class AccessAdminPage extends StatelessWidget {
  const AccessAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const LoginAdminForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
