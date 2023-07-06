import 'package:agora_shop/controllers/Map/map_controller.dart';
import 'package:agora_shop/shared/helpers/screen_size_utils.dart';
import 'package:agora_shop/shared/widgets/circle_indecator_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatelessWidget {
  final MapController mapController = Get.find<MapController>();
  GoogleMapWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MapController>(builder: (_) {
      return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: getHeightInPercent(context, 30),
            child: GoogleMap(
              markers: {
                Marker(
                  visible: true,
                  onTap: (() {}),
                  draggable: true,
                  onDragEnd: (LatLng lat) {
                    debugPrint(lat.toString());
                  },
                  markerId: const MarkerId('1'),
                  position: mapController.markerLat,
                )
              },
              onTap: (LatLng lat) async {
                mapController.onTapMap(lat);
              },
              mapType: MapType.hybrid,
              initialCameraPosition: const CameraPosition(
                target: LatLng(33.51302126676489, 36.27364218235016),
                zoom: 14.5,
              ),
              onMapCreated: (GoogleMapController controller) {
                mapController.onCreatMap();
              },
            ),
          ),
          //////////////
          mapController.isMapCircleShown
              ? const CircleIndicatorWidget()
              : Container()
        ],
      );
    });
  }
}
