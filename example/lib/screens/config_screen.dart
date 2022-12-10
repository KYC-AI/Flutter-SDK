import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kyc/general/constants.dart';
import 'package:kyc/screens/document_info_screen.dart';
import 'package:kyc/screens/face_info_screen.dart';
import 'package:stargaze_kyc_sdk/stargaze_kyc_sdk.dart' as kyc_sdk;

class ConfigScreen extends StatefulWidget {
  static const tag = 'SplashScreen';

  @override
  _ConfigScreenState createState() {
    return _ConfigScreenState();
  }
}

class _ConfigScreenState extends State<ConfigScreen> {
  kyc_sdk.Config _config = kyc_sdk.Config(apiToken: Constants.apiToken, server: Constants.server);
  late final kyc_sdk.KycSdk _kycSdk;

  final _serverController = TextEditingController();
  final _urlFocusNode = FocusNode();
  final _apiTokenController = TextEditingController();
  final _applicantFocusNode = FocusNode();
  final _picker = ImagePicker();

  ScreenStatus _screenStatus = ScreenStatus.config;

  @override
  void initState() {
    super.initState();
    _serverController.text = _config.server;
    _apiTokenController.text = _config.apiToken;
  }

  @override
  Widget build(BuildContext context) {
    switch (_screenStatus) {
      case ScreenStatus.config:
      case ScreenStatus.configInProgress:
        return _buildConnect();
      case ScreenStatus.content:
      case ScreenStatus.contentInProgress:
        return _buildContent();
    }
  }

  Widget _buildConnect() {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: const Text(
                  'Please fill next fields to be able use KYCAI',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 8),
                child: const Text('KYCAI server url:'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: CupertinoTextField(
                  controller: _serverController,
                  focusNode: _urlFocusNode,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 8),
                child: const Text('KYCAI api token:'),
              ),
              Container(
                margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                child: CupertinoTextField(
                  controller: _apiTokenController,
                  focusNode: _applicantFocusNode,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Connect'),
              if (_screenStatus == ScreenStatus.configInProgress) ...[
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
            if (_screenStatus != ScreenStatus.configInProgress) {
              _connect();
            }
          },
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: const Text(
                      'Please select action',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 48, right: 8, bottom: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Check USA Passport Card page 1'),
                          ],
                        ),
                        onPressed: () {
                          if (_screenStatus == ScreenStatus.content) {
                            _checkUsaPassportCardPage1();
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 48, right: 8, bottom: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Check UA ID card page 1'),
                          ],
                        ),
                        onPressed: () {
                          if (_screenStatus == ScreenStatus.content) {
                            _checkUaIdCardPage1();
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Check UA ID card page 2'),
                          ],
                        ),
                        onPressed: () {
                          if (_screenStatus == ScreenStatus.content) {
                            _checkUaIdCardPage2();
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 8, right: 8, bottom: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Check UA Foreign Passport'),
                          ],
                        ),
                        onPressed: () {
                          if (_screenStatus == ScreenStatus.content) {
                            _checkUaForeignPassport();
                          }
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 8, top: 48, right: 8, bottom: 8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: ElevatedButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Check Face'),
                          ],
                        ),
                        onPressed: () {
                          if (_screenStatus == ScreenStatus.content) {
                            _checkFace();
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (_screenStatus == ScreenStatus.contentInProgress) ...[
              Container(
                color: Colors.black.withOpacity(0.5),
                child: const Center(
                  child: SizedBox(
                    width: 46,
                    height: 46,
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 2,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Future<void> _connect() async {
    setState(() {
      _screenStatus = ScreenStatus.configInProgress;
    });

    _urlFocusNode.unfocus();
    _applicantFocusNode.unfocus();

    _config = kyc_sdk.Config(apiToken: _apiTokenController.text, server: _serverController.text);

    _kycSdk = kyc_sdk.KycSdk(config: _config);
    await _kycSdk.initialize().then((value) {
      setState(() {
        _screenStatus = ScreenStatus.content;
      });
    }).onError((error, stackTrace) {
      _showToast('Error during SDK initialization');
      setState(() {
        _screenStatus = ScreenStatus.config;
      });
    });
  }

  Future<void> _checkUaForeignPassport() async {
    final XFile? image = await _takePhoto();

    if (image != null) {
      setState(() {
        _screenStatus = ScreenStatus.contentInProgress;
      });

      _kycSdk.getDocumentInfo(documentCode: kyc_sdk.DocumentType.uaForeignPassport, page: 1, documentFile: File(image.path)).then((value) {
        _openDocumentInfo(value);
      }).onError((error, stackTrace) {
        _showToast('Error: $error');
      }).whenComplete(() {
        setState(() {
          _screenStatus = ScreenStatus.content;
        });
      });
    }
  }

  Future<void> _checkUsaPassportCardPage1() async {
    final XFile? image = await _takePhoto();

    if (image != null) {
      setState(() {
        _screenStatus = ScreenStatus.contentInProgress;
      });

      _kycSdk.getDocumentInfo(documentCode: kyc_sdk.DocumentType.usaPassportCard, page: 1, documentFile: File(image.path)).then((value) {
        _openDocumentInfo(value);
      }).onError((error, stackTrace) {
        _showToast('Error: $error');
      }).whenComplete(() {
        setState(() {
          _screenStatus = ScreenStatus.content;
        });
      });
    }
  }

  Future<void> _checkUaIdCardPage1() async {
    final XFile? image = await _takePhoto();

    if (image != null) {
      setState(() {
        _screenStatus = ScreenStatus.contentInProgress;
      });

      _kycSdk.getDocumentInfo(documentCode: kyc_sdk.DocumentType.uaIdCard, page: 1, documentFile: File(image.path)).then((value) {
        _openDocumentInfo(value);
      }).onError((error, stackTrace) {
        _showToast('Error: $error');
      }).whenComplete(() {
        setState(() {
          _screenStatus = ScreenStatus.content;
        });
      });
    }
  }

  Future<void> _checkUaIdCardPage2() async {
    final XFile? image = await _takePhoto();

    if (image != null) {
      setState(() {
        _screenStatus = ScreenStatus.contentInProgress;
      });

      _kycSdk.getDocumentInfo(documentCode: kyc_sdk.DocumentType.uaIdCard, page: 2, documentFile: File(image.path)).then((value) {
        _openDocumentInfo(value);
      }).onError((error, stackTrace) {
        _showToast('Error: $error');
      }).whenComplete(() {
        setState(() {
          _screenStatus = ScreenStatus.content;
        });
      });
    }
  }

  Future<void> _checkFace() async {
    final XFile? image = await _takePhoto();

    if (image != null) {
      setState(() {
        _screenStatus = ScreenStatus.contentInProgress;
      });

      _kycSdk.getFaceInfo(faceFile: File(image.path)).then((value) {
        _openFaceInfo(value);
      }).onError((error, stackTrace) {
        _showToast('Error: $error');
      }).whenComplete(() {
        setState(() {
          _screenStatus = ScreenStatus.content;
        });
      });
    }
  }

  void _openFaceInfo(kyc_sdk.FaceInfo info) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FaceInfoScreen(faceInfo: info),
      ),
    );
  }

  void _openDocumentInfo(kyc_sdk.DocumentInfo info) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => DocumentInfoScreen(kycSdk: _kycSdk, documentInfo: info),
      ),
    );
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
  config,
  configInProgress,
  content,
  contentInProgress,
}
