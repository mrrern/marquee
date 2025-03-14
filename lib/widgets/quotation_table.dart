import 'package:bodas/routes/linkspaper.dart';

class QuotationTable extends StatelessWidget {
  final List<QuotationRequest> quotations;
  final Function(QuotationRequest)? onSelect;

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
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Fecha',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Invitados',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Ceremonia',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Lugar',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Cotización',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Contrato firmado',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Contactar',
                  style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Contratados',
                  style: GoogleFonts.inter(
                    fontSize: 20,
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
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              quotation.name,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF101828),
                              ),
                            ),
                            Text(
                              quotation.username,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: const Color(0xFF667085),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Text(
                      quotation.date,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      quotation.guests.toString(),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      quotation.ceremonyType,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      quotation.location,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  DataCell(
                    quotation.hasQuotation
                        ? Icon(Icons.picture_as_pdf, size: 54,)
                        : const SizedBox(),
                  ),
                  DataCell(
                    quotation.hasSignedContract
                        ? Icon(Icons.picture_as_pdf, size: 54,)
                        : const SizedBox(),
                  ),
                  DataCell(
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          size: 20,
                          color: Colors.black.withValues(alpha: 0.59),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.message,
                          size: 20,
                          color: Colors.black.withValues(alpha: 0.59),
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    quotation.isAccepted
                        ? Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFECFDF3),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Aceptar',
                              style: GoogleFonts.inter(
                                fontSize: 12,
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

  Widget _buildAvatar(QuotationRequest quotation) {
    if (quotation.avatarUrl.isNotEmpty) {
      return CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage(quotation.avatarUrl),
      );
    } else {
      // Placeholder with initials
      final initials = quotation.name
          .split(' ')
          .take(2)
          .map((name) => name.isNotEmpty ? name[0] : '')
          .join();

      return CircleAvatar(
        radius: 20,
        backgroundColor: const Color(0xFFF9F5FF),
        child: Text(
          initials,
          style: GoogleFonts.inter(
            fontSize: 16,
            color: const Color(0xFF7F56D9),
          ),
        ),
      );
    }
  }
}