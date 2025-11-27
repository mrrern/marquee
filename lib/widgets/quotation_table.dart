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
              'Estado',
              'Invitados',
              'Ceremonia',
              'Lugar',
              'Contactar',
              'Acciones',
            ],
            data: quotations,
            columnWidths: const {
              0: FixedColumnWidth(48),
              1: FlexColumnWidth(3),
              2: FlexColumnWidth(1.1),
              3: FlexColumnWidth(2), // Estado
              4: FlexColumnWidth(1.2), // Invitados
              5: FlexColumnWidth(1.5), // Ceremonia
              6: FlexColumnWidth(2), // Lugar
              7: FlexColumnWidth(1.3), // Contactar
              8: FlexColumnWidth(2), // Acciones
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
                        overflow: TextOverflow.ellipsis,
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
                    DateFormat('yyyy-MM-dd').format(quotation.fechaUltimaBoda),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                    ),
                  );
                case 3:
                  return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: _buildStatusBadge(quotation.estadoId ?? 0));
                case 4:
                  return Text(
                    quotation.invitados.toString(),
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                    ),
                  );
                case 5:
                  return Text(
                    quotation.tipoCeremonia,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                    ),
                  );
                case 6:
                  return Text(
                    quotation.lugarCeremonia,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: const Color(0xFF667085),
                    ),
                  );
                case 7:
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
                case 8:
                  return _buildActionButton(context, quotation);
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBadge(int estadoId) {
    String label;
    Color bgColor;
    Color textColor;

    switch (estadoId) {
      case 1:
        label = 'Cotizando';
        bgColor = const Color(0xFFFEF3F2);
        textColor = const Color(0xFFB42318);
        break;
      case 2:
        label = 'Enviado';
        bgColor = const Color(0xFFF8F9FC);
        textColor = const Color(0xFF3538CD);
        break;
      case 3:
        label = 'Entregado';
        bgColor = const Color(0xFFFFF4ED);
        textColor = const Color(0xFFDC6803);
        break;
      default:
        label = 'Desconocido';
        bgColor = const Color(0xFFF2F4F7);
        textColor = const Color(0xFF475467);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, CotizacionRequest quotation) {
    final estadoId = quotation.estadoId ?? 0;

    switch (estadoId) {
      case 1: // Cotizando - Admin debe subir cotización
        return GestureDetector(
          onTap: () {
            // TODO: Implementar diálogo para subir archivo
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                  content: Text('Subir cotización - Por implementar')),
            );
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                const Icon(Icons.upload_file,
                    size: 14, color: Color(0xFF027A48)),
                const SizedBox(width: 4),
                Text(
                  'Subir Cotización',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF027A48),
                  ),
                ),
              ],
            ),
          ),
        );

      case 2: // Enviado - Esperando que usuario firme
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFF8F9FC),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.schedule, size: 14, color: Color(0xFF3538CD)),
              const SizedBox(width: 4),
              Text(
                'Esperando firma',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF3538CD),
                ),
              ),
            ],
          ),
        );

      case 3: // Entregado - Admin puede autorizar
        return GestureDetector(
          onTap: () {
            if (onAccept != null) {
              onAccept!(quotation.userId);
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
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
                const Icon(Icons.check_circle,
                    size: 14, color: Color(0xFF027A48)),
                const SizedBox(width: 4),
                Text(
                  'Autorizar',
                  style: GoogleFonts.inter(
                    fontSize: 11,
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
