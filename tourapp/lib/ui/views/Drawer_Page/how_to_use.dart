import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class How_to_Use extends StatelessWidget {
  videoView(data) {
    return AspectRatio(
      aspectRatio: 1,
      child: BetterPlayer.network(
        data['url'],
        // ignore: prefer_const_constructors
        betterPlayerConfiguration: BetterPlayerConfiguration(
          aspectRatio: 1,
          autoPlay: false,
          placeholderOnTop: true,
          showPlaceholderUntilPlay: false,
          fit: BoxFit.contain,
          controlsConfiguration: const BetterPlayerControlsConfiguration(
            showControls: true,
            showControlsOnInitialize: false,
            enableSkips: false,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 64, 37, 37),
          elevation: 0,
          title: Text("How to Use"),
        ),
        body: Center(
          child: Text('Video Player'),
        ));
  }
}
