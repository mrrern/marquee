import 'package:bodas/routes/linkspaper.dart';

class WeddingFormFields extends ConsumerStatefulWidget {
  const WeddingFormFields({super.key});

  @override
  ConsumerState<WeddingFormFields> createState() => _WeddingFormFieldsState();
}

class _WeddingFormFieldsState extends ConsumerState<WeddingFormFields> {
  final _formKey = GlobalKey<FormState>();
  late int selectedBodaTipo = 1;

  // Controladores para los campos
  final _novioNombreController = TextEditingController();
  final _noviaNombreController = TextEditingController();
  final _phoneNovioController = TextEditingController();
  final _phoneNoviaController = TextEditingController();
  final _novioEmailController = TextEditingController();
  final _noviaEmailController = TextEditingController();
  final _invitadosController = TextEditingController();
  final _ubicacionController = TextEditingController();

  DateTime? _novioBirthday;
  DateTime? _noviaBirthday;

  @override
  void dispose() {
    _novioNombreController.dispose();
    _noviaNombreController.dispose();
    _phoneNovioController.dispose();
    _phoneNoviaController.dispose();
    _novioEmailController.dispose();
    _noviaEmailController.dispose();
    _invitadosController.dispose();
    _ubicacionController.dispose();
    super.dispose();
  }

  Future<void> _guardarBoda() async {
    final userInfo = ref.read(authInfoProvider).value;
    if (userInfo == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuario no autenticado')),
      );
      return;
    }

    final boda = Boda(
      id: '',
      usuarioId: userInfo.id,
      fecha: DateTime.now(),
      ubicacion: _ubicacionController.text,
      invitados: double.tryParse(_invitadosController.text) ?? 0,
      estadoId: '1',
      bodaTipo: selectedBodaTipo,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isDeleted: false,
      novioNombre: _novioNombreController.text,
      noviaNombre: _noviaNombreController.text,
      phoneNovio: _phoneNovioController.text,
      phoneNovia: _phoneNoviaController.text,
      novioBirthday: _novioBirthday ?? DateTime.now(),
      noviaBirthday: _noviaBirthday ?? DateTime.now(),
      novioEmail: _novioEmailController.text,
      noviaEmail: _noviaEmailController.text,
    );

    try {
      await ref.read(weddingsProvider(userInfo.id).notifier).addWedding(boda);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Boda creada correctamente')),
      );
      _formKey.currentState?.reset();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  Future<void> _pickDate(
      BuildContext context, ValueChanged<DateTime> onPicked) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if (picked != null) onPicked(picked);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 640;
    final bodaTiposAsync = ref.watch(bodaTiposProvider);

    return Container(
      constraints: const BoxConstraints(maxWidth: 655),
      margin: isMobile ? const EdgeInsets.only(left: 34) : EdgeInsets.zero,
      child: Form(
        key: _formKey,
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
                firstController: _novioNombreController,
                secondController: _noviaNombreController,
              ),
            ),
            _buildFieldGroup(
              context: context,
              label: 'Teléfonos',
              child: _buildDualInputRow(
                context: context,
                firstHint: 'Teléfono 1',
                secondHint: 'Teléfono 2',
                firstController: _phoneNovioController,
                secondController: _phoneNoviaController,
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
                          child: TextButton(
                            onPressed: () => _pickDate(context, (date) {
                              setState(() => _novioBirthday = date);
                            }),
                            child: Text(_novioBirthday == null
                                ? 'Fecha 1'
                                : _novioBirthday!
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]),
                          ),
                        ),
                        const SizedBox(width: 40),
                        Expanded(
                          child: TextButton(
                            onPressed: () => _pickDate(context, (date) {
                              setState(() => _noviaBirthday = date);
                            }),
                            child: Text(_noviaBirthday == null
                                ? 'Fecha 2'
                                : _noviaBirthday!
                                    .toLocal()
                                    .toString()
                                    .split(' ')[0]),
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
                firstController: _novioEmailController,
                secondController: _noviaEmailController,
              ),
            ),
            _buildFieldGroup(
              context: context,
              label: '',
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: bodaTiposAsync.when(
                      data: (tipos) => DropdownButtonHideUnderline(
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
                          value: selectedBodaTipo,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedBodaTipo = value;
                              });
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                            ),
                          ),
                        ),
                      ),
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stack) => Text('Error: $error'),
                    ),
                  ),
                  if (!isMobile) const SizedBox(width: 40),
                  Expanded(
                    child: FormInputField(
                      controller: _invitadosController,
                      hintText: 'Número de invitados',
                      height: 38,
                    ),
                  ),
                ],
              ),
            ),
            _buildFieldGroup(
              context: context,
              label: 'Lugar de la ceremonia',
              child: FormInputField(
                controller: _ubicacionController,
                hintText: 'Ingrese ubicación',
                height: 38,
              ),
            ),
            Center(
              child: HoverButton(
                press: () {
                  if (_formKey.currentState!.validate()) {
                    _guardarBoda();
                  }
                },
                "SOLICITAR COTIZACION",
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
          child,
        ],
      ),
    );
  }

  Widget _buildDualInputRow({
    required BuildContext context,
    String firstHint = '',
    String secondHint = '',
    TextEditingController? firstController,
    TextEditingController? secondController,
  }) {
    final isMobile = MediaQuery.of(context).size.width < 640;

    return isMobile
        ? Column(
            children: [
              FormInputField(
                  hintText: firstHint, height: 41, controller: firstController),
              const SizedBox(height: 15),
              FormInputField(
                  hintText: secondHint,
                  height: 41,
                  controller: secondController),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FormInputField(
                    hintText: firstHint,
                    height: 38,
                    controller: firstController),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: FormInputField(
                    hintText: secondHint,
                    height: 38,
                    controller: secondController),
              ),
            ],
          );
  }
}
