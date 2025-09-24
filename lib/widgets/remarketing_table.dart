// Tabla para versión desktop
import 'package:bodas/routes/linkspaper.dart';

class RemarketingTable extends ConsumerWidget {
  final List<RemarketingUserModel> users;

  const RemarketingTable({super.key, required this.users});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Table(
            border: TableBorder.symmetric(
              inside: const BorderSide(color: Color(0xFFEEEEEE), width: 1),
            ),
            columnWidths: const {
              0: FlexColumnWidth(3),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(2),
              3: FlexColumnWidth(3),
              4: FixedColumnWidth(80),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: const Color(0xFFECECEC)),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Nombre', style: _headerTextStyle()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Estado', style: _headerTextStyle()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Fecha', style: _headerTextStyle()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Correo', style: _headerTextStyle()),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text('Redactar', style: _headerTextStyle()),
                  ),
                ],
              ),
              for (final user in users)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(user.nombre),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: getStatusColor(user.tieneBodaActiva),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(user.tieneBodaActiva ? 'Si' : 'No'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(user.fechaCreacion.toIso8601String()),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(user.email),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Checkbox(
                        value: user.isSelected,
                        onChanged: (value) => ref
                            .read(selectedRemarketingUserProvider.notifier)
                            .state = user,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _headerTextStyle() {
    return GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: const Color(0xFF667085),
    );
  }
}

// Tarjeta para versión móvil
class RemarketingCard extends ConsumerWidget {
  final RemarketingUserModel user;

  const RemarketingCard({super.key, required this.user});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user.nombre,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: getStatusColor(user.tieneBodaActiva),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(user.tieneBodaActiva ? "Si" : "No"),
              ],
            ),
            const SizedBox(height: 8),
            Text(user.fechaCreacion.toIso8601String()),
            const SizedBox(height: 8),
            Text(user.email),
            Checkbox(
              value: user.isSelected,
              onChanged: (value) => ref
                  .read(selectedRemarketingUserProvider.notifier)
                  .state = user,
            ),
          ],
        ),
      ),
    );
  }
}

Color getStatusColor(bool status) {
  switch (status) {
    case true:
      return Colors.green;
    case false:
      return Colors.red;
  }
}
