import 'package:bodas/routes/linkspaper.dart';

class QuotationCard extends StatelessWidget {
  final CotizacionRequest quotation;
  final VoidCallback? onTap;

  const QuotationCard({
    super.key,
    required this.quotation,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 362,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header row
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: const BoxDecoration(
              color: Color(0xFFD9D9D9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 130,
                  child: Text(
                    'Nombre',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
                Expanded(
                  flex: 129,
                  child: Text(
                    'Estado',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
                Expanded(
                  flex: 103,
                  child: Text(
                    'Prioridad',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // User row
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                // User info
                Row(
                  children: [
                    _buildAvatar(quotation),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quotation.nombre,
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF101828),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const Spacer(),

                // Status
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: quotation.isSumitedBoda
                            ? const Color(0xFF12B76A)
                            : Colors.grey,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Activo',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF027A48),
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Date
                Text(
                  quotation.fechaUltimaBoda.toString(),
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),

          // Divider with labels
          Container(
            height: 22,
            color: const Color(0xFFD4D4D4),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              children: [
                SizedBox(
                  width: 60,
                  child: Text(
                    'Ceremonia',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
                const SizedBox(width: 17),
                Text(
                  'Lugar',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
                const Spacer(),
                Text(
                  'Chat',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),

          // Info row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                SizedBox(
                  width: 73,
                  child: Text(
                    quotation.tipoCeremonia,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    quotation.lugarCeremonia,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      color: const Color(0xFF667085),
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(
                  Icons.message,
                  size: 15,
                  color: Color(0xFF707070),
                ),
              ],
            ),
          ),

          // Second divider
          Container(
            height: 20,
            color: const Color(0xFFD4D4D4),
            padding: const EdgeInsets.symmetric(horizontal: 7),
            child: Row(
              children: [
                SizedBox(
                  width: 134.6,
                  child: Text(
                    'Invitados',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130.4,
                  child: Text(
                    'Ficha musical',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF667085),
                    ),
                  ),
                ),
                Text(
                  'Llamar',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ],
            ),
          ),

          // Footer row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              children: [
                Text(
                  quotation.invitados.toString(),
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    color: const Color(0xFF667085),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFECFDF3),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Completa',
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF027A48),
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.phone,
                  size: 15,
                  color: Color(0xFF707070),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(CotizacionRequest quotation) {
    // Placeholder with initials
    final initials = quotation.nombre
        .split(' ')
        .take(2)
        .map((name) => name.isNotEmpty ? name[0] : '')
        .join();

    return CircleAvatar(
      radius: 17, // 20 * 0.85
      backgroundColor: const Color(0xFFF9F5FF),
      child: Text(
        initials,
        style: GoogleFonts.inter(
          fontSize: 13, // 16 * 0.85
          color: const Color(0xFF7F56D9),
        ),
      ),
    );
  }
}
