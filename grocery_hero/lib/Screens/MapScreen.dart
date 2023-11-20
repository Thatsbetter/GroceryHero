import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_hero/Helper/MainTheme.dart';
import 'package:grocery_hero/Helper/flutter_flow_google_map.dart';
import 'package:permission_handler/permission_handler.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  Set<Marker> markers = Set();

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
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional(0.00, 0.00),
            child:GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(13.106061, -59.613158),
                zoom: 15,
              ),
              markers: markers,
              onMapCreated: (controller) {
                googleMapsController.complete(controller);
              },
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.11, -0.86),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.8,
              height: MediaQuery.sizeOf(context).height * 0.07,
              decoration: BoxDecoration(
                color: Color(0xFFFAECE4),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Color(0x33000000),
                    offset: Offset(0, 2),
                  )
                ],
                borderRadius: BorderRadius.circular(15),
                shape: BoxShape.rectangle,
              ),
              child: Align(
                alignment: AlignmentDirectional(0.00, 0.00),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                  child: Text(
                    'Shopping lists around you',
                    textAlign: TextAlign.center,
                    style: MainTheme.of(context).bodySmall.override(
                          fontFamily: 'Lexend Deca',
                          color: MainTheme.of(context).black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.83, 0.92),
            child: GestureDetector(
              onTap: () {
                _goToMyLocation(); // For example, you can call the _goToMyLocation method
              },
              child: Container(
                width: MediaQuery.sizeOf(context).width * 0.16,
                height: MediaQuery.sizeOf(context).width * 0.16,
                decoration: BoxDecoration(
                  color: Color(0xFF479AD1),
                  shape: BoxShape.circle,
                ),
                child: Align(
                  alignment: AlignmentDirectional(0.00, 0.00),
                  child: FaIcon(
                    FontAwesomeIcons.locationDot,
                    color: MainTheme.of(context).primaryBtnText,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToMyLocation() async {
    var status = await Permission.location.request();
    if (status == PermissionStatus.granted) {
      final GoogleMapController controller = await googleMapsController.future;
      final LatLng myLocation = await getCurrentLocation();

      if (myLocation != null) {
        controller.animateCamera(CameraUpdate.newLatLng(myLocation));
      } else {
        print("Unable to get current location.");
      }
    } else {
      print("Location permission denied");
    }
  }

  Future<LatLng> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition();
    return LatLng(position.latitude, position.longitude);
  }
}
