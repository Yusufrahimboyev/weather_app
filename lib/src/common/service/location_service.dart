import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart' as loc;

class LocationService {
  Future<String> currentCityName() async {
    loc.Location location = loc.Location();

    bool serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        throw Exception('Location service is disabled');
      }
    }

    loc.PermissionStatus permissionGranted = await location.hasPermission();
    if (permissionGranted == loc.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != loc.PermissionStatus.granted) {
        throw Exception('Location permission denied');
      }
    }

    final loc.LocationData locationData = await location.getLocation();
    final lat = locationData.latitude;
    final lng = locationData.longitude;
    if (lat == null || lng == null) {
      throw Exception('Error');
    }

    final placemarks = await placemarkFromCoordinates(lat, lng);
    if (placemarks.isEmpty) {
      throw Exception('Error');
    }
    final locality = placemarks.first.locality;
    if (locality == null || locality.isEmpty) {
      throw Exception('not Find place');
    }
    return locality;
  }
}
