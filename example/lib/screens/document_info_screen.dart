import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stargaze_kyc_sdk/stargaze_kyc_sdk.dart' as kyc_sdk;

class DocumentInfoScreen extends StatefulWidget {
  static const tag = 'SplashScreen';

  final kyc_sdk.KycSdk kycSdk;
  final kyc_sdk.DocumentInfo documentInfo;

  const DocumentInfoScreen({
    super.key,
    required this.kycSdk,
    required this.documentInfo,
  });

  @override
  _StepScreenState createState() {
    return _StepScreenState();
  }
}

class _StepScreenState extends State<DocumentInfoScreen> {
  final _picker = ImagePicker();

  ScreenStatus _screenStatus = ScreenStatus.content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Document Info'),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: _buildContent(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Check with Face'),
              if (_screenStatus == ScreenStatus.contentFaceCheckProgress) ...[
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  width: 16,
                  height: 16,
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                ),
              ],
            ],
          ),
          onPressed: () {
            if (_screenStatus != ScreenStatus.contentFaceCheckProgress) {
              _checkWithFace();
            }
          },
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
          if (widget.documentInfo.brightness != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: Row(
                children: [
                  const Text(
                    'Brightness: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(widget.documentInfo.brightness!.toStringAsFixed(4))
                ],
              ),
            ),
          ],
          if (widget.documentInfo.content != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: const Text(
                'Document image:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: widget.documentInfo.content,
            ),
          ],
          if (widget.documentInfo.face != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.all(16),
              child: const Text(
                'Face position:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'top - ${widget.documentInfo.face!.top}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'bottom - ${widget.documentInfo.face!.bottom}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'left - ${widget.documentInfo.face!.left}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                'right - ${widget.documentInfo.face!.right}',
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: const Text(
                'Face image:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: widget.documentInfo.face!.content,
            ),
          ],
          if (widget.documentInfo.fields != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: const Text(
                'Fields:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            for (final item in widget.documentInfo.fields!) ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.key}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        '${item.value} (${item.confidence.toStringAsFixed(4)})',
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
          if (widget.documentInfo.mrzFields != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: const Text(
                'MRZ Fields:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            for (final item in widget.documentInfo.mrzFields!) ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${item.key}: ',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      child: Text(
                        '${item.value} (${item.confidence.toStringAsFixed(4)})',
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
          if (widget.documentInfo.mrzStrings != null) ...[
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, top: 16, right: 16),
              child: const Text(
                'MRZ Strings:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            for (final item in widget.documentInfo.mrzStrings!) ...[
              Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${item.value} (${item.confidence.toStringAsFixed(4)})',
                        maxLines: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
          const SizedBox(height: 48),
        ],
      ),
    );
  }

  Future<void> _checkWithFace() async {
    final XFile? image = await _takePhoto();

    if (image != null) {
      setState(() {
        _screenStatus = ScreenStatus.contentFaceCheckProgress;
      });

      widget.kycSdk.checkPersonFromDocument(documentInfo: widget.documentInfo, faceFile: File(image.path)).then((value) {
        if (value) {
          _showToast('SUCCESS: Face matches photo on document');
        } else {
          _showToast('FAIL: Face not matches photo on document');
        }
      }).onError((error, stackTrace) {
        _showToast('Error: $error');
      }).whenComplete(() {
        setState(() {
          _screenStatus = ScreenStatus.content;
        });
      });
    }
  }

  void _showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }

  Future<XFile?> _takePhoto() async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 2,
            itemBuilder: (context, index) {
              if (index == 1) {
                return Container(
                  margin: const EdgeInsets.only(left: 16, top: 8, right: 16, bottom: 16),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Select File'),
                        ],
                      ),
                      onPressed: () async {
                        final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                        Navigator.pop(context, image);
                      },
                    ),
                  ),
                );
              } else {
                return Container(
                  margin: const EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: ElevatedButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Make a photo'),
                        ],
                      ),
                      onPressed: () async {
                        final XFile? image = await _picker.pickImage(source: ImageSource.camera);
                        Navigator.pop(context, image);
                      },
                    ),
                  ),
                );
              }
            },
          ),
        );
      },
    );
  }
}

enum ScreenStatus {
  content,
  contentFaceCheckProgress,
}
