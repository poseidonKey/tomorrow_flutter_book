import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Song {
  String title;
  String artist;
  String album;
  Song({
    required this.title,
    required this.artist,
    required this.album,
  });
}

class MusicPlayerController extends ChangeNotifier {
  List<Song> playList = [];
  int currentIndex = 0;
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  void addSong(Song song) {
    playList.add(song);
    notifyListeners();
  }

  void play() {
    _isPlaying = true;
    notifyListeners();
  }

  void pause() {
    _isPlaying = false;
    notifyListeners();
  }

  void next() {
    if (currentIndex < playList.length - 1) {
      currentIndex++;
    } else {
      currentIndex = 0;
    }
    notifyListeners();
  }

  void previous() {
    if (currentIndex > 0) {
      currentIndex--;
    } else {
      currentIndex = playList.length - 1;
    }
    notifyListeners();
  }
}

class MusicPlayerView extends StatelessWidget {
  final MusicPlayerController controller;
  const MusicPlayerView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final musicController = Provider.of<MusicPlayerController>(context);
    final currentSong = controller.playList[musicController.currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Song Provider'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CodeSnippet(text: currentSong.title, fontSize: 24),
            const SizedBox(
              height: 10,
            ),
            CodeSnippet(text: currentSong.artist, fontSize: 18),
            const SizedBox(
              height: 10,
            ),
            CodeSnippet(text: currentSong.album, fontSize: 18),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: musicController.previous,
                  icon: const Icon(Icons.skip_previous),
                ),
                IconButton(
                  onPressed: () {
                    if (musicController.isPlaying) {
                      musicController.pause();
                    } else {
                      musicController.play();
                    }
                  },
                  icon: Icon(musicController.isPlaying
                      ? Icons.pause
                      : Icons.play_arrow),
                ),
                IconButton(
                  onPressed: musicController.next,
                  icon: const Icon(Icons.skip_next),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CodeSnippet extends StatelessWidget {
  final String text;
  final double fontSize;
  const CodeSnippet({
    super.key,
    required this.text,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.blue),
    );
  }
}

class MusicPlayerP220 extends StatelessWidget {
  MusicPlayerController controller;
  MusicPlayerP220({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MusicPlayerController>.value(
        value: controller,
        child: MusicPlayerView(
          controller: controller,
        ),
      ),
    );
  }
}
