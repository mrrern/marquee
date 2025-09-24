import 'package:bodas/routes/linkspaper.dart';

class QuotationTable extends StatelessWidget {
  final List<CotizacionRequest> quotations;
  final Function(CotizacionLogic)? onSelect;

  const QuotationTable({
    super.key,
    required this.quotations,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white.withValues(alpha: 0.7),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(const Color(0xFFECECEC)),
            dataRowMinHeight: 70,
            dataRowMaxHeight: 70,
            columns: [
              DataColumn(
                label: Checkbox(
                  value: false,
                  onChanged: (value) {},
                ),
              ),
              DataColumn(
                label: Text(
                  'Nombre',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Fecha',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Invitados',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Ceremonia',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Lugar',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Cotización',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Contrato firmado',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Contactar',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Contratados',
                  style: GoogleFonts.inter(
                    fontSize: 17, // 20 * 0.85
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
            ],
            rows: quotations.map((quotation) {
              return DataRow(
                cells: [
                  DataCell(
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        _buildAvatar(quotation),
                        const SizedBox(width: 10), // 12 * 0.85
                        Text(
                          quotation.nombre,
                          style: GoogleFonts.inter(
                            fontSize: 12, // 14 * 0.85
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF101828),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Text(
                      quotation.fechaUltimaBoda.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 12, // 14 * 0.85
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      quotation.invitados.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 12, // 14 * 0.85
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      quotation.tipoCeremonia,
                      style: GoogleFonts.inter(
                        fontSize: 12, // 14 * 0.85
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      quotation.lugarCeremonia,
                      style: GoogleFonts.inter(
                        fontSize: 12, // 14 * 0.85
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  DataCell(
                    quotation.isSumitedBoda
                        ? Icon(
                            Icons.picture_as_pdf,
                            size: 46,
                          ) // 54 * 0.85
                        : const SizedBox(),
                  ),
                  DataCell(
                    quotation.isSumitedBoda
                        ? Icon(
                            Icons.picture_as_pdf,
                            size: 46,
                          ) // 54 * 0.85
                        : const SizedBox(),
                  ),
                  DataCell(
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 17, // 20 * 0.85
                          color: Colors.black.withValues(alpha: 0.59),
                        ),
                        const SizedBox(width: 8), // 10 * 0.85
                        Icon(
                          Icons.message,
                          size: 17, // 20 * 0.85
                          color: Colors.black.withValues(alpha: 0.59),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    quotation.isSumitedBoda
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 7, // 8 * 0.85
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECFDF3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Aceptar',
                              style: GoogleFonts.inter(
                                fontSize: 10, // 12 * 0.85
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF027A48),
                              ),
                            ),
                          )
                        : const SizedBox(),
                  ),
                ],
              );
            }).toList(),
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
