import 'package:bodas/routes/linkspaper.dart';

class MusicFormContent extends ConsumerWidget {
  const MusicFormContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formState = ref.watch(weddingMusicFormProvider);
    final formNotifier = ref.read(weddingMusicFormProvider.notifier);
    final isMobile = MediaQuery.of(context).size.width < 640;

    return Container(
      constraints: const BoxConstraints(maxWidth: 655),
      margin: isMobile ? const EdgeInsets.only(left: 34) : EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildEntranceSection(formNotifier),
          _buildCeremonySection(formNotifier, formState, context),
          _buildCocktailSection(formNotifier),
          _buildMealTimeSection(formNotifier),
          _buildOpenBarSection(formNotifier, context),
        ],
      ),
    );
  }

  Widget _buildEntranceSection(WeddingMusicFormNotifier formNotifier) {
    return _buildFormSection(
      title: 'Entrada y Recepción',
      children: [
        _buildSectionText('Música durante la recepción de invitados...'),
        const SizedBox(height: 15),
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
        _buildSectionText('Música de fondo para la lectura de invitados...'),
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

  Widget _buildCocktailSection(WeddingMusicFormNotifier formNotifier) {
    return _buildFormSection(
      title: 'Coctel de Bienvenida',
      children: [
        const SizedBox(height: 10),
        _buildSectionText('Música para el cóctel...'),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD9D9D9),
            borderRadius: BorderRadius.circular(4),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
          child: Row(
            children: [
              Text(
                'Seleccione a continuación',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFFACACAC),
                ),
              ),
              const Icon(Icons.arrow_drop_down, color: Color(0xFFACACAC)),
            ],
          ),
        ),
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
        const FormInputField(),
        const SizedBox(height: 24),
        _buildSectionText('Música durante la cena...'),
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
        _buildSectionText('Alguna sorpresa...'),
        const SizedBox(height: 10),
        FormInputField(cambio: (_) => formNotifier.updateRingExchangeMusic),
      ],
    );
  }

  Widget _buildOpenBarSection(
      WeddingMusicFormNotifier formNotifier, BuildContext context) {
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
        _buildLinkInputRow(),
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
          child: Container(
            width: 208,
            height: 41,
            decoration: BoxDecoration(
              color: const Color(0xFFD9D9D9),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                'GUARDAR',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
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
    bool isMobile = Responsive.isMobile(context);
    return ListView.builder(
      shrinkWrap: true,
      itemCount: formState.readers?.length ?? 0,
      padding: EdgeInsets.only(bottom: isMobile ? 25 : 20),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 60,
                child: Text(
                  label,
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
                child: Column(
                  children: [
                    Container(
                      height: 35,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 7),
                      decoration: BoxDecoration(
                        color: const Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: FormInputField(
                        hintText: "Nombre y Apellido",
                        cambio: (value) =>
                            formNotifier.updateReadingName(index, value),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
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

  Widget _buildLinkInputRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLinkInput(),
        const SizedBox(width: 25),
        _buildLinkInput(),
      ],
    );
  }

  Widget _buildLinkInput() {
    return Expanded(
      child: Container(
        height: 41,
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 25,
              height: 25,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
              child: Icon(Icons.add),
            ),
            const SizedBox(width: 9),
          ],
        ),
      ),
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
