// Tabla para versión desktop
import 'package:bodas/routes/linkspaper.dart';

class RemarketingTable extends ConsumerWidget {
  final List<RemarketingUser> users;

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
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(const Color(0xFFECECEC)),
            dataRowMinHeight: 70,
            columns: [
              DataColumn(
                label: Text('Nombre', style: _headerTextStyle()),
              ),
              DataColumn(
                label: Text('Estado', style: _headerTextStyle()),
              ),
              DataColumn(
                label: Text('Fecha', style: _headerTextStyle()),
              ),
              DataColumn(
                label: Text('Correo', style: _headerTextStyle()),
              ),
              DataColumn(
                label: Text('Redactar', style: _headerTextStyle()),
              ),
            ],
            rows: users.asMap().entries.map((entry) {
              final index = entry.key;
              final user = entry.value;
              return DataRow(
                cells: [
                  DataCell(Text(user.name)),
                  DataCell(
                    Row(
                      children: [
                        Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: getStatusColor(user.status),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(user.status),
                      ],
                    ),
                  ),
                  DataCell(Text(user.date)),
                  DataCell(Text(user.email)),
                  DataCell(
                    Checkbox(
                      value: user.isSelected,
                      onChanged: (value) => ref
                          .read(remarketingProvider.notifier)
                          .toggleUserSelection(index),
                    ),
                  ),
                ],
              );
            }).toList(),
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
  final RemarketingUser user;

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
            Text(user.name,
                style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: getStatusColor(user.status),
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 8),
                Text(user.status),
              ],
            ),
            const SizedBox(height: 8),
            Text(user.date),
            const SizedBox(height: 8),
            Text(user.email),
            Checkbox(
              value: user.isSelected,
              onChanged: (value) => ref
                  .read(remarketingProvider.notifier)
                  .toggleUserSelection(user.hashCode),
            ),
          ],
        ),
      ),
    );
  }
}

Color getStatusColor(String status) {
  switch (status.toLowerCase()) {
    case 'active':
      return Colors.green;
    case 'imprison':
      return Colors.red;
    case 'interlifed':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}
