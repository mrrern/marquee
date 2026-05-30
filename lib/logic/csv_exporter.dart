/// Simple CSV exporter placeholder.
/// For now it accepts a list of maps and returns a CSV string.
String exportToCsv(List<Map<String, dynamic>> rows) {
  if (rows.isEmpty) return '';

  final headers = rows.first.keys.toList();
  final buffer = StringBuffer();
  buffer.writeln(headers.map((h) => _escape(h)).join(','));

  for (final row in rows) {
    final line =
        headers.map((h) => _escape(row[h]?.toString() ?? '')).join(',');
    buffer.writeln(line);
  }

  return buffer.toString();
}

String _escape(String s) {
  if (s.contains(',') || s.contains('\n') || s.contains('"')) {
    return '"${s.replaceAll('"', '""')}"';
  }
  return s;
}
