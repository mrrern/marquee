import 'package:bodas/routes/linkspaper.dart';

class NotificationItem extends ConsumerWidget {
  final NotificationModel notification;
  final VoidCallback onTap;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);

    // Determinar si mostrar el texto completo o truncado
    String displayContent = notification.content;
    bool showReadMore = false;

    if (isMobile && displayContent.length > 50) {
      displayContent = '${displayContent.substring(0, 50)}...';
      showReadMore = true;
    } else if (isTablet && displayContent.length > 100) {
      displayContent = '${displayContent.substring(0, 100)}...';
      showReadMore = true;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFABABAB),
            width: 1,
          ),
        ),
      ),
      child: isMobile
          ? _buildMobileLayout(displayContent, showReadMore)
          : _buildDesktopLayout(displayContent, showReadMore),
    );
  }

  Widget _buildMobileLayout(String displayContent, bool showReadMore) {
    return InkWell(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.notifications_outlined,
            size: 20,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: GoogleFonts.inter(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        displayContent,
                        style: GoogleFonts.inter(
                          fontSize: 11,
                        ),
                      ),
                    ),
                    if (showReadMore)
                      Text(
                        'ver mas',
                        style: GoogleFonts.inter(
                          fontSize: 11,
                          color: const Color(0xFF4A4A4A),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                notification.formattedDate,
                style: GoogleFonts.inter(
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                notification.filterType,
                style: GoogleFonts.inter(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(String displayContent, bool showReadMore) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const SizedBox(
            width: 40,
            child: Icon(
              Icons.notifications_outlined,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          displayContent,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      if (showReadMore)
                        Text(
                          'ver mas',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF4A4A4A),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: Text(
              notification.formattedDate,
              style: GoogleFonts.inter(
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Text(
              notification.filterType,
              style: GoogleFonts.inter(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}