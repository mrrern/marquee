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

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * .65,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final availableWidth = constraints.maxWidth;
            final computedMinWidth = math.max(
              availableWidth - 64,
              800.0, // mínimo razonable para la tabla en desktop
            );

            // Scroll controllers para Scrollbar
            final horizontalController = ScrollController();
            final verticalController = ScrollController();

            return Column(
              children: [
                // Tabla en área scrollable (horizontal + vertical) con Scrollbars
                Expanded(
                  child: Scrollbar(
                    controller: verticalController,
                    thumbVisibility: true,
                    child: SingleChildScrollView(
                      controller: verticalController,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minWidth: computedMinWidth),
                        child: Scrollbar(
                          controller: horizontalController,
                          thumbVisibility: true,
                          notificationPredicate: (n) =>
                              n.metrics.axis == Axis.horizontal,
                          child: SingleChildScrollView(
                            controller: horizontalController,
                            scrollDirection: Axis.horizontal,
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                minWidth: computedMinWidth,
                                maxWidth:
                                    math.max(computedMinWidth, availableWidth),
                              ),
                              child: Table(
                                //  border: TableBorder.symmetric(
                                //  inside: const BorderSide(
                                //    color: Color(0xFFEEEEEE), width: 1),
                                // ),
                                columnWidths: const {
                                  0: FlexColumnWidth(2),
                                  1: FlexColumnWidth(1),
                                  2: FlexColumnWidth(1),
                                  3: FlexColumnWidth(2),
                                  4: FixedColumnWidth(90),
                                },
                                children: [
                                  TableRow(
                                    decoration: const BoxDecoration(
                                        color: Color(0xFFECECEC)),
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('Nombre',
                                            style: _headerTextStyle()),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text('Estado',
                                            style: _headerTextStyle()),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text('Fecha',
                                            style: _headerTextStyle()),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text('Correo',
                                            style: _headerTextStyle()),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Text('Redactar',
                                            style: _headerTextStyle()),
                                      ),
                                    ],
                                  ),
                                  for (final user in users)
                                    TableRow(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(user.nombre),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 10,
                                                height: 10,
                                                decoration: BoxDecoration(
                                                  color: getStatusColor(
                                                      user.tieneBodaActiva),
                                                  shape: BoxShape.circle,
                                                ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text((user.tieneBodaActiva)
                                                  ? 'Si'
                                                  : 'No'),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(
                                            ((user.fechaCreacion)
                                                .toIso8601String()),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Text(user.email),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Checkbox(
                                            value: ref
                                                    .watch(
                                                        selectedRemarketingUserProvider)
                                                    ?.id ==
                                                user.id,
                                            onChanged: (value) => ref
                                                .read(
                                                    selectedRemarketingUserProvider
                                                        .notifier)
                                                .state = value ==
                                                    true
                                                ? user
                                                : null,
                                          ),
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 12),

                // Controles de paginación
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Total: $totalItems'),
                        const SizedBox(width: 12),
                        if (onPageSizeChange != null)
                          DropdownButton<int>(
                            value: pageSize,
                            items: const [10, 20, 50]
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text('Por página: $e'),
                                    ))
                                .toList(),
                            onChanged: (val) {
                              if (val != null) onPageSizeChange!(val);
                            },
                          ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: currentPage > 1
                              ? () => onPageChange(currentPage - 1)
                              : null,
                          icon: const Icon(Icons.chevron_left),
                        ),
                        Text('Página $currentPage de $totalPages'),
                        IconButton(
                          onPressed: (pageSize > 0 &&
                                  currentPage * pageSize < totalItems)
                              ? () => onPageChange(currentPage + 1)
                              : null,
                          icon: const Icon(Icons.chevron_right),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  TextStyle _headerTextStyle() {
    return const TextStyle(
      color: Color(0xFF6B6B6B),
      fontWeight: FontWeight.w600,
      fontSize: 13,
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
