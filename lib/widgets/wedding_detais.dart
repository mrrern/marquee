import 'package:bodas/routes/linkspaper.dart';

class WeddingFormFields extends StatelessWidget {
  const WeddingFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 640;

    return Container(
      constraints: const BoxConstraints(maxWidth: 655),
      margin: isMobile ? const EdgeInsets.only(left: 34) : EdgeInsets.zero,
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

          // Names field group
          _buildFieldGroup(
            context: context,
            label: 'Nombres y apellidos del los novios',
            child: _buildDualInputRow(
              context: context,
              firstValue: 'Carlos Rodriguez',
              secondValue: 'Erika Rivas',
              
            ),
          ),

          // Phone field group
          _buildFieldGroup(
            context: context,
            label: 'Teléfonos',
            child: _buildPhoneInputRow(context),
          ),

          // Birth date field group
          _buildFieldGroup(
            context: context,
            label: 'Fecha de Nacimiento',
            child: isMobile
                ? const SizedBox() // Hidden on mobile
                : _buildDualInputRow(context: context),
          ),

          // Email field group
          _buildFieldGroup(
            context: context,
            label: 'Correo Electrónico',
            child: _buildDualInputRow(context: context),
          ),

          // Ceremony type and guests
          _buildFieldGroup(
            context: context,
            label: '',
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: _buildDropdownField(
                    context: context,
                    label: 'Tipo de ceremonia',
                  ),
                ),
                if (!isMobile) const SizedBox(width: 40),
                Expanded(
                  child: _buildInputField(
                    context: context,
                    value: 'Numero de invitados',
                  ),
                ),
              ],
            ),
          ),

          // Ceremony location
          _buildFieldGroup(
            context: context,
            label: 'Lugar de la ceremonia',
            child: _buildInputField(context: context),
          ),

          // Submit button
          Center(
            child: Container(
              width: 208,
              margin: const EdgeInsets.symmetric(vertical: 30),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(4),
              ),
              alignment: Alignment.center,
              child: Text(
                'SOLICITAR COTIZACION',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
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
    String firstValue = '',
    String secondValue = '',
  }) {
    final isMobile = MediaQuery.of(context).size.width < 640;

    return isMobile
        ? Column(
            children: [
              _buildInputField(context: context, value: firstValue),
              const SizedBox(height: 15),
              _buildInputField(context: context, value: secondValue),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildInputField(context: context, value: firstValue),
              ),
              const SizedBox(width: 40),
              Expanded(
                child: _buildInputField(context: context, value: secondValue,),
              ),
            ],
          );
  }

  Widget _buildPhoneInputRow(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 640;

    return isMobile
        ? Column(
            children: [
              _buildPhoneField(context),
              const SizedBox(height: 15),
              _buildPhoneField(context),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildPhoneField(context)),
              const SizedBox(width: 40),
              Expanded(child: _buildPhoneField(context)),
            ],
          );
  }

  Widget _buildInputField({
    required BuildContext context,
    String value = '',
  }) {
    final isMobile = MediaQuery.of(context).size.width < 640;

    return Container(
      height: isMobile ? 41 : 38,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(4),
      ),
      alignment: Alignment.centerLeft,
      child: value.isNotEmpty
          ? Text(
              value,
              style: GoogleFonts.inter(),
            )
          : null,
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Image.asset(
            spain, // Replace with actual flag path
            width: 20,
            height: 15,
          ),
          const SizedBox(width: 10),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }

  Widget _buildDropdownField({
    required BuildContext context,
    required String label,
  }) {
    return Container(
      height: 38,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(),
          ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}
