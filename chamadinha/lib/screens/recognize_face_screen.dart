
// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:google_ml_vision/google_ml_vision.dart';

class RecognizeFaceScreen extends StatefulWidget {
  final CameraDescription camera;

  RecognizeFaceScreen({required this.camera});

  @override
  _RecognizeFaceScreenState createState() => _RecognizeFaceScreenState();
}

class _RecognizeFaceScreenState extends State<RecognizeFaceScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isDetecting = false;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _detectFaces() async {
    await _initializeControllerFuture;

    _controller.startImageStream((CameraImage image) async {
      if (_isDetecting) return;
      _isDetecting = true;

      final GoogleVisionImage visionImage =
          GoogleVisionImage.fromBytes(image.planes[0].bytes, _buildMetaData(image));
      final FaceDetector faceDetector = GoogleVision.instance.faceDetector();

      final List<Face> faces = await faceDetector.processImage(visionImage);

      if (faces.isNotEmpty) {
        // Lógica para detectar rostos e marcar presença
      }

      _isDetecting = false;
    });
  }

  GoogleVisionImageMetadata _buildMetaData(CameraImage image) {
    return GoogleVisionImageMetadata(
      size: Size(image.width.toDouble(), image.height.toDouble()),
      rotation: ImageRotation.rotation0,
      rawFormat: image.format.raw,
      planeData: image.planes.map((plane) {
        return GoogleVisionImagePlaneMetadata(
          bytesPerRow: plane.bytesPerRow,
          height: plane.height,
          width: plane.width,
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reconhecimento Facial')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _detectFaces,
        child: Icon(Icons.camera),
      ),
    );
  }
}
