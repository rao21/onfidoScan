import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_onfido/flutter_onfido.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> init() async {
    try {
      final exampleSdkToken =
          "eyJhbGciOiJFUzUxMiJ9.eyJleHAiOjE2MjY2OTM4NDcsInBheWxvYWQiOnsiYXBwIjoiYTA0NTRmZmUtNzFiOC00OWQyLTk0MDItNzgzMjAwYTliMTRlIiwiY2xpZW50X3V1aWQiOiIyOWIyODE0Yi1kMTk2LTQ3OTYtYmY4Zi1hMDdlNWU1YzZhN2QiLCJhcHBsaWNhdGlvbl9pZCI6ImNvLnhwZW5jZS5hbHBoYTIiLCJpc19zYW5kYm94Ijp0cnVlfSwidXVpZCI6InUtc2U4VXFURU9yIiwidXJscyI6eyJ0ZWxlcGhvbnlfdXJsIjoiaHR0cHM6Ly90ZWxlcGhvbnkub25maWRvLmNvbSIsImRldGVjdF9kb2N1bWVudF91cmwiOiJodHRwczovL3Nkay5vbmZpZG8uY29tIiwic3luY191cmwiOiJodHRwczovL3N5bmMub25maWRvLmNvbSIsImhvc3RlZF9zZGtfdXJsIjoiaHR0cHM6Ly9pZC5vbmZpZG8uY29tIiwiYXV0aF91cmwiOiJodHRwczovL2FwaS5vbmZpZG8uY29tIiwib25maWRvX2FwaV91cmwiOiJodHRwczovL2FwaS5vbmZpZG8uY29tIn19.MIGHAkEtXFIJJWBpNe1Ab7RPAT7JxxSgck-zXhlJ60V9VUCGsUEBJ0EBfD4YBXXM3wasGcHMJQSL1I1ZOv4h9j2uCnsWUQJCAXj4xyEw4mTv6uoeF9a6WL0JZluppTXyR0Imd1rFBrkb0jK3vsDM93NXNNk7WZ4pdB6D6FYMlnhf44SiOoYe0Law";
      final result = await FlutterOnfido.start(
        config: OnfidoConfig(
          sdkToken:
              // PROVIDE SDK TOKEN YOU'VE GOT FROM YOUR BACKEND
              exampleSdkToken,
          flowSteps: OnfidoFlowSteps(
            welcome: true,
            captureDocument: OnfidoCaptureDocumentStep(
              countryCode: OnfidoCountryCode.PAK,
              docType: OnfidoDocumentType.PASSPORT,
            ),
            captureFace: OnfidoCaptureFaceStep(OnfidoCaptureType.PHOTO),
          ),
        ),
      );
      print(result);
      // ASK YOUR BACKEND IF USER HAS PASSED VERIFICATION
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: init,
                child: Text('start'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
