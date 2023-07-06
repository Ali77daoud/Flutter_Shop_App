import 'package:agora_shop/models/Location/get_location_model.dart';
import 'package:agora_shop/shared/widgets/snackbar_widgets.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapController extends GetxController {
  LatLng markerLat = const LatLng(0, 0);
  bool isMapCircleShown = false;
  GetLoactionModel getLoactionModel =
      GetLoactionModel(name: '', city: '', state: '', street: '', country: '');

  final TextEditingController nameKey = TextEditingController();
  final TextEditingController cityKey = TextEditingController();
  final TextEditingController regionKey = TextEditingController();
  final TextEditingController strKey = TextEditingController();

  // ///////////////////////////
  void showMapCircleIndicator() {
    isMapCircleShown = true;
    update();
  }

  void hideMapCircleIndicator() {
    isMapCircleShown = false;
    update();
  }

  void onTapMap(LatLng lat) async {
    markerLat = lat;
    debugPrint(lat.toString());
    getLoactionModel = await getLocationFromCoordinates(
        markerLat.latitude, markerLat.longitude);
    nameKey.text = getLoactionModel.name;
    cityKey.text = getLoactionModel.city;
    regionKey.text = getLoactionModel.state;
    strKey.text = getLoactionModel.street;
    update();
  }

  void onCreatMap() {
    markerLat = const LatLng(33.51302126676489, 36.27364218235016);
    update();
  }

  @override
  void onInit() {
    super.onInit();
    nameKey.text = getLoactionModel.name;
    cityKey.text = getLoactionModel.city;
    regionKey.text = getLoactionModel.state;
    strKey.text = getLoactionModel.street;
  }

  Future<GetLoactionModel> getLocationFromCoordinates(
      double latitude, double longitude) async {
    showMapCircleIndicator();
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          latitude, longitude,
          localeIdentifier: 'en');

      if (placemarks.isNotEmpty) {
        hideMapCircleIndicator();
        Placemark placemark = placemarks[0];

        String name = placemark.name!;
        String city = placemark.locality!;
        String state = placemark.administrativeArea!;
        String country = placemark.country!;
        String street = placemark.street!;

        debugPrint(
            'Address: name: $name, city: $city, region: $state, counrty: $country, street :$street');
        return GetLoactionModel(
            name: name,
            city: city,
            state: state,
            street: street,
            country: country);
      } else {
        debugPrint('No location found');
        hideMapCircleIndicator();
        SnackBarWidgets.showFailureSnackBar(
            'Unexpected error', 'No location found');
        throw Exception('No location found');
      }
    } catch (e) {
      debugPrint('Error: $e');
      hideMapCircleIndicator();
      SnackBarWidgets.showFailureSnackBar('Unexpected error', 'Error: $e');
      throw Exception('Error: $e');
    }
  }
}
