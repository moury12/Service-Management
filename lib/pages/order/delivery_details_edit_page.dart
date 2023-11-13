import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryDetailsEditScreen extends StatefulWidget {
  static const String routeName = '/deliveryDetailsedit';

  // final Position position;

  const DeliveryDetailsEditScreen({
    super.key,
  });

  @override
  State<DeliveryDetailsEditScreen> createState() =>
      _DeliveryDetailsEditScreenState();
}

class _DeliveryDetailsEditScreenState extends State<DeliveryDetailsEditScreen> {
  GoogleMapController? googleMapController;
  final LatLng _center = LatLng(23.7272, 90.4093);
  Set<Marker> markers = {};

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  void dispose() {
    googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          markers: markers,
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 14.0)),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            Position position = await determinedPosition();
            googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
                CameraPosition(
                    target: LatLng(position.latitude, position.longitude),
                    zoom: 14)));
            markers.clear();
            markers.add(Marker(
                markerId: MarkerId('current Location'),
                position: LatLng(position.latitude, position.longitude)));
            setState(() {});
          },
          label: Text('Current location')),
    );
  }

  Future<Position> determinedPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('error');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Forever Denied');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
