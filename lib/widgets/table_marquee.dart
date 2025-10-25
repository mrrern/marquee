import 'dart:math' as math;
import 'package:bodas/routes/linkspaper.dart';

/// TableMarquee
///
/// Widget de tabla reutilizable con un diseño consistente con las tablas usadas
/// en el proyecto (encabezado destacado, borde interno sutil y scroll horizontal).
///
/// Permite:
/// - Definir encabezados (`headers`)
/// - Proveer los datos (`data`)
/// - Construir el contenido de cada celda con `cellBuilder`
/// - Opcionalmente ajustar los anchos de columnas, paddings, estilos y borde
///
/// Ejemplo de uso:
/// TableMarquee<UserInfo>(
///   headers: const ['Nombre', 'Rol', 'Correo', 'Fecha', 'Acciones'],
///   data: users,
///   columnWidths: const {
///     0: FlexColumnWidth(3),
///     1: FlexColumnWidth(2),
///     2: FlexColumnWidth(3),
///     3: FlexColumnWidth(2),
///     4: FlexColumnWidth(2),
///   },
///   cellBuilder: (context, colIndex, user) {
///     switch (colIndex) {
///       case 0:
///         return Row(
///           children: [
///             CircleAvatar(
///               radius: 20,
///               child: Text(user.nombre.isNotEmpty ? user.nombre[0] : 'U'),
///             ),
///             const SizedBox(width: 10),
///             Flexible(
///               child: Column(
///                 crossAxisAlignment: CrossAxisAlignment.start,
///                 children: [
///                   Text(user.nombre, style: const TextStyle(fontWeight: FontWeight.w600)),
///                   const SizedBox(height: 6),
///                   Text('@${user.nombre}', style: const TextStyle(color: Colors.grey, fontSize: 12)),
///                 ],
///               ),
///             ),
///           ],
///         );
///       case 1:
///         return Text(user.rol);
///       case 2:
///         return Text(user.email);
///       case 3:
///         return const Text(''); // fecha u otro dato
///       case 4:
///         return Row(
///           mainAxisAlignment: MainAxisAlignment.end,
///           children: const [
///             Icon(Icons.edit, size: 18),
///             SizedBox(width: 4),
///             Icon(Icons.delete, size: 18),
///           ],
///         );
///       default:
///         return const SizedBox();
///     }
///   },
/// )
class TableMarquee<T> extends StatelessWidget {
  /// Títulos de las columnas
  final List<String> headers;

  /// Fuente de datos (cada elemento representa una fila)
  final List<T> data;

  /// Construye el contenido de cada celda de una fila.
  /// columnIndex corresponde al índice de la columna en [headers].
  final Widget Function(BuildContext context, int columnIndex, T item)
      cellBuilder;

  /// Anchos de columnas (opcional). Si no se define, usa anchos flexibles por defecto.
  final Map<int, TableColumnWidth>? columnWidths;

  /// Ancho mínimo de la tabla dentro del scroll horizontal.
  /// Por defecto: max(600, anchoDePantalla - 80).
  final double? minWidth;

  /// Estilo del texto del encabezado
  final TextStyle? headerTextStyle;

  /// Color de fondo del encabezado
  final Color? headerBackgroundColor;

  /// Padding para celdas de encabezado
  final EdgeInsetsGeometry? headerPadding;

  /// Padding para celdas de datos
  final EdgeInsetsGeometry? cellPadding;

  /// Borde de la tabla
  final TableBorder? border;

  const TableMarquee({
    super.key,
    required this.headers,
    required this.data,
    required this.cellBuilder,
    this.columnWidths,
    this.minWidth,
    this.headerTextStyle,
    this.headerBackgroundColor,
    this.headerPadding,
    this.cellPadding,
    this.border,
  }) : assert(headers.length > 0, 'Debes proporcionar al menos una columna');

  @override
  Widget build(BuildContext context) {
    final effectiveHeaderTextStyle = headerTextStyle ??
        const TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xFF101828),
          fontSize: 14,
        );

    final effectiveHeaderBg = headerBackgroundColor ?? const Color(0xFFECECEC);
    final effectiveHeaderPadding = headerPadding ?? const EdgeInsets.all(12.0);
    final effectiveCellPadding = cellPadding ?? const EdgeInsets.all(12.0);

    final screenWidth = MediaQuery.of(context).size.width;
    final effectiveMinWidth = math.max(600.0, minWidth ?? (screenWidth - 80));

    final effectiveBorder = border ??
        TableBorder.symmetric(
          inside: const BorderSide(
            color: Color(0xFFEEEEEE),
            width: 1,
          ),
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: effectiveMinWidth),
            child: Table(
              border: effectiveBorder,
              columnWidths: columnWidths,
              children: [
                // Fila de encabezado
                TableRow(
                  decoration: BoxDecoration(color: effectiveHeaderBg),
                  children: [
                    for (final title in headers)
                      Padding(
                        padding: effectiveHeaderPadding,
                        child: Text(title, style: effectiveHeaderTextStyle),
                      ),
                  ],
                ),
                // Filas de datos
                for (final item in data)
                  TableRow(
                    children: List.generate(headers.length, (col) {
                      return Padding(
                        padding: effectiveCellPadding,
                        child: cellBuilder(context, col, item),
                      );
                    }),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
