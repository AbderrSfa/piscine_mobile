import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp_proj/pages/home.dart';
import 'package:geolocator/geolocator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        home: const HomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  String location = '';
  bool geolocationPermError = false;

  void setLocation(String input) {
    location = input;
    geolocationPermError = false;
    notifyListeners();
  }

  void setGeolocationPermError(bool value) {
    geolocationPermError = value;
    notifyListeners();
  }

  Future<int> getGeoPermission() async {
    bool geoEnabled = false;
    geoEnabled = await Geolocator.isLocationServiceEnabled();
    if (!geoEnabled) {
      setGeolocationPermError(true);
      return -1;
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        setGeolocationPermError(true);
        return -1;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      setGeolocationPermError(true);
      return -1;
    }
    return 0;
  }

  void getGeolocation() async {
    if (await getGeoPermission() == -1) return;
    Position geolocation = await Geolocator.getCurrentPosition();
    setLocation(geolocation.toString());
  }
}

void main() {
  runApp(const MyApp());
}
