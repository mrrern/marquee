import 'package:bodas/routes/linkspaper.dart';

class AdminStadisticsScreen extends ConsumerWidget {
  const AdminStadisticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final year = DateTime.now().year;
    final statsAsync = ref.watch(statisticsProvider(year));
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < 850;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          statsAsync.when(
            data: (stats) {
              final rows = [
                {
                  'totalUsers': stats.totalUsers,
                  'contracted': stats.contractedUsers,
                  'nonContracted': stats.nonContractedUsers,
                }
              ];
              final csv = exportToCsv(rows);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('CSV de estadísticas generado (ver consola)')));
              // ignore: avoid_print
              print(csv);
            },
            loading: () => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Cargando estadísticas...'))),
            error: (e, st) => ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Error generando CSV'))),
          );
        },
        child: const Icon(Icons.download),
      ),
      body: Row(
        children: [
          const SidebarMenu(),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 12 : 40, vertical: isMobile ? 12 : 20),
              child: statsAsync.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Error: $e')),
                data: (stats) {
                  final data = stats.monthlyWeddings
                      .map((m) => ChartData(m.month, m.count))
                      .toList();

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      Center(
                        child: Text('Estadística',
                            style: GoogleFonts.inter(
                                fontSize: 32, fontWeight: FontWeight.w700)),
                      ),
                      const SizedBox(height: 20),

                      // Summary cards
                      Row(
                        children: [
                          _SummaryCard(
                              title: 'Numero de Usuarios registrados',
                              value: stats.totalUsers.toString()),
                          const SizedBox(width: 16),
                          _SummaryCard(
                              title: 'Numero de usuario contratados',
                              value: stats.contractedUsers.toString()),
                          const SizedBox(width: 16),
                          _SummaryCard(
                              title: 'Numero de usuarios no contratados',
                              value: stats.nonContractedUsers.toString()),
                          const Spacer(),
                          // Year selector placeholder
                          DropdownButton<int>(
                            value: year,
                            items: [
                              for (int y = year - 3; y <= year; y++)
                                DropdownMenuItem(value: y, child: Text('$y'))
                            ],
                            onChanged: (v) {
                              if (v != null)
                                ref.invalidate(statisticsProvider(v));
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Chart
                      Expanded(
                        child: Card(
                          elevation: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: SfCartesianChart(
                              primaryXAxis: CategoryAxis(
                                  majorGridLines:
                                      const MajorGridLines(width: 0)),
                              primaryYAxis: NumericAxis(
                                majorGridLines: const MajorGridLines(
                                    color: Color(0xFFECECEC)),
                              ),
                              series: <CartesianSeries<ChartData, String>>[
                                ColumnSeries<ChartData, String>(
                                  dataSource: data,
                                  xValueMapper: (d, i) {
                                    const months = [
                                      'Ene',
                                      'Feb',
                                      'Mar',
                                      'Abr',
                                      'May',
                                      'Jun',
                                      'Jul',
                                      'Ago',
                                      'Sep',
                                      'Oct',
                                      'Nov',
                                      'Dic'
                                    ];
                                    final idx = (d.month - 1).clamp(0, 11);
                                    return months[idx];
                                  },
                                  yValueMapper: (d, i) => d.count,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ChartData {
  final int month;
  final int count;
  ChartData(this.month, this.count);
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String value;
  const _SummaryCard({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    GoogleFonts.inter(fontSize: 14, color: Colors.grey[700])),
            const SizedBox(height: 12),
            Text(value,
                style: GoogleFonts.inter(
                    fontSize: 36, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}
