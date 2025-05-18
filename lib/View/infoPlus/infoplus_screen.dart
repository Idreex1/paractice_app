import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoPlusScreen extends StatefulWidget {
  const InfoPlusScreen({Key? key}) : super(key: key);

  @override
  State<InfoPlusScreen> createState() => _InfoPlusScreenState();
}

class _InfoPlusScreenState extends State<InfoPlusScreen> {
  String _packageInfoText = 'Loading app information...';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getPackageInfo();
  }

  Future<void> _getPackageInfo() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();

      setState(() {
        _packageInfoText = '''
App Information:

App Name : 
 ${packageInfo.appName}
Package :  
 ${packageInfo.packageName}
Version :
 ${packageInfo.version} (${packageInfo.buildNumber})
''';
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _packageInfoText = 'Failed to get package info: $e';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'App Information',
            style: TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          _isLoading
              ? const CircularProgressIndicator(
                  color: Colors.white,
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _packageInfoText,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.white,
                    ),
                  ),
                ),
        ]),
      ),
      backgroundColor: Colors.black,
    );
  }
}
