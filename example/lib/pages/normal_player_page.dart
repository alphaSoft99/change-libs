import 'package:better_player/better_player.dart';
import 'package:better_player_example/constants.dart';
import 'package:better_player_example/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NormalPlayerPage extends StatefulWidget {
  @override
  _NormalPlayerPageState createState() => _NormalPlayerPageState();
}

class _NormalPlayerPageState extends State<NormalPlayerPage> {
  BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration = BetterPlayerConfiguration(
        aspectRatio: 16 / 9,
        fit: BoxFit.contain,
        controlsConfiguration: BetterPlayerControlsConfiguration(
            setting: SvgPicture.asset(
              'assets/svg/settings.svg',
              color: Colors.white,
            ),
            play: SvgPicture.asset(
              'assets/svg/play.svg',
              color: Colors.white,
            ),
            pause: SvgPicture.asset(
              'assets/svg/ic_pause.svg',
              color: Colors.white,
            ),
            enterFullScreen: SvgPicture.asset(
              'assets/svg/maximize.svg',
              color: Colors.white,
            ),
            exitFullScreen: SvgPicture.asset(
              'assets/svg/minimize.svg',
              color: Colors.white,
            ),
            next: SvgPicture.asset(
              'assets/svg/skip_next.svg',
              color: Colors.white,
            ),
            prev: SvgPicture.asset(
              'assets/svg/skip_prev.svg',
              color: Colors.white,
            ),
            skipBackIcon: Icons.replay_10,
            skipForwardIcon: Icons.forward_10,
            nextEpisode: () {},
            prevEpisode: () {},
            isSerial: true,
            enableAudioTracks: false,
            enableSubtitles: false,
            qualitiesIcon: SvgPicture.asset(
              'assets/svg/settings.svg',
              color: Colors.white,
            ),
            subtitlesIcon: SvgPicture.asset(
              'assets/svg/file_text.svg',
              color: Colors.white,
            ),
            playbackSpeedIcon: SvgPicture.asset(
              'assets/svg/play_circle.svg',
              color: Colors.white,
            ),
            bottomSheet: Color(0xff263c44),
            textColor: Colors.white));
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "http://cdn.theoplayer.com/video/elephants-dream/playlist.m3u8",
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Normal player"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "Normal player with configuration managed by developer.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          AspectRatio(
            aspectRatio: 16 / 9,
            child: BetterPlayer(controller: _betterPlayerController),
          ),
          ElevatedButton(
            child: Text("Play file data source"),
            onPressed: () async {
              String url = await Utils.getFileUrl(Constants.fileTestVideoUrl);
              BetterPlayerDataSource dataSource = BetterPlayerDataSource(BetterPlayerDataSourceType.file, url);
              _betterPlayerController.setupDataSource(dataSource);
            },
          ),
        ],
      ),
    );
  }
}