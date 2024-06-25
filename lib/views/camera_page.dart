import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:video_player/video_player.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network('http://192.168.0.26/stream')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> updateServo(int servo, String direction) async {
    final url = 'http://192.168.0.11/moveServo?servo=$servo&direction=$direction';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print('Servo updated: $direction');
    } else {
      print('Failed to update servo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ESP32 Surveillance Camera'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: _controller.value.isInitialized
                    ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
                    : CircularProgressIndicator(),
              ),
              Text('Camera Feed', style: TextStyle(fontSize: 24)),
              SizedBox(height: 20),
              servoControl('Pan - S1', FontAwesomeIcons.arrowLeft, FontAwesomeIcons.arrowRight, 1),
              servoControl('Tilt - S2', FontAwesomeIcons.arrowUp, FontAwesomeIcons.arrowDown, 2),
              SizedBox(height: 20),
              Text('©2024 AgriTechVision'),
            ],
          ),
        ),
      ),
    );
  }

  Widget servoControl(String title, IconData leftIcon, IconData rightIcon, int servo) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 20)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () => updateServo(servo, 'left'),
              icon: FaIcon(leftIcon),
              label: Text('Left'),
            ),
            ElevatedButton.icon(
              onPressed: () => updateServo(servo, 'right'),
              icon: FaIcon(rightIcon),
              label: Text('Right'),
            ),
          ],
        ),
      ],
    );
  }
}
