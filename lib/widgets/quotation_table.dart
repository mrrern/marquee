import 'package:bodas/routes/linkspaper.dart';
import 'dart:io';

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
                      IconButton(
                        icon: Icon(
                          Icons.phone,
                          size: 17,
                          color: Colors.black.withValues(alpha: 0.59),
                        ),
                        onPressed: () => _showPhoneDialog(context, quotation),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        icon: Icon(
                          Icons.message,
                          size: 17,
                          color: Colors.black.withValues(alpha: 0.59),
                        ),
                        onPressed: () => _showEmailDialog(context, quotation),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
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
          onTap: () => _showUploadDialog(context, quotation),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFECFDF3),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFF027A48).withValues(alpha: 0.3),
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
                color: const Color(0xFF027A48).withValues(alpha: 0.3),
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

  void _showPhoneDialog(BuildContext context, CotizacionRequest quotation) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.phone, color: const Color(0xFF7F56D9)),
              const SizedBox(width: 8),
              Text(
                'Información de Contacto',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nombre',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF667085),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                quotation.nombre,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF101828),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Teléfono Novio',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF667085),
                ),
              ),
              const SizedBox(height: 4),
              SelectableText(
                quotation.telefonoNovio,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF101828),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Teléfono Novia',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF667085),
                ),
              ),
              const SizedBox(height: 4),
              SelectableText(
                quotation.telefonoNovia,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF101828),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                'Cerrar',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF7F56D9),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _showEmailDialog(BuildContext context, CotizacionRequest quotation) {
    final subjectController = TextEditingController();
    final bodyController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.email, color: const Color(0xFF7F56D9)),
              const SizedBox(width: 8),
              Text(
                'Enviar Correo',
                style: GoogleFonts.inter(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Para: ${quotation.email}',
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Asunto',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: subjectController,
                  decoration: InputDecoration(
                    hintText: 'Escribe el asunto del correo',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 10,
                    ),
                  ),
                  style: GoogleFonts.inter(fontSize: 14),
                ),
                const SizedBox(height: 16),
                Text(
                  'Cuerpo del mensaje',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF667085),
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  controller: bodyController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Escribe el mensaje aquí',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.all(12),
                  ),
                  style: GoogleFonts.inter(fontSize: 14),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text(
                'Cancelar',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF667085),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(dialogContext).pop();
                _sendEmail(
                  quotation.email,
                  subjectController.text,
                  bodyController.text,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF7F56D9),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Enviar',
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _sendEmail(String email, String subject, String body) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: email,
      query: _encodeQueryParameters(<String, String>{
        'subject': subject,
        'body': body,
      }),
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((entry) =>
            '${Uri.encodeComponent(entry.key)}=${Uri.encodeComponent(entry.value)}')
        .join('&');
  }

  void _showUploadDialog(BuildContext context, CotizacionRequest quotation) {
    bool isUploading = false;
    String? selectedFileName;
    File? selectedFile;

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Row(
                children: [
                  Icon(Icons.upload_file, color: const Color(0xFF7F56D9)),
                  const SizedBox(width: 8),
                  Text(
                    'Subir Cotización',
                    style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              content: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cliente: ${quotation.nombre}',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF667085),
                      ),
                    ),
                    const SizedBox(height: 16),
                    if (selectedFileName != null) ...[
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF9F5FF),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color:
                                const Color(0xFF7F56D9).withValues(alpha: 0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.insert_drive_file,
                              color: const Color(0xFF7F56D9),
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                selectedFileName!,
                                style: GoogleFonts.inter(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xFF101828),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                    if (isUploading)
                      Center(
                        child: Column(
                          children: [
                            CircularProgressIndicator(
                              color: const Color(0xFF7F56D9),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Subiendo archivo...',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                color: const Color(0xFF667085),
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              actions: [
                if (!isUploading) ...[
                  TextButton(
                    onPressed: () => Navigator.of(dialogContext).pop(),
                    child: Text(
                      'Cancelar',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF667085),
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () async {
                      FilePickerResult? result =
                          await FilePicker.platform.pickFiles(
                        type: FileType.custom,
                        allowedExtensions: ['pdf', 'doc', 'docx'],
                      );

                      if (result != null) {
                        setState(() {
                          selectedFile = File(result.files.single.path!);
                          selectedFileName = result.files.single.name;
                        });
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: const Color(0xFF7F56D9)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Seleccionar archivo',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF7F56D9),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: selectedFile == null
                        ? null
                        : () async {
                            setState(() => isUploading = true);

                            try {
                              final logic = CotizacionLogic();
                              await logic.uploadFile(
                                bodaId: quotation.bodaId!,
                                file: selectedFile!,
                                isAdmin: true,
                              );

                              if (dialogContext.mounted) {
                                Navigator.of(dialogContext).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Cotización subida exitosamente',
                                      style: GoogleFonts.inter(),
                                    ),
                                    backgroundColor: const Color(0xFF027A48),
                                  ),
                                );
                              }
                            } catch (e) {
                              setState(() => isUploading = false);
                              if (dialogContext.mounted) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Error al subir archivo: $e',
                                      style: GoogleFonts.inter(),
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF7F56D9),
                      disabledBackgroundColor:
                          const Color(0xFF7F56D9).withValues(alpha: 0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Subir',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ],
            );
          },
        );
      },
    );
  }
}
