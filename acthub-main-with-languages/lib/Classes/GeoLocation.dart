import 'package:geolocator/geolocator.dart';

class GeoLocation {
  double latitude;
  double longitude;

  Future<bool> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
