import 'package:flutter/material.dart';
import 'package:stargaze_kyc_sdk/stargaze_kyc_sdk.dart' as kyc_sdk;

class FaceInfoScreen extends StatefulWidget {
  static const tag = 'SplashScreen';

  final kyc_sdk.FaceInfo faceInfo;

  const FaceInfoScreen({super.key, required this.faceInfo});

  @override
  _StepScreenState createState() {
    return _StepScreenState();
  }
}

class _StepScreenState extends State<FaceInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Face Info'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.faceInfo.brightness != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Brightness: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.faceInfo.brightness!.toStringAsFixed(4))
                ],
              ),
            ),
          ],
          if (widget.faceInfo.rotationAngle != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Rotation Angle: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.faceInfo.rotationAngle!.toStringAsFixed(4))
                ],
              ),
            ),
          ],
          if (widget.faceInfo.spoofing != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Spoofing probability: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.faceInfo.spoofing!.probability.toStringAsFixed(4))
                ],
              ),
            ),
          ],
          if (widget.faceInfo.location != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: const Text(
                'Face location:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'top - ${widget.faceInfo.location!.top}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'bottom - ${widget.faceInfo.location!.bottom}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'left - ${widget.faceInfo.location!.left}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'right - ${widget.faceInfo.location!.right}',
              ),
            ),
          ],
          if (widget.faceInfo.landmarks != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: const Text(
                'Face landmarks:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            if (widget.faceInfo.landmarks!.leftEye != null) ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'Left Eye - ${widget.faceInfo.landmarks!.leftEye}',
                ),
              ),
            ],
            if (widget.faceInfo.landmarks!.rightEye != null) ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'Right Eye - ${widget.faceInfo.landmarks!.rightEye}',
                ),
              ),
            ],
            if (widget.faceInfo.landmarks!.nose != null) ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'Nose - ${widget.faceInfo.landmarks!.nose}',
                ),
              ),
            ],
            if (widget.faceInfo.landmarks!.leftMouth != null) ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'Left Mouth - ${widget.faceInfo.landmarks!.leftMouth}',
                ),
              ),
            ],
            if (widget.faceInfo.landmarks!.rightMouth != null) ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, right: 16),
                child: Text(
                  'Right Mouth - ${widget.faceInfo.landmarks!.rightMouth}',
                ),
              ),
            ],
          ],
          if (widget.faceInfo.representation != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: const Text(
                'Representation:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Version - ${widget.faceInfo.representation!.version}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Recommended Threshold - ${widget.faceInfo.representation!.recommendedThreshold.toStringAsFixed(2)}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'Vector Size - ${widget.faceInfo.representation!.vector.length}',
              ),
            ),
          ],
        ],
      ),
    );
  }
}
