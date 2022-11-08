import 'package:flutter/material.dart';
import 'package:stargaze_kyc_sdk/stargaze_kyc_sdk.dart' as kyc_sdk;

class DocumentInfoScreen extends StatefulWidget {
  static const tag = 'SplashScreen';

  final kyc_sdk.DocumentInfo documentInfo;

  const DocumentInfoScreen({super.key, required this.documentInfo});

  @override
  _StepScreenState createState() {
    return _StepScreenState();
  }
}

class _StepScreenState extends State<DocumentInfoScreen> {
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
        ],
      ),
    );
  }
}
