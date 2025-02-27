import 'package:bodas/routes/linkspaper.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.mediumGrey,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.fromLTRB(18, 32, 43, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Welcome title
          const Text(
            'Bienvenido',
            style: TextStyle(
              color: AppColors.darkGrey,
              fontSize: 25,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0.4,
            ),
          ),

          const SizedBox(height: 49),

          // Registration menu item (active)
          _buildMenuItem(
            icon: '',
            label: 'Registro',
            isActive: true,
          ),

          const SizedBox(height: 78),

          // Quote menu item
          _buildMenuItem(
            icon: '',
            label: 'Cotización',
            isActive: false,
          ),

          const SizedBox(height: 78),

          // Musical sheet menu item
          _buildMenuItem(
            icon: '',
            label: 'Ficha musical',
            isActive: false,
          ),

          const SizedBox(height: 78),

          // Notes menu item
          _buildMenuItem(
            icon: '',
            label: 'Notas',
            isActive: false,
          ),

          const SizedBox(height: 73),

          // Notification menu item
          _buildMenuItem(
            icon: '',
            label: 'Notificación',
            isActive: false,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required String icon,
    required String label,
    required bool isActive,
  }) {
    return Row(
      children: [
        Text(
          icon,
          style: TextStyle(
            fontFamily: 'Font Awesome 5 Free',
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: isActive ? Colors.black : AppColors.mediumGrey,
          ),
        ),
        const SizedBox(width: 16),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 15,
            fontWeight: FontWeight.w400,
            height: 0.8,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}