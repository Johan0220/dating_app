import 'package:dating_app/config/http_client.dart';
import 'package:dio/dio.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'main_screen.dart';

class FindingScreen extends StatefulWidget {
  @override
  _FindingScreenState createState() => _FindingScreenState();
}

class _FindingScreenState extends State<FindingScreen> {
  Location location = Location();
  LocationData? _locationData;

  @override
  void initState() {
    super.initState();
    retrieveLocation();
  }

  Future<void> _updateLocation(String url, int id, double? latitude, double? longitude) async {
    if (latitude == null || longitude == null) {
      print('not found');
      return null;
    }
    Map<String, dynamic> data = {
      "id": id,
      "latitude": latitude,
      "longitude": longitude
    };
    try {
      Response response = await dio.put(
        url,
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );
      if (response.statusCode == 200) {
        PersistentNavBarNavigator.pushNewScreen(context, screen: MyScreen());
      } else {
        throw Exception('Failed to update data.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> retrieveLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        SystemNavigator.pop();
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        SystemNavigator.pop();
        return;
      }
    }

    _locationData = await location.getLocation();
    _updateLocation('http://10.0.2.2:8080/public/profile/update/user', 1, _locationData?.latitude, _locationData?.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Hiển thị màn hình khởi động ở đây
      ),
    );
  }
}