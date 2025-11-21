import 'package:bodas/routes/linkspaper.dart';

class QuotationTable extends StatelessWidget {
  final List<CotizacionRequest> quotations;
  final Function(CotizacionLogic)? onSelect;
  final Function(String userId)? onAccept;

  const QuotationTable({
    super.key,
    required this.quotations,
    this.onSelect,
    this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.widthOf(context),
      height: MediaQuery.of(context).size.height * .6,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white.withValues(alpha: 0.7),
        ),
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: TableMarquee<CotizacionRequest>(
            headers: const [
              '',
              'Nombre',
              'Fecha',
              'Invitados',
              'Ceremonia',
              'Lugar',
              'Cotización',
              'Contrato firmado',
              'Contactar',
              'Contratados',
            ],
            data: quotations,
            columnWidths: const {
              0: FixedColumnWidth(48),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(1.5),
              4: FlexColumnWidth(1.5),
              5: FlexColumnWidth(2),
              6: FlexColumnWidth(1.5),
              7: FlexColumnWidth(1.5),
              8: FlexColumnWidth(1.5),
              9: FlexColumnWidth(1.5),
            },
            headerTextStyle: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF667085),
            ),
            headerBackgroundColor: const Color(0xFFECECEC),
            headerPadding: const EdgeInsets.all(12.0),
            cellPadding: const EdgeInsets.all(12.0),
            border: TableBorder.symmetric(
              inside: const BorderSide(color: Color(0xFFEEEEEE), width: 1),
            ),
            cellBuilder: (context, col, quotation) {
              switch (col) {
                case 0:
                  return Checkbox(value: false, onChanged: (value) {});
                case 1:
                  return Row(
                    children: [
                      _buildAvatar(quotation),
                      const SizedBox(width: 10),
                      Text(
                        quotation.nombre,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF101828),
                        ),
                      ),
                    ],
                  );
                case 2:
                  return Text(
                    quotation.fechaUltimaBoda.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                    ),
                  );
                case 3:
                  return Text(
                    quotation.invitados.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                    ),
                  );
                case 4:
                  return Text(
                    quotation.tipoCeremonia,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                    ),
                  );
                case 5:
                  return Text(
                    quotation.lugarCeremonia,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                    ),
                  );
                case 6:
                  return quotation.isSumitedBoda
                      ? const Icon(Icons.picture_as_pdf, size: 46)
                      : const SizedBox();
                case 7:
                  return quotation.isSumitedBoda
                      ? const Icon(Icons.picture_as_pdf, size: 46)
                      : const SizedBox();
                case 8:
                  return Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 17,
                        color: Colors.black.withValues(alpha: 0.59),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.message,
                        size: 17,
                        color: Colors.black.withValues(alpha: 0.59),
                      ),
                    ],
                  );
                case 9:
                  return quotation.isActive
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 7,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF027A48).withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.check_circle,
                                size: 12,
                                color: const Color(0xFF027A48),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Activa',
                                style: GoogleFonts.inter(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF027A48),
                                ),
                              ),
                            ],
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            if (onAccept != null) {
                              onAccept!(quotation.userId);
                            }
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECFDF3),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: const Color(0xFF027A48).withOpacity(0.3),
                                width: 1,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check,
                                  size: 12,
                                  color: const Color(0xFF027A48),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Aceptar',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF027A48),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
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
