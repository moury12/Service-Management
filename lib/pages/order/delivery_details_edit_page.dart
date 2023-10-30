import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DeliveryDetailsEditScreen extends StatefulWidget {
  static const String routeName = '/deliveryDetailsedit';

  const DeliveryDetailsEditScreen({super.key});

  @override
  State<DeliveryDetailsEditScreen> createState() =>
      _DeliveryDetailsEditScreenState();
}

class _DeliveryDetailsEditScreenState extends State<DeliveryDetailsEditScreen> {
  GoogleMapController? googleMapController;
  final LatLng _center = LatLng(23.7272, 90.4093);

  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 11.0)),
    );
  }
}
