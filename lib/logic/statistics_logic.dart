import 'package:bodas/routes/linkspaper.dart';

class MonthlyCount {
  final int month; // 1..12
  final int count;

  MonthlyCount(this.month, this.count);
}

class StatisticsResult {
  final int totalUsers;
  final int contractedUsers;
  final int nonContractedUsers;
  final List<MonthlyCount> monthlyWeddings;

  StatisticsResult({
    required this.totalUsers,
    required this.contractedUsers,
    required this.nonContractedUsers,
    required this.monthlyWeddings,
  });
}

class StatisticsLogic {
  final SupabaseClient _supabase = Supabase.instance.client;

  /// Count total users (is_deleted = false)
  Future<int> countUsers() async {
    final resp = await _supabase.from('user_info').select();
    final list = resp as List?;
    return list?.length ?? 0;
  }

  /// Count users with at least one wedding (using listar_boda view)
  Future<int> countUsersWithWeddings() async {
    // Query distinct user ids in listar_boda where is_deleted = false
    final rows =
        await _supabase.from('listar_boda').select().eq('is_deleted', false);
    final list = (rows as List).cast<dynamic>();
    final ids = <String>{};
    for (final r in list) {
      try {
        final id = (r as Map)['user_id']?.toString();
        if (id != null) ids.add(id);
      } catch (_) {}
    }
    return ids.length;
  }

  Future<List<MonthlyCount>> monthlyWeddingsCounts(int year) async {
    final rows = await _supabase
        .from('listar_boda')
        .select('fecha')
        .eq('is_deleted', false)
        .gte('fecha', DateTime(year, 1, 1).toIso8601String())
        .lte('fecha', DateTime(year, 12, 31, 23, 59, 59).toIso8601String());

    final list = (rows as List).cast<dynamic>();
    final counts = List<int>.filled(12, 0);
    for (final r in list) {
      try {
        final fecha = r['fecha'];
        DateTime dt;
        if (fecha is String)
          dt = DateTime.parse(fecha);
        else if (fecha is DateTime)
          dt = fecha;
        else
          continue;
        if (dt.year == year) counts[dt.month - 1]++;
      } catch (_) {}
    }
    final result = <MonthlyCount>[];
    for (var i = 0; i < 12; i++) result.add(MonthlyCount(i + 1, counts[i]));
    return result;
  }

  Future<StatisticsResult> fetchStatistics({int? year}) async {
    year ??= DateTime.now().year;
    final total = await countUsers();
    final contracted = await countUsersWithWeddings();
    final nonContracted = (total - contracted).clamp(0, total);
    final monthly = await monthlyWeddingsCounts(year);
    return StatisticsResult(
      totalUsers: total,
      contractedUsers: contracted,
      nonContractedUsers: nonContracted,
      monthlyWeddings: monthly,
    );
  }
}

final statisticsLogicProvider = Provider<StatisticsLogic>((ref) {
  return StatisticsLogic();
});

final statisticsProvider =
    FutureProvider.family<StatisticsResult, int>((ref, year) async {
  final logic = ref.watch(statisticsLogicProvider);
  return logic.fetchStatistics(year: year);
});
