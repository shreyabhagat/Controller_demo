import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ControllerDemo extends StatefulWidget {
  const ControllerDemo({Key? key}) : super(key: key);

  @override
  _MapDemoState createState() => _MapDemoState();
}

class _MapDemoState extends State<ControllerDemo> {
  //
  late GoogleMapController mapController;
  LatLng yavatmalLocation = LatLng(20.3899, 78.1307);
  LatLng puneLocation = LatLng(18.5204, 73.8567);

  //
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(title: Text('Map Demo')),
      body: Stack(
        children: [
          //1
          GoogleMap(
            //
            initialCameraPosition: CameraPosition(
              //
              target: yavatmalLocation,
              zoom: 10,
            ),

            //
            onMapCreated: (mapController) {
              this.mapController = mapController;
            },
          ),

          // 2
          Align(
            alignment: Alignment.topRight,
            child: Column(
              children: [
                //
                TextButton(
                  child: CircleAvatar(
                    backgroundColor: Colors.green.shade300,
                    child: Text(
                      'Y',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    getMap(yavatmalLocation);
                  },
                ),

                //
                TextButton(
                  child: CircleAvatar(
                    backgroundColor: Colors.green.shade300,
                    child: Text(
                      'P',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () {
                    getMap(puneLocation);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void getMap(LatLng newLocation) async {
    // await mapController.moveCamera(
    //   CameraUpdate.newLatLng(newLocation),
    // );

    await mapController.animateCamera(
      CameraUpdate.newLatLng(newLocation),
    );

    setState(() {
      //
    });
  }
}
