import 'package:bodas/routes/linkspaper.dart';
import 'package:video_player/video_player.dart';

class PlayerVideo extends ConsumerStatefulWidget {
  const PlayerVideo({
    super.key,
  });

  @override
  ConsumerState<PlayerVideo> createState() => _PlayerVideoState();
}

class _PlayerVideoState extends ConsumerState<PlayerVideo> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(videoControllerProvider.notifier).initializeVideo(video);
    });
  }

  @override
  Widget build(BuildContext context) {
    final videoController = ref.watch(videoControllerProvider);

    if (videoController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: videoController.value.aspectRatio,
        child: VideoPlayer(videoController),
      ),
    );
  }
}
