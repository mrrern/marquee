import 'package:bodas/routes/linkspaper.dart';

// class MusicFormScreen extends ConsumerStatefulWidget {
//   const MusicFormScreen({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() =>
//       _MusicFormScreenState();
// }

// class _MusicFormScreenState extends ConsumerState<MusicFormScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Responsive(
//         // Tablet view
//         SingleChildScrollView(
//           child: _buildContent(isTablet: true),
//         ),
//         // Mobile view
//         mobile: SingleChildScrollView(
//           child: _buildContent(isMobile: true),
//         ),
//         // Web view
//         web: SingleChildScrollView(
//           child: _buildContent(),
//         ),
//       ),
//     );
//   }

//   Widget _buildContent({bool isMobile = false, bool isTablet = false}) {
//     return Container(
//       color: Colors.white,
//       padding: const EdgeInsets.only(bottom: 40),
//       child: Stack(
//         children: [
//           // Background image
//           Positioned.fill(
//             child: Image.asset(
//               background,
//               fit: BoxFit.cover,
//             ),
//           ),

//           // Content
//           Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal: isMobile ? 20.0 : 40.0,
//               vertical: 20,
//               ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Header with logo and exit button
//                 _buildHeader(),

//                 // Main content with sidebar and form
//                 Padding(
//                   padding: const EdgeInsets.only(top: 7),
//                   child: SizedBox(
//                     width: 904,
//                     child: isMobile
//                         ? _buildMobileContent()
//                         : _buildDesktopContent(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeader() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Logo
//         Image.asset(
//           logo,
//           width: 216,
//           fit: BoxFit.contain,
//         ),

//         // Exit button
//         Text(
//           'Salir',
//           style: GoogleFonts.inter(
//             fontSize: 20,
//             fontWeight: FontWeight.w600,
//             color: Colors.black,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildDesktopContent() {
//     return Builder(
//       builder: (context) {
//         return Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Sidebar - 27% width
//             SidebarMenu(
//               onMenuItemTap: (index) {
//                 // Handle menu item tap
//               },
//             ),

//             const SizedBox(width: 20),

//             // Form content - 55% width
//             Expanded(
//               flex: 5,
//               child: _buildFormContent(),
//             ),

//             const SizedBox(width: 20),

//             Image.asset(
//               port2,
//               fit: BoxFit.fitHeight,
//             ),

//             // Image Section - 18% width
//           ],
//         );
//       },
//     );
//   }

//   Widget _buildMobileContent() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Mobile sidebar (collapsible or different layout)
//         SidebarMenu(
//           onMenuItemTap: (index) {
//             // Handle menu item tap
//           },
//         ),

//         const SizedBox(height: 20),

//         // Form content
//         _buildFormContent(),
//       ],
//     );
//   }

//   Widget _buildFormContent() {
//     final formState = ref.watch(weddingMusicFormProvider);
//     final formNotifier = ref.read(weddingMusicFormProvider.notifier);
//     return Padding(
//       padding: const EdgeInsets.only(top: 38),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Entrance and Reception Section
//           FormSection(
//             title: 'Entrada y Recepción',
//             children: [
//               Text(
//                 'Música durante la recepción de invitados (música clásica, guitarra instrumental…) de 15 a 20 minutos de duración total.',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateEntranceMusic;
//                 },
//               ),
//               const SizedBox(height: 15),
//               Text(
//                 'Canción de entrada del novio:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateGroomEntranceMusic;
//                 },
//               ),
//               const SizedBox(height: 26),
//               Text(
//                 'Canción de entrada de la novia:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateBrideEntranceMusic;
//                 },
//               ),
//             ],
//           ),

//           // Ceremony Start Section
//           FormSection(
//             title: 'Inicio de la Ceremonia',
//             children: [
//               Text(
//                 'Música de fondo para la lectura de invitados evita, si es posible piezas vocales',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 33),

//               // Readings
//               _buildReadingRow('Lectura'),

//               const SizedBox(height: 35),
//               Text(
//                 'Entrega de alianzas:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const FormInputField(),

//               const SizedBox(height: 21),
//               Text(
//                 'Momento del beso y firma:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 11),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateKissAndSignatureMusic;
//                 },
//               ),

//               const SizedBox(height: 26),
//               Text(
//                 'Momento fin de ceremonia',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 13),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateCeremonyEndMusic;
//                 },
//               ),
//             ],
//           ),

//           // Cocktail Reception Section
//           FormSection(
//             title: 'Coctel de Bienvenida',
//             children: [
//               const SizedBox(height: 10),
//               Text(
//                 'Momento fin de ceremonia',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 13),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateCeremonyEndMusic;
//                 },
//               ),
//               const SizedBox(height: 29),
//               Text(
//                 'Música para el cóctel (chill out, flamenco chill, lounge, chill-jazz fussion, etc.) especificad aquí):',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Container(
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFD9D9D9),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
//                 width: double.infinity,
//                 child: Row(
//                   children: [
//                     Text(
//                       'Seleccione a continuación',
//                       style: GoogleFonts.inter(
//                         fontSize: 15,
//                         fontWeight: FontWeight.w400,
//                         color: const Color(0xFFACACAC),
//                       ),
//                     ),
//                     const SizedBox(width: 5),
//                     const Icon(
//                       Icons.arrow_drop_down,
//                       color: Color(0xFFACACAC),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),

//           // Meal Time Section
//           FormSection(
//             title: 'Momento de la Comida',
//             children: [
//               const SizedBox(height: 10),
//               Text(
//                 'Entrada al salón:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 13),
//               const FormInputField(),
//               const SizedBox(height: 24),
//               Text(
//                 'Música durante la cena: (baladas, bossa nova, jazz, versiones cover grandes éxitos, música años 20/50…)',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 13),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateDinnerMusic;
//                 },
//               ),
//               const SizedBox(height: 35),
//               Text(
//                 'Corte de la tarta:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 14),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateCakeCuttingMusic;
//                 },
//               ),
//               const SizedBox(height: 27),
//               Text(
//                 'Entrega de regalos/ramos:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateGiftsMusic;
//                 },
//               ),
//               const SizedBox(height: 27),
//               Text(
//                 'Alguna sorpresa (Micrófono para discursos, cumpleaños, etc...)',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateRingExchangeMusic;
//                 },
//               ),
//             ],
//           ),

//           // Open Bar Section
//           FormSection(
//             title: 'Barra Libre',
//             children: [
//               const SizedBox(height: 10),
//               Text(
//                 'Baile de los Novios',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 13),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateCouplesDanceMusic;
//                 },
//               ),
//               const SizedBox(height: 27),
//               Text(
//                 'Primera canción Barra Libre (Opcional)',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               FormInputField(
//                 cambio: (_) {
//                   formNotifier.updateFirstOpenBarSong;
//                 },
//               ),
//               const SizedBox(height: 32),
//               Text(
//                 'Música que queréis que suene: Aquí debéis aportar la música que no debe faltar para vosotros y vuestros invitados en este día tan especial. Recomiendo unas 20 o 25 canciones por cada uno como mínimo. (Opción de poner enlace obligatorio)',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 17),
//               Text(
//                 'Lo más rápido si has creado tu lista de Spotify o YouTube es arrastrar el enlace directamente sobre el icono de deseo.',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 22),
//               _buildMusicSelectionRow(),
//               const SizedBox(height: 12),
//               Text(
//                 'Aquí puedes dejar los enlaces de tus canciones favoritas.',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 14),
//               _buildLinkInputRow(),
//               const SizedBox(height: 22),
//               _buildRadioQuestion('¿Hay invitados de nacionalidad distinta?'),
//               const SizedBox(height: 16),
//               _buildRadioQuestion('¿Pondríamos alguna canción de su País?'),
//               const SizedBox(height: 16),
//               Text(
//                 '¿Cuál?',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const FormInputField(),
//               const SizedBox(height: 14),
//               _buildRadioQuestion('¿Se aceptarán peticiones de los invitados?'),
//               const SizedBox(height: 11),
//               Text(
//                 '¿se aceptará canciones o géneros prohibidos? EJ Paquito el chocolatero, Follow the leader…',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               _buildRadioQuestion(''),
//               const SizedBox(height: 18),
//               Text(
//                 '¿Cuál?',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 17),
//               const FormInputField(),
//               const SizedBox(height: 13),
//               Text(
//                 'Última canción barra libre:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 7),
//               const FormInputField(),
//               const SizedBox(height: 14),
//               Text(
//                 'SI CONSIDERAS ALGO DE INTERES QUE SE NOS OLVIDE EN LA LISTA ESTE ES EL LUGAR:',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                   height: 1,
//                 ),
//               ),
//               const SizedBox(height: 14),
//               Container(
//                 height: 148,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFD9D9D9),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//               ),
//               const SizedBox(height: 29),
//               Center(
//                 child: Container(
//                   width: 208,
//                   height: 41,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFD9D9D9),
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Text(
//                     'GUARDAR',
//                     style: GoogleFonts.inter(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black,
//                       height: 1,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildReadingRow(String label) {
//     final formState = ref.watch(weddingMusicFormProvider);
//     final formNotifier = ref.read(weddingMusicFormProvider.notifier);
//     return ListView.builder(
//         shrinkWrap: true,
//         itemCount: formState.readers!.length,
//         itemBuilder: (context, index) {
//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 width: 60,
//                 child: Text(
//                   label,
//                   style: GoogleFonts.inter(
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 20),
//               Expanded(
//                 child: Column(
//                   children: [
//                     Container(
//                       height: 35,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 7),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFFD9D9D9),
//                         borderRadius: BorderRadius.circular(4),
//                       ),
//                       child: Align(
//                         alignment: Alignment.centerLeft,
//                         child: FormInputField(
//                           hintText: "Nombre y Apellido",
//                           cambio: (value) {
//                             formNotifier.updateReadingName(index, value);
//                           },
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 10),
//               Container(
//                 width: 230,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFD9D9D9),
//                   borderRadius: BorderRadius.circular(4),
//                 ),
//                 child: DropdownButtonFormField<String>(
//                     decoration: InputDecoration(
//                         filled: true,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         labelText: "Selecciona a continuacion"),
//                     icon: Icon(
//                       Icons.keyboard_arrow_down,
//                       color: Color(0xFFACACAC),
//                     ),
//                     value: formState.readers![index].selectedOption,
//                     items: [
//                       'Link o enlace',
//                       'Nosotros nos Encargamos',
//                       'No computa'
//                     ].map((type) {
//                       return DropdownMenuItem(value: type, child: Text(type));
//                     }).toList(),
//                     onChanged: (value) {
//                       if (value != null) {
//                         formNotifier.updateSelectedMusicType(value);
//                       }
//                       if (value == null) {
//                         "Seleccione";
//                       }
//                     }),
//               ),
//             ],
//           );
//         });
//   }

//   Widget _buildMusicSelectionRow() {
//     return Row(
//       children: [
//         // Husband column
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Carlos',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 15),
//               Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       spotify,
//                       width: 108,
//                       height: 103,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Text(
//                     'o',
//                     style: GoogleFonts.inter(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: const Color(0xFF818181),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFEEEEEE),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Image.asset(
//                       youtube,
//                       width: 72,
//                       height: 90,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),

//         const SizedBox(width: 20),

//         // Bride column
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Erika',
//                 style: GoogleFonts.inter(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 18),
//               Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       spotify,
//                       width: 108,
//                       height: 103,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                   const SizedBox(width: 14),
//                   Text(
//                     'o',
//                     style: GoogleFonts.inter(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500,
//                       color: const Color(0xFF818181),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFEEEEEE),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Image.asset(
//                       youtube,
//                       width: 72,
//                       height: 90,
//                       fit: BoxFit.contain,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildLinkInputRow() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         _buildLinkInput(),
//         const SizedBox(width: 25),
//         _buildLinkInput(),
//       ],
//     );
//   }

//   Widget _buildLinkInput() {
//     return Expanded(
//       child: Container(
//         height: 41,
//         decoration: BoxDecoration(
//           color: const Color(0xFFD9D9D9),
//           borderRadius: BorderRadius.circular(4),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             const Spacer(),
//             const Text(
//               '+',
//               style: TextStyle(
//                 fontSize: 22,
//                 color: Colors.black,
//               ),
//             ),
//             const SizedBox(width: 5),
//             Container(
//               width: 25,
//               height: 25,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             const SizedBox(width: 9),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRadioQuestion(String question) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (question.isNotEmpty)
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Text(
//               question,
//               style: GoogleFonts.inter(
//                 fontSize: 15,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black,
//                 height: 1,
//               ),
//             ),
//           ),
//         Padding(
//           padding: const EdgeInsets.only(left: 50),
//           child: Row(
//             children: [
//               const RadioOption(
//                 label: 'Si',
//                 isSelected: true,
//               ),
//               const SizedBox(width: 40),
//               const RadioOption(
//                 label: 'No',
//                 isSelected: false,
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }

class MusicFormScreen extends ConsumerStatefulWidget {
  const MusicFormScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MusicFormScreenState();
}

class _MusicFormScreenState extends ConsumerState<MusicFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Responsive(
        SingleChildScrollView(child: _buildContent(isTablet: true)),
        mobile: SingleChildScrollView(child: _buildContent(isMobile: true)),
        web: SingleChildScrollView(child: _buildContent()),
      ),
    );
  }

  Widget _buildContent({bool isMobile = false, bool isTablet = false}) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(bottom: 40),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              background,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20.0 : 40.0,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderWidget(),
                _buildResponsiveContent(isMobile: isMobile, isTablet: isTablet),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResponsiveContent(
      {bool isMobile = false, bool isTablet = false}) {
    if (isMobile) {
      return _buildMobileContent();
    }
    return _buildDesktopContent(isTablet: isTablet);
  }

  Widget _buildDesktopContent({bool isTablet = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SidebarMenu(),
        const SizedBox(width: 20),
        Expanded(
          flex: isTablet ? 3 : 2,
          child: MusicFormContent(),
        ),
        if (!isTablet) ...[
          const SizedBox(width: 20),
          Flexible(flex: 2, child: Image.asset(port2, fit: BoxFit.fitHeight)),
        ]
      ],
    );
  }

  Widget _buildMobileContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SidebarMenu(
          onMenuItemTap: (index) {
            // Handle menu item tap
          },
        ),
        const SizedBox(height: 20),
        MusicFormContent(),
      ],
    );
  }
}
