import 'dart:async';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ff_55/services/firebase_functions.dart';
import 'package:ff_55/styles/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

//const LatLng currentLocation = LatLng(41.0063, 28.9000);

class GoHome extends StatefulWidget {
  const GoHome({super.key});
  static String route = "/goHome";

  @override
  State<GoHome> createState() => _GoHomeState();
}

class _GoHomeState extends State<GoHome> {
  Completer<GoogleMapController> myMapController = Completer();

static const  LatLng sourceLocation = LatLng(41.0063, 28.9000);
static const  LatLng destinationLocation = LatLng(41.0001, 28.9000);



@override
  void initState() {
    getPolyPoints();
    getCurrentLocation();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.mainThemeColor,
        title: const Text('Evim'),
      ),
      body: currentLocation == null 
      ? const Center(child: Text("Loading"),)
       :Stack(
        children: [GoogleMap(
          initialCameraPosition: CameraPosition(
            target: sourceLocation,
            zoom: 14,
          ),
          polylines: {
            Polyline(polylineId: const PolylineId("route"),
            points: polylineCoordinates,
            color: Utils.secondaryColor,
            width: 5
            ),
          },

          markers: {
            const Marker(markerId: MarkerId("source",),
            position: sourceLocation,
            ),

           const Marker(markerId: MarkerId("destination",),
            position: destinationLocation,
            ),

             Marker(markerId: const MarkerId("currentLocation",),
            position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
            ),

            

          },
        ),
        
        
        
        ]
      ),
    );
  }


  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates("AIzaSyDCvxSoHew4svGymNivzza2C-vItltE_k4",
     PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
     PointLatLng(destinationLocation.latitude, destinationLocation.longitude),
     //PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!),
     );

     if (result.points.isNotEmpty) {
       result.points.forEach((PointLatLng point)=> polylineCoordinates.add(LatLng(point.latitude, 
       point.longitude),
       ),);
       setState(() {});
     }
  }

LocationData? currentLocation;
void getCurrentLocation(){
  Location location = Location();

location.getLocation().then((location) {
  currentLocation = location;
});


}









}