import 'package:bodas/routes/linkspaper.dart';

class WeddingRegistrationScreen extends StatelessWidget {
  const WeddingRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              background,
              fit: BoxFit.cover,
            ),
          ),

          //body
          Column(
            children: [
              const FormHeader(),
              Expanded(
                child: Responsive(
                  // Tablet View
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SidebarMenu(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 40),
                              const Expanded(
                                child: WeddingFormFields(),
                              ),
                              const SizedBox(width: 40),
                              Image.asset(
                                port1,
                                fit: BoxFit.fitHeight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Mobile View
                  mobile: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          children: [
                            const WeddingFormFields(),
                          ],
                        ),
                      ),
                      SidebarMenu(),
                    ],
                  ),
                  // Web View
                  web: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SidebarMenu(),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(width: 40),
                              const Flexible(
                                flex: 3,
                                child: SingleChildScrollView(
                                    child: WeddingFormFields()),
                              ),
                              const SizedBox(width: 40),
                              Image.asset(
                                port1,
                                fit: BoxFit.fitHeight,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
