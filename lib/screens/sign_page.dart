import 'package:bodas/routes/linkspaper.dart';

class SignPage extends ConsumerStatefulWidget {
  const SignPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignPageState();
}

class _SignPageState extends ConsumerState<SignPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isMobile = screenWidth < 640;
    final isTablet = screenWidth < 991;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: AppColors.white,
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/9e0afe19d6718ebe588e1641706704fd8b45e01a257e91b63a8c56fb5e350a83?placeholderIfAbsent=true&apiKey=b81a115941b74925855f1403cb35cc79',
                  fit: BoxFit.cover,
                ),
              ),

              // Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Logo
                        Image.asset(
                          logo,
                          width: 309,
                          fit: BoxFit.contain,
                        ),

                        // Navigation
                        if (!isMobile)
                          Row(
                            children: [
                              Text(
                                'acceso',
                                style: AppTextStyles.navLinkStyle.copyWith(
                                  color: AppColors.mediumGrey,
                                ),
                              ),
                              SizedBox(width: isTablet ? 40 : 49),
                              Text(
                                'Registro',
                                style: AppTextStyles.navLinkStyle.copyWith(
                                  color: AppColors.darkGrey,
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),

                  // Form Section
                  Container(
                    margin: EdgeInsets.only(
                      top: isTablet ? 40 : 224,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: isTablet ? 20 : 80,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Background image for form section
                        Positioned.fill(
                          child: SizedBox(
                            width: screenWidth,
                            height: Responsive.isWeb(context)
                                ? screenHeight * .3
                                : screenHeight * .5,
                            child: CarouselSlider(
                                items: [
                                  frame1,
                                  frame2,
                                  frame1,
                                  frame2,
                                  frame2,
                                  frame1
                                ].map((i) {
                                  return Container(
                                    width: screenWidth,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(i),
                                            fit: BoxFit.contain)),
                                  );
                                }).toList(),
                                options: CarouselOptions(
                                    aspectRatio: 2.0,
                                    autoPlay: true,
                                    enlargeFactor: 0,
                                    pauseAutoPlayInFiniteScroll: false,
                                    autoPlayAnimationDuration:
                                        Duration(seconds: 10),
                                    pauseAutoPlayOnManualNavigate: false,
                                    scrollDirection: Axis.horizontal,
                                    pageSnapping: false,
                                    disableCenter: true,
                                    viewportFraction: 0.8,
                                    enlargeCenterPage: true,
                                    autoPlayCurve: Curves.linear,
                                    autoPlayInterval: Duration(seconds: 10),
                                    enableInfiniteScroll: true)),
                          ),
                        ),

                        // Registration Form
                        Container(
                          width: AppDimensions.formWidth,
                          margin: EdgeInsets.symmetric(vertical: 30),
                          padding: EdgeInsets.fromLTRB(
                            isTablet ? 20 : AppDimensions.formPaddingHorizontal,
                            AppDimensions.formPaddingVertical,
                            isTablet ? 20 : AppDimensions.formPaddingHorizontal,
                            58,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.lightGrey,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.black,
                              width: 1,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.25),
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Logo in form
                                Center(
                                  child: Image.network(
                                    'https://cdn.builder.io/api/v1/image/assets/TEMP/13de04d5f7ac706972d40f6ee23a19a1eb87d22dfc2885bfdf39ca7b7fb7e489?placeholderIfAbsent=true&apiKey=b81a115941b74925855f1403cb35cc79',
                                    width: AppDimensions.logoWidth,
                                    fit: BoxFit.contain,
                                  ),
                                ),

                                // Email field
                                SizedBox(height: isTablet ? 40 : 54),
                                Text(
                                  'E-mail',
                                  style: AppTextStyles.formLabelStyle,
                                ),
                                SizedBox(height: isTablet ? 40 : 48),
                                Container(
                                  height: 1,
                                  color: AppColors.black,
                                ),

                                // Password field
                                SizedBox(height: isTablet ? 40 : 48),
                                Text(
                                  'Contraseña',
                                  style: AppTextStyles.formLabelStyle.copyWith(
                                    color: AppColors.textDarkGrey,
                                  ),
                                ),
                                SizedBox(height: isTablet ? 40 : 52),
                                Container(
                                  height: 1,
                                  color: AppColors.black,
                                ),
                                
                                // Password hint
                              
                                Center(
                                
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: isTablet ? 3 : 0,
                                      vertical: 5,
                                    ),
                                    child: Text(
                                      'Create a strong password with letters (a-z), numbers (0-9) and symbols(:*/=)',
                                      style: AppTextStyles.passwordHintStyle,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),

                                // Confirm password field
                                SizedBox(height: 6),
                                Text(
                                  'Confirme su contraseña',
                                  style: AppTextStyles.formLabelStyle.copyWith(
                                    color: AppColors.textDarkGrey,
                                  ),
                                ),
                                SizedBox(height: isTablet ? 40 : 56),
                                Container(
                                  height: 1,
                                  color: AppColors.black,
                                ),

                                // Register button
                                SizedBox(height: isTablet ? 36 : 36),
                                Center(
                                  child: InkWell(
                                    onTap: () {
                                      if (_formKey.currentState!.validate()) {
                                        // Handle registration
                                      }
                                    },
                                    child: Container(
                                      width: AppDimensions.buttonWidth,
                                      padding: EdgeInsets.fromLTRB(
                                        isTablet ? 20 : 46,
                                        3,
                                        isTablet ? 20 : 46,
                                        17,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.buttonBackground,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        'Registrate',
                                        style: AppTextStyles.buttonTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Partner Logos
                  if (!isMobile)
                    SizedBox(
                      width: screenWidth,
                      height: screenHeight * .2,
                      child: SizedBox(
                        width: screenWidth,
                        height: screenHeight * .2,
                        child: CarouselSlider(
                            items: [
                              spons,
                              spons,
                              spons,
                              spons,
                              spons,
                            ].map((i) {
                              return Container(
                                width: 1440,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    image: DecorationImage(
                                        image: AssetImage(i),
                                        fit: BoxFit.fitHeight)),
                              );
                            }).toList(),
                            options: CarouselOptions(
                                height: screenHeight * .08,
                                aspectRatio: 2.0,
                                autoPlay: true,
                                enlargeFactor: 0,
                                pauseAutoPlayInFiniteScroll: false,
                                autoPlayAnimationDuration:
                                    Duration(seconds: 10),
                                pauseAutoPlayOnManualNavigate: false,
                                scrollDirection: Axis.horizontal,
                                pageSnapping: false,
                                disableCenter: false,
                                viewportFraction: 0.8,
                                enlargeCenterPage: true,
                                autoPlayCurve: Curves.linear,
                                autoPlayInterval: Duration(seconds: 10),
                                enableInfiniteScroll: true)),
                      ),
                    ),

                  // Footer
                  Padding(
                    padding: EdgeInsets.only(top: 14, left: 33),
                    child: RichText(
                      text: TextSpan(
                        style: AppTextStyles.footerTextStyle,
                        children: [
                          TextSpan(
                            text: 'Política de privacidad',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(text: ' '),
                          TextSpan(
                            text: 'Política de cookies',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
