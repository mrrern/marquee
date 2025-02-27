import 'package:bodas/routes/linkspaper.dart';

class WeddingDetailsForm extends ConsumerStatefulWidget {
  const WeddingDetailsForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WeddingDetailsFormState();
}

class _WeddingDetailsFormState extends ConsumerState<WeddingDetailsForm> {
  String _selectedCeremonyType = 'Ceremonia Civil';

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 991;

    return Container(
      margin: EdgeInsets.only(top: isMobile ? 0 : 272),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Two column layout for form fields
          isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildLeftColumn(),
                    const SizedBox(height: 39),
                    _buildRightColumn(),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildLeftColumn()),
                    const SizedBox(width: 20),
                    Expanded(child: _buildRightColumn()),
                  ],
                ),

          // Ceremony location field
          const SizedBox(height: 9),
          Container(
            margin: const EdgeInsets.only(left: 11),
            height: 38,
            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Date of birth field
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(height: 19),
              const Text(
                'Correo Electrónico',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1,
                ),
              ),
              const SizedBox(height: 17),
              Container(
                height: 38,
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),
        const Text(
          'Tipo de ceremonia',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1,
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCeremonyTypeOption(
                      title: 'Ceremonia Civil',
                      isSelected: _selectedCeremonyType == 'Ceremonia Civil',
                      onTap: () => setState(() {
                        _selectedCeremonyType = 'Ceremonia Civil';
                      }),
                    ),
                    const SizedBox(height: 8),
                    _buildCeremonyTypeOption(
                      title: 'Ceremonia Civil, Cóctel de Entrada, Ambos',
                      isSelected: _selectedCeremonyType ==
                          'Ceremonia Civil, Cóctel de Entrada, Ambos',
                      onTap: () => setState(() {
                        _selectedCeremonyType =
                            'Ceremonia Civil, Cóctel de Entrada, Ambos';
                      }),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Lugar de la ceremonia',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCeremonyTypeOption({
    required String title,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
              color: isSelected ? Colors.black : Colors.transparent,
            ),
            child: isSelected
                ? const Center(
                    child: Icon(
                      Icons.circle,
                      size: 10,
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 10),
          Flexible(
            child: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRightColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Birth date field
        Container(
          width: 297,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        const SizedBox(height: 50),
        Container(
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        const SizedBox(height: 16),
        const Text(
          'Numero de invitados',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1,
          ),
        ),

        const SizedBox(height: 14),
        Container(
          width: 296,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
