import 'dart:math' as math;

import 'package:bodas/routes/linkspaper.dart';

// Tabla para versión desktop
class RemarketingTable extends ConsumerWidget {
  final RemarketingPaginatedResponse pageData;
  final void Function(int page) onPageChange;
  final void Function(int pageSize)? onPageSizeChange;

  const RemarketingTable({
    required this.pageData,
    required this.onPageChange,
    this.onPageSizeChange,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = pageData.items;
    final currentPage = pageData.page;
    final pageSize = pageData.pageSize;
    final totalItems = pageData.totalItems;
    final totalPages = (totalItems / pageSize).ceil();
    final isMobile = MediaQuery.of(context).size.width < 600;

    if (!isMobile) {
      final screenWidth = MediaQuery.of(context).size.width;
      final minWidth = math.max(800.0, screenWidth - 80);
      // limit height to avoid unbounded height inside parent ScrollViews
      final tableHeight =
          math.min(640.0, MediaQuery.of(context).size.height * 0.65);

      return SizedBox(
        height: tableHeight,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: .6),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TableMarquee<RemarketingUserModel>(
            headers: const [
              'Nombre',
              'Estado',
              'Fecha',
              'Correo',
              'Redactar',
            ],
            data: users,
            columnWidths: const {
              0: FlexColumnWidth(2),
              1: FlexColumnWidth(1),
              2: FlexColumnWidth(1),
              3: FlexColumnWidth(2),
              4: FixedColumnWidth(90),
            },
            minWidth: minWidth,
            headerTextStyle: const TextStyle(fontWeight: FontWeight.w600),
            headerBackgroundColor: Colors.grey[200],
            headerPadding: const EdgeInsets.all(12.0),
            cellPadding: const EdgeInsets.all(12.0),
            cellBuilder: (context, col, user) {
              switch (col) {
                case 0:
                  return Text(user.nombre);
                case 1:
                  return Row(
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
                  );
                case 2:
                  return Text(user.fechaCreacion.toIso8601String());
                case 3:
                  return Text(user.email);
                case 4:
                  return Checkbox(
                    value: ref.watch(selectedRemarketingUserProvider)?.id ==
                        user.id,
                    onChanged: (value) => ref
                        .read(selectedRemarketingUserProvider.notifier)
                        .state = value == true ? user : null,
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
        ),
      );
    }

    return Column(
      children: users
          .map((user) => RemarketingCard(
                user: user,
              ))
          .toList(),
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
      margin: const EdgeInsets.symmetric(vertical: 6),
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
              value: ref.watch(selectedRemarketingUserProvider)?.id == user.id,
              onChanged: (value) => ref
                  .read(selectedRemarketingUserProvider.notifier)
                  .state = value == true ? user : null,
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
