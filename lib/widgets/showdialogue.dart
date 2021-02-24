import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

import 'package:flare_flutter/flare_actor.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: new FlareActor("assets/riv/flareicon.riv",
//             alignment: Alignment.center,
//             fit: BoxFit.contain,
//             animation: "idle"),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _togglePlay() {
    setState(() => _controller.isActive = !_controller.isActive);
  }

  /// Tracks if the animation is playing by whether controller is running.
  bool get isPlaying => _controller?.isActive ?? false;

  Artboard _riveArtboard;
  RiveAnimationController _controller;
  @override
  void initState() {
    super.initState();

    // Load the animation file from the bundle, note that you could also
    // download this. The RiveFile just expects a list of bytes.
    rootBundle.load('assets/riv/flareicon.riv').then(
      (data) async {
        final file = RiveFile();

        // Load the RiveFile from the binary data.
        if (file.import(data)) {
          // The artboard is the root of the animation and gets drawn in the
          // Rive widget.
          final artboard = file.mainArtboard;
          // Add a controller to play back a known animation on the main/default
          // artboard.We store a reference to it so we can toggle playback.
          artboard.addController(_controller = SimpleAnimation('fmksplash'));
          setState(() => _riveArtboard = artboard);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _riveArtboard == null
            ? Text('empty')
            : Container(
                width: 100,
                height: 100,
                child: Rive(
                  artboard: _riveArtboard,
                ),
              ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _togglePlay,
      //   tooltip: isPlaying ? 'Pause' : 'Play',
      //   child: Icon(
      //     isPlaying ? Icons.pause : Icons.play_arrow,
      //   ),
      // ),
    );
  }
}

popUp() {
  return Get.defaultDialog(
      title: '',
      backgroundColor: Colors.white.withOpacity(0.7),
      radius: 10,
      //custom middle text
      content: Column(
        children: [
          Icon(Icons.airplanemode_active_sharp, color: Colors.red, size: 50),
          SizedBox(height: 40),
          Text(
            'We could not verify your credentials. Please double check and try again',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue[900],
            ),
          )
        ],
      ));
}
