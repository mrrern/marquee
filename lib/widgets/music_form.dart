import 'package:bodas/routes/linkspaper.dart';

class MusicFormContent extends ConsumerWidget {
  const MusicFormContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(weddingMusicFormProvider);
    final formNotifier = ref.read(weddingMusicFormProvider.notifier);
    final isMobile = MediaQuery.of(context).size.width < 640;
    final formKeyMusic = GlobalKey<FormState>();

    return Container(
      constraints: const BoxConstraints(maxWidth: 655),
      margin: isMobile ? const EdgeInsets.only(left: 34) : EdgeInsets.zero,
      child: Form(
        key: formKeyMusic,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEntranceSection(formNotifier),
            _buildCeremonySection(formNotifier, formState, context),
            _buildCocktailSection(formNotifier, formState, ref),
            _buildMealTimeSection(formNotifier),
            _buildOpenBarSection(formNotifier, context, ref),
          ],
        ),
      ),
    );
  }

  Widget _buildEntranceSection(WeddingMusicFormNotifier formNotifier) {
    return _buildFormSection(
      title: 'Entrada y Recepción',
      children: [
        _buildSectionText(
            'Música durante la recepción de invitados (música clásica, guitarra instrumental…) de 15 a 20 minutos de duración total'),
        const SizedBox(height: 25),
        FormInputField(cambio: (_) => formNotifier.updateEntranceMusic),
        const SizedBox(height: 15),
        _buildSectionText('Canción de entrada del novio:'),
        const SizedBox(height: 12),
        FormInputField(cambio: (_) => formNotifier.updateGroomEntranceMusic),
        const SizedBox(height: 26),
        _buildSectionText('Canción de entrada de la novia:'),
        const SizedBox(height: 12),
        FormInputField(cambio: (_) => formNotifier.updateBrideEntranceMusic),
      ],
    );
  }

  Widget _buildCeremonySection(WeddingMusicFormNotifier formNotifier,
      WeddingMusicFormData formState, context) {
    return _buildFormSection(
      title: 'Inicio de la Ceremonia',
      children: [
        _buildSectionText(
            'Música de fondo para la lectura de invitados evita, si es posible piezas vocales'),
        const SizedBox(height: 33),
        _buildReadingRow('Lectura', formState, formNotifier, context),
        const SizedBox(height: 35),
        _buildSectionText('Entrega de alianzas:'),
        const SizedBox(height: 10),
        const FormInputField(),
        const SizedBox(height: 21),
        _buildSectionText('Momento del beso y firma:'),
        const SizedBox(height: 11),
        FormInputField(cambio: (_) => formNotifier.updateKissAndSignatureMusic),
        const SizedBox(height: 26),
        _buildSectionText('Momento fin de ceremonia'),
        const SizedBox(height: 13),
        FormInputField(cambio: (_) => formNotifier.updateCeremonyEndMusic),
      ],
    );
  }

  Widget _buildCocktailSection(WeddingMusicFormNotifier formNotifier,
      WeddingMusicFormData formState, WidgetRef ref) {
    final musicValueAsync = ref.watch(musicaTipoProvider);

    return _buildFormSection(
      title: 'Coctel de Bienvenida',
      children: [
        const SizedBox(height: 10),
        _buildSectionText(
            'Selecciona la Musica para el coctel (chill-out, flamenco, fusion, latino, etc...)'),
        const SizedBox(height: 12),
        musicValueAsync.when(
            data: (tipos) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<int>(
                    isExpanded: true,
                    hint: Text(
                      'Música Para el Coctel...',
                      style: GoogleFonts.inter(color: Colors.black),
                    ),
                    items: tipos.map((tipo) {
                      return DropdownMenuItem<int>(
                        value: tipo.id,
                        child: Text(tipo.descripcion),
                      );
                    }).toList(),
                    value: formState.selectecMusicType,
                    onChanged: (value) {
                      if (value != null) {
                        formNotifier.updateSelectedMusicType(value);
                      }
                    },
                    buttonStyleData: ButtonStyleData(
                      height: 38,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                    iconStyleData: const IconStyleData(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 20,
                    ),
                    dropdownStyleData: const DropdownStyleData(
                      maxHeight: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                      ),
                    ),
                  ),
                ),
              );
            },
            error: (error, stack) {
              return Text('Error: $error');
            },
            loading: () => const CircularProgressIndicator(
                  color: Color(0xFFD9D9D9),
                ))
      ],
    );
  }

  Widget _buildMealTimeSection(WeddingMusicFormNotifier formNotifier) {
    return _buildFormSection(
      title: 'Momento de la Comida',
      children: [
        const SizedBox(height: 10),
        _buildSectionText('Entrada al salón:'),
        const SizedBox(height: 13),
        FormInputField(
          cambio: (_) => formNotifier.updateEntranceToHallMusic,
        ),
        const SizedBox(height: 24),
        _buildSectionText(
            'Música durante la cena: (baladas, bossa nova, jazz, versiones cover grandes éxitos, música años 20/50…)'),
        const SizedBox(height: 13),
        FormInputField(cambio: (_) => formNotifier.updateDinnerMusic),
        const SizedBox(height: 35),
        _buildSectionText('Corte de la tarta:'),
        const SizedBox(height: 14),
        FormInputField(cambio: (_) => formNotifier.updateCakeCuttingMusic),
        const SizedBox(height: 27),
        _buildSectionText('Entrega de regalos/ramos:'),
        const SizedBox(height: 10),
        FormInputField(cambio: (_) => formNotifier.updateGiftsMusic),
        const SizedBox(height: 27),
        _buildSectionText(
            'Alguna sorpresa (Micrófono para discursos, cumpleaños, etc...)'),
        const SizedBox(height: 10),
        FormInputField(cambio: (_) => formNotifier.updateRingExchangeMusic),
      ],
    );
  }

  Widget _buildOpenBarSection(WeddingMusicFormNotifier formNotifier,
      BuildContext context, WidgetRef ref) {
    final formKeyMusic = GlobalKey<FormState>();

    return _buildFormSection(
      title: 'Barra Libre',
      children: [
        const SizedBox(height: 10),
        _buildSectionText('Baile de los Novios'),
        const SizedBox(height: 13),
        FormInputField(cambio: (_) => formNotifier.updateCouplesDanceMusic),
        const SizedBox(height: 27),
        _buildSectionText('Primera canción Barra Libre (Opcional)'),
        const SizedBox(height: 10),
        FormInputField(cambio: (_) => formNotifier.updateFirstOpenBarSong),
        const SizedBox(height: 32),
        _buildSectionText('Música que queréis que suene...'),
        const SizedBox(height: 17),
        _buildSectionText('Lo más rápido si has creado tu lista...'),
        const SizedBox(height: 22),
        _buildMusicSelectionRow(context),
        const SizedBox(height: 12),
        _buildSectionText('Aquí puedes dejar los enlaces...'),
        const SizedBox(height: 14),
        _buildLinkInputSection(ref),
        const SizedBox(height: 22),
        _buildRadioQuestion('¿Hay invitados de nacionalidad distinta?'),
        const SizedBox(height: 16),
        _buildRadioQuestion('¿Pondríamos alguna canción de su País?'),
        const SizedBox(height: 16),
        _buildSectionText('¿Cuál?'),
        const SizedBox(height: 10),
        const FormInputField(),
        const SizedBox(height: 14),
        _buildRadioQuestion('¿Se aceptarán peticiones de los invitados?'),
        const SizedBox(height: 11),
        _buildSectionText('¿Se aceptará canciones o géneros prohibidos?...'),
        const SizedBox(height: 16),
        _buildRadioQuestion(''),
        const SizedBox(height: 18),
        _buildSectionText('¿Cuál?'),
        const SizedBox(height: 17),
        const FormInputField(),
        const SizedBox(height: 13),
        _buildSectionText('Última canción barra libre:'),
        const SizedBox(height: 7),
        const FormInputField(),
        const SizedBox(height: 14),
        _buildSectionText('SI CONSIDERAS ALGO DE INTERES...'),
        const SizedBox(height: 14),
        Container(
          height: 148,
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 29),
        Center(
          child: HoverButton(press: () {
            if (formKeyMusic.currentState!.validate()) {
              final success =
                  ref.read(weddingMusicFormProvider.notifier).saveForm();
            }
            context.go('/contract');
          }, "GUARDAR"),
        ),
      ],
    );
  }

  Widget _buildLinkInputSection(WidgetRef ref) {
    final groomLinks = ref.watch(groomLinksProvider);
    final brideLinks = ref.watch(brideLinksProvider);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            children: List.generate(
              groomLinks.length,
              (index) => DynamicTextFieldRowWithValue(
                provider: groomLinksProvider,
                index: index,
                height: 35,
              ),
            ),
          ),
        ),
        const SizedBox(width: 25),
        Expanded(
          child: Column(
            children: List.generate(
              brideLinks.length,
              (index) => DynamicTextFieldRowWithValue(
                provider: brideLinksProvider,
                index: index,
                height: 35,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Métodos auxiliares comunes
  Widget _buildFormSection(
      {required String title, required List<Widget> children}) {
    return FormSection(
      title: title,
      children: children,
    );
  }

  Widget _buildSectionText(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        height: 1,
      ),
    );
  }

  Widget _buildReadingRow(String label, WeddingMusicFormData formState,
      WeddingMusicFormNotifier formNotifier, context) {
    return Column(
      children: List.generate(4, (index) {
        final reading = formState.lectures?[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  'Lectura ${index + 1}',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Container(
                  height: 55,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                  child: FormInputField(
                    hintText: "Enlace",
                    controller: TextEditingController(text: reading?.name),
                    cambio: (value) =>
                        formNotifier.updateReadingName(index, value),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildMusicSelectionRow(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Novio',
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w500)),
              const SizedBox(height: 15),
              Row(
                children: [
                  Image.asset(spotify,
                      width: isMobile ? 60 : 108, height: isMobile ? 55 : 103),
                  const SizedBox(width: 16),
                  Text('o',
                      style: GoogleFonts.inter(color: const Color(0xFF818181))),
                  const SizedBox(width: 10),
                  Image.asset(youtube,
                      width: isMobile ? 50 : 72, height: isMobile ? 70 : 90),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Novia',
                  style: GoogleFonts.inter(
                      fontSize: 15, fontWeight: FontWeight.w500)),
              const SizedBox(height: 18),
              Row(
                children: [
                  Image.asset(spotify,
                      width: isMobile ? 60 : 108, height: isMobile ? 55 : 103),
                  const SizedBox(width: 14),
                  Text('o',
                      style: GoogleFonts.inter(color: const Color(0xFF818181))),
                  const SizedBox(width: 10),
                  Image.asset(youtube,
                      width: isMobile ? 50 : 72, height: isMobile ? 70 : 90),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRadioQuestion(String question) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (question.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(question,
                style: GoogleFonts.inter(
                    fontSize: 15, fontWeight: FontWeight.w500)),
          ),
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            children: const [
              RadioOption(label: 'Si', isSelected: true),
              SizedBox(width: 40),
              RadioOption(label: 'No', isSelected: false),
            ],
          ),
        ),
      ],
    );
  }
}
