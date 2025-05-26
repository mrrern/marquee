import 'package:bodas/routes/linkspaper.dart';
import 'package:video_player/video_player.dart';

class PlayerVideo extends StatefulWidget {
  const PlayerVideo({
    super.key,
  });

  @override
  State<PlayerVideo> createState() => _PlayerVideoState();
}

class _PlayerVideoState extends State<PlayerVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(video),
    )..initialize().then((_) {
        setState(() {
          _controller.setLooping(true);
        });
      });
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      ),
    );
  }
}
