import 'package:flutter/material.dart';
import 'camera_screen.dart';
import 'package:camera/camera.dart';

class RoomsScreen extends StatefulWidget {
  const RoomsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RoomsScreenState createState() => _RoomsScreenState();
}

class _RoomsScreenState extends State<RoomsScreen> {
  List<String> rooms = ["Room 101", "Room 102", "Room 103"];
  late List<CameraDescription> _cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rooms Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: rooms.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(rooms[index]),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () async {
                if (_cameras.isNotEmpty) {
                  final imagePath = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CameraScreen(_cameras),
                    ),
                  );
                  if (imagePath != null) {
                    _addNewRoom(imagePath);
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Add New Room'),
            ),
          ),
        ],
      ),
    );
  }

  void _addNewRoom(String imagePath) {
    setState(() {
      rooms.add('Room with image: $imagePath');
    });
  }
}
