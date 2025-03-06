import 'package:bodas/routes/linkspaper.dart';

class SidebarMenu extends StatefulWidget {
  final Function(int)? onMenuItemTap;

  const SidebarMenu({
    super.key,
    this.onMenuItemTap,
  });

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.isMobile(context);

    double sidebarWidth = isMobile
        ? 60
        : isExpanded
            ? 200
            : 70;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: sidebarWidth,
      height: 400,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expansion/retraction button
          if (!isMobile)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(
                  isExpanded ? Icons.chevron_left : Icons.chevron_right,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
              ),
            ),

          // Welcome text
          if (isExpanded && !isMobile)
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
              child: Text(
                'Bienvenido',
                style: GoogleFonts.inter(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF4E4C4C),
                  height: 0.4,
                ),
              ),
            ),

          // Menu items
          _buildMenuItem(
            route: '/form1',
            icon: Icons.app_registration,
            label: 'Registro',
            index: 0,
          ),

          const SizedBox(height: 20),
          _buildMenuItem(
            route: '/contract',
            icon: Icons.request_quote,
            label: 'Cotización',
            index: 1,
          ),

          const SizedBox(height: 20),
          _buildMenuItem(
            route: '/music',
            icon: Icons.music_note,
            label: 'Ficha musical',
            index: 2,
          ),

          const SizedBox(height: 20),
          _buildMenuItem(
            route: "/notes",
            icon: Icons.note_alt_outlined,
            label: 'Notas',
            index: 3,
          ),

          const SizedBox(height: 20),
          _buildMenuItem(
            route: '/notification',
            icon: Icons.notifications_outlined,
            label: 'Notificación',
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required int index,
    required String route,
  }) {
    String currentRoute = GoRouter.of(context).state.path.toString();
    bool isActive = currentRoute == route; // Verifica si es la ruta actual
    bool isTablet = Responsive.isTablet(context);
    bool isWeb = Responsive.isWeb(context);
    return InkWell(
      onTap: () {
        if (widget.onMenuItemTap != null) {
          widget.onMenuItemTap!(index);
        }
        context.go(route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              size: 25,
              color: isActive ? Colors.black : const Color(0xFFC1C1C1),
            ),
            if (isExpanded) const SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: isActive ? Colors.black : const Color(0xFFA3A3A3),
                  height: 0.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
