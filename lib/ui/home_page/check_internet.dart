import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CheckInternet extends StatefulWidget {
  const CheckInternet({Key? key}) : super(key: key);

  @override
  _CheckInternetState createState() => _CheckInternetState();
}

class _CheckInternetState extends State<CheckInternet> {
  bool hideUi = false;
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event == ConnectivityResult.none) {
        if (mounted) {
          setState(() {
            hideUi = true;
          });
        }
      } else {
        if (mounted) {
          setState(() {
            hideUi = false;
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return hideUi
        ? Icon(
            Icons.wifi_off_outlined,
            color: Colors.red,
          )
        : SizedBox.shrink();
  }
}
