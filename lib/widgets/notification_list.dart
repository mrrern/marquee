import 'package:bodas/routes/linkspaper.dart';

class NotificationListWidget extends ConsumerWidget {
  const NotificationListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationsStreamProvider);
    final bool isMobile = Responsive.isMobile(context);

    if (!notifications.hasValue || notifications.valueOrNull == null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.notifications_off_outlined,
              size: 64,
              color: Color(0xFF888888),
            ),
            const SizedBox(height: 16),
            Text(
              'No hay notificaciones',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: const Color(0xFF888888),
              ),
            ),
          ],
        ),
      );
    }

    return Container(
      width: isMobile ? 337 : 747,
      decoration: BoxDecoration(
        color: const Color(0xFFDCDCDC),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0x75000000),
            blurRadius: 24,
            offset: Offset(1, 35),
          ),
        ],
      ),
      child: Column(
        children: [
          buildHeader(context),
          ...notifications.valueOrNull?.map((notification) => NotificationItem(
                    notification: notification,
                    onTap: () =>
                        showNotificationDialog(context, ref, notification),
                  )) ??
              [],
        ],
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFDCDCDC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: isMobile
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.notifications_outlined),
                    const SizedBox(width: 18),
                    Text(
                      'Notificación',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Fecha',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Filtro',
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.notifications_outlined),
                        const SizedBox(width: 93),
                        Text(
                          'Notificación',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Fecha',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Filtro',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void showNotificationDialog(
      BuildContext context, WidgetRef ref, NotificationsModel notification) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          notification.title ?? '',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        content: SizedBox(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.body ?? '',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      notification.createdAt.toLocal().toString(),
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      notification.type,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Marcar como leída al cerrar
              if (notification.readAt == null) {
                ref
                    .read(notificationsLogicProvider)
                    .markAsRead(notification.id);
              }
              Navigator.of(context).pop();
            },
            child: Text(
              'Cerrar',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
