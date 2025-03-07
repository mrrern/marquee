
import 'package:bodas/routes/linkspaper.dart';

class NotificationFilterWidget extends ConsumerWidget {
  const NotificationFilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(currentFilterProvider);
    final currentOrder = ref.watch(currentOrderProvider);
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Filtrar por:',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildFilterChip(
                context,
                ref,
                'Todas',
                currentFilter == NotificationFilter.all,
                () => ref.read(currentFilterProvider.notifier).setFilter(NotificationFilter.all),
              ),
              _buildFilterChip(
                context,
                ref,
                'No leídas',
                currentFilter == NotificationFilter.unread,
                () => ref.read(currentFilterProvider.notifier).setFilter(NotificationFilter.unread),
              ),
              _buildFilterChip(
                context,
                ref,
                'Importantes',
                currentFilter == NotificationFilter.important,
                () => ref.read(currentFilterProvider.notifier).setFilter(NotificationFilter.important),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Ordenar por:',
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 14 : 16,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              _buildFilterChip(
                context,
                ref,
                'Más recientes',
                currentOrder == NotificationOrder.newest,
                () => ref.read(currentOrderProvider.notifier).setOrder(NotificationOrder.newest),
              ),
              _buildFilterChip(
                context,
                ref,
                'Más antiguas',
                currentOrder == NotificationOrder.oldest,
                () => ref.read(currentOrderProvider.notifier).setOrder(NotificationOrder.oldest),
              ),
            ],
          ),
          const SizedBox(height: 16),
          if (ref.watch(hasUnreadNotificationsProvider))
            ElevatedButton.icon(
              onPressed: () {
                ref.read(notificationListProvider.notifier).markAllAsRead();
              },
              icon: const Icon(Icons.check_circle_outline),
              label: Text(
                'Marcar todas como leídas',
                style: GoogleFonts.inter(),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF888888),
                foregroundColor: Colors.white,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    BuildContext context,
    WidgetRef ref,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF888888) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? const Color(0xFF888888) : Colors.grey,
            width: 1,
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: isSelected ? FontWeight.w500 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}