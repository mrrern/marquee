import 'package:bodas/routes/linkspaper.dart';

class CoupleInfoForm extends StatelessWidget {
  const CoupleInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 991;

    return isMobile
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildGroomSection(),
              const SizedBox(height: 37),
              _buildBrideSection(),
            ],
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildGroomSection()),
              const SizedBox(width: 20),
              Expanded(child: _buildBrideSection()),
            ],
          );
  }

  Widget _buildGroomSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Groom name field
        Container(
          width: 297,
          padding: const EdgeInsets.symmetric(vertical: 11),
          decoration: BoxDecoration(
            color: AppColors.mediumGrey,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.lightGrey),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Carlos Rodriguez',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1,
            ),
          ),
        ),

        // Phone label
        const SizedBox(height: 18),
        const Text(
          'Teléfonos',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            height: 1,
          ),
        ),

        // Phone field
        const SizedBox(height: 14),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 56),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '',
                style: TextStyle(
                  fontFamily: 'Font Awesome 5 Free',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 6),
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/b81a115941b74925855f1403cb35cc79/0fb6872d2483995e15cce5a09df0179b430a089dcc3e0dfaff2981cb0d9819d2?placeholderIfAbsent=true',
                width: 1,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBrideSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Bride name field
        Container(
          width: 297,
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: AppColors.lightGrey),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Erika Rivas',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.black,
              height: 1,
            ),
          ),
        ),

        // Phone field
        const SizedBox(height: 44),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 56),
          decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '',
                style: TextStyle(
                  fontFamily: 'Font Awesome 5 Free',
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(width: 5),
              Image.network(
                'https://cdn.builder.io/api/v1/image/assets/b81a115941b74925855f1403cb35cc79/aeeb6d6f0e9d89c3d14d6a5ef39ad9f8375251c75d6e33d636d9cb34cabde4a0?placeholderIfAbsent=true',
                width: 1,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ],
    );
  }
}