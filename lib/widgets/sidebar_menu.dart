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
    bool isTablet = Responsive.isTablet(context);
    bool isWeb = Responsive.isWeb(context);

    double sidebarWidth = isMobile
        ? 60
        : isExpanded
            ? 250
            : 80;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: sidebarWidth,
      decoration: BoxDecoration(
        color: const Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expansion/retraction button
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
          if (isExpanded)
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
            isActive: false,
            index: 0,
          ),

          const SizedBox(height: 20),
          _buildMenuItem(
            route: '/cotiza',
            icon: Icons.request_quote,
            label: 'Cotización',
            isActive: true,
            index: 1,
          ),

          const SizedBox(height: 20),
          _buildMenuItem(
            route: '/music',
            icon: Icons.music_note,
            label: 'Ficha musical',
            isActive: true,
            index: 2,
          ),

          // Submenu items - only show when expanded
          if (isExpanded) ...[
            // Submenu items
            Padding(
              padding: const EdgeInsets.only(left: 40, top: 11),
              child: Text(
                'Entrada',
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF030000),
                  height: 0.8,
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 13, right: 15),
                child: Text(
                  'Ceremonia',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 0.8,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  'Cóctel',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 0.8,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  'Comida',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 0.8,
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 14, right: 15),
                child: Text(
                  'Barra libre',
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    height: 0.8,
                  ),
                ),
              ),
            ),
          ],

          const SizedBox(height: 20),
          _buildMenuItem(
            route: "/notes",
            icon: Icons.note_alt_outlined,
            label: 'Notas',
            isActive: true,
            index: 3,
          ),

          const SizedBox(height: 20),
          _buildMenuItem(
            route: '/notification',
            icon: Icons.notifications_outlined,
            label: 'Notificación',
            isActive: true,
            index: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required bool isActive,
    required int index,
    required String route,
  }) {
    String currentRoute = GoRouter.of(context).state.path.toString();
    bool isActive = currentRoute == route; // Verifica si es la ruta actual
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
            if (isExpanded) ...[
              const SizedBox(width: 15),
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
          ],
        ),
      ),
    );
  }
}
