import 'package:bodas/routes/linkspaper.dart';

class WeddingFormFields extends ConsumerWidget {
  const WeddingFormFields({super.key});

  Future<void> _guardarBoda(BuildContext context, WidgetRef ref) async {
    final userInfo = ref.read(authInfoProvider).value;
    if (userInfo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario no autenticado')),
      );
      return;
    }

    final formState = ref.read(weddingFormProvider);
    final boda = Boda(
      id: '',
      usuarioId: userInfo.id,
      fecha: DateTime.now(),
      ubicacion: formState.ubicacion,
      invitados: double.tryParse(formState.invitados) ?? 0,
      estadoId: '1',
      bodaTipo: formState.selectedBodaTipo,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isDeleted: false,
      novioNombre: formState.novioNombre,
      noviaNombre: formState.noviaNombre,
      phoneNovio: formState.phoneNovio,
      phoneNovia: formState.phoneNovia,
      novioBirthday: formState.novioBirthday ?? DateTime.now(),
      noviaBirthday: formState.noviaBirthday ?? DateTime.now(),
      novioEmail: formState.novioEmail,
      noviaEmail: formState.noviaEmail,
    );

    try {
      await ref.read(weddingsProvider(userInfo.id).notifier).addWedding(boda);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Boda creada correctamente')),
      );
      ref.read(weddingFormProvider.notifier).reset();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> _pickDate(
      BuildContext context, WidgetRef ref, bool isNovio) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      if (isNovio) {
        ref.read(weddingFormProvider.notifier).updateNovioBirthday(picked);
      } else {
        ref.read(weddingFormProvider.notifier).updateNoviaBirthday(picked);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMobile = MediaQuery.of(context).size.width < 640;
    final bodaTiposAsync = ref.watch(bodaTiposProvider);
    final formState = ref.watch(weddingFormProvider);
    final formNotifier = ref.read(weddingFormProvider.notifier);

    return Container(
      constraints: const BoxConstraints(maxWidth: 655),
      margin: isMobile ? const EdgeInsets.only(left: 34) : EdgeInsets.zero,
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Aquí empieza todo:',
                  style: GoogleFonts.inter(
                    fontSize: isMobile ? 30 : 40,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF888888),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _buildFieldGroup(
              context: context,
              label: 'Nombres y apellidos de los novios',
              child: _buildDualInputRow(
                context: context,
                firstHint: 'Carlos Rodriguez',
                secondHint: 'Erika Rivas',
                firstValue: formState.novioNombre,
                secondValue: formState.noviaNombre,
                onFirstChanged: formNotifier.updateNovioNombre,
                onSecondChanged: formNotifier.updateNoviaNombre,
              ),
            ),
            _buildFieldGroup(
              context: context,
              label: 'Teléfonos',
              child: _buildDualInputRow(
                context: context,
                firstHint: 'Teléfono 1',
                secondHint: 'Teléfono 2',
                firstValue: formState.phoneNovio,
                secondValue: formState.phoneNovia,
                onFirstChanged: formNotifier.updatePhoneNovio,
                onSecondChanged: formNotifier.updatePhoneNovia,
              ),
            ),
            _buildFieldGroup(
              context: context,
              label: 'Fecha de Nacimiento',
              child: isMobile
                  ? const SizedBox()
                  : Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _pickDate(context, ref, true),
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                color: const Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                formState.novioBirthday == null
                                    ? 'Fecha del Novio'
                                    : formState.novioBirthday!
                                        .toLocal()
                                        .toString()
                                        .split(' ')[0],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: GestureDetector(
                            onTap: () => _pickDate(context, ref, false),
                            child: Container(
                              padding: const EdgeInsets.all(13),
                              decoration: BoxDecoration(
                                color: Color(0xFFD9D9D9),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                formState.noviaBirthday == null
                                    ? 'Fecha de la novia'
                                    : formState.noviaBirthday!
                                        .toLocal()
                                        .toString()
                                        .split(' ')[0],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
            _buildFieldGroup(
              context: context,
              label: 'Correo Electrónico',
              child: _buildDualInputRow(
                context: context,
                firstHint: 'Correo 1',
                secondHint: 'Correo 2',
                firstValue: formState.novioEmail,
                secondValue: formState.noviaEmail,
                onFirstChanged: formNotifier.updateNovioEmail,
                onSecondChanged: formNotifier.updateNoviaEmail,
              ),
            ),
            _buildFieldGroup(
              context: context,
              label: 'Tipo de Ceremonia',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: bodaTiposAsync.when(
                      data: (tipos) {
                        print('Tipos de música: $tipos');
                        print(
                            'Tipo seleccionado: ${formState.selectedBodaTipo}');
                        return Padding(
                          padding: const EdgeInsets.all(13),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<int>(
                              isExpanded: true,
                              hint: Text(
                                'Tipo de boda',
                                style: GoogleFonts.inter(color: Colors.black),
                              ),
                              items: tipos.map((tipo) {
                                return DropdownMenuItem<int>(
                                  value: tipo.id,
                                  child: Text(tipo.descripcion),
                                );
                              }).toList(),
                              value: formState.selectedBodaTipo,
                              onChanged: (value) {
                                if (value != null) {
                                  formNotifier.updateSelectedBodaTipo(value);
                                }
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 38,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFD9D9D9),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 20,
                              ),
                              dropdownStyleData: const DropdownStyleData(
                                maxHeight: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stack) => Text('Error: $error'),
                    ),
                  ),
                ],
              ),
            ),
            _buildFieldGroup(
                context: context,
                label: 'Ubicación - Numero de Invitados',
                child: _buildDualInputRow(
                    context: context,
                    firstHint: 'Ubicacion',
                    secondHint: "Numero de Invitados",
                    firstValue: formState.ubicacion,
                    secondValue: formState.invitados,
                    onFirstChanged: formNotifier.updateUbicacion,
                    onSecondChanged: formNotifier.updateInvitados)),
            const SizedBox(height: 20),
            Center(
              child: HoverButton(
                press: () => _guardarBoda(context, ref),
                "GUARDAR",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFieldGroup({
    required BuildContext context,
    required String label,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1,
            ),
          ),
          const SizedBox(height: 10),
        ],
        child,
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildDualInputRow({
    required BuildContext context,
    required String firstHint,
    required String secondHint,
    required String firstValue,
    required String secondValue,
    required ValueChanged<String> onFirstChanged,
    required ValueChanged<String> onSecondChanged,
  }) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: firstHint,
              hintStyle: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFACACAC),
              ),
              filled: true,
              fillColor: const Color(0xFFD9D9D9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
            ),
            onChanged: onFirstChanged,
            initialValue: firstValue,
          ),
        ),
        const SizedBox(width: 40),
        Expanded(
          child: TextFormField(
            decoration: InputDecoration(
              hintText: secondHint,
              hintStyle: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xFFACACAC),
              ),
              filled: true,
              fillColor: const Color(0xFFD9D9D9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 10,
              ),
            ),
            onChanged: onSecondChanged,
            initialValue: secondValue,
          ),
        ),
      ],
    );
  }
}
