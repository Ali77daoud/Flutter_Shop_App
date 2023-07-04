import 'package:agora_shop/models/Location/get_location_model.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({super.key});

  @override
  State<GoogleMapWidget> createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  LatLng markerLat = const LatLng(0, 0);
  GetLoactionModel getLoactionModel =
      GetLoactionModel(name: '', city: '', state: '', street: '', country: '');
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getHeightInPercent(context, 30),
      child: GoogleMap(
        markers: {
          Marker(
            visible: true,
            onTap: (() {
              print('marker');
            }),
            draggable: true,
            onDragEnd: (LatLng lat) {
              print(lat);
            },
            markerId: const MarkerId('1'),
            position: markerLat,
          )
        },
        onTap: (LatLng lat) async {
          setState(() {
            markerLat = lat;
            print(lat);
          });
          getLoactionModel = await getLocationFromCoordinates(
              markerLat.latitude, markerLat.longitude);
        },
        mapType: MapType.hybrid,
        initialCameraPosition: const CameraPosition(
          target: LatLng(30, 33),
          zoom: 14.5,
        ),
        onMapCreated: (GoogleMapController controller) {
          // gmc = controller;
          setState(() {
            markerLat = LatLng(30, 33);
          });
        },
      ),
    );
  }

  Future<GetLoactionModel> getLocationFromCoordinates(
      double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
          latitude, longitude,
          localeIdentifier: 'en');

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];

        // Access the location information
        String name = placemark.name!;
        String city = placemark.locality!;
        String state = placemark.administrativeArea!;
        String country = placemark.country!;
        String street = placemark.street!;

        // Use the location information as required
        print(
            'Address: name: $name, city: $city, region: $state, counrty: $country, street :$street');
        return GetLoactionModel(
            name: name,
            city: city,
            state: state,
            street: street,
            country: country);
      } else {
        print('No location found');
        throw Exception('No location found');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }
}
