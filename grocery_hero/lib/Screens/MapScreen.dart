import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:grocery_hero/Helper/MainTheme.dart';
import 'package:grocery_hero/Helper/flutter_flow_google_map.dart';
import 'package:grocery_hero/Screens/ShowShoppingItems.dart';

class MapScreenWidget extends StatefulWidget {
  const MapScreenWidget({Key? key}) : super(key: key);

  @override
  _MapScreenWidgetState createState() => _MapScreenWidgetState();
}

class _MapScreenWidgetState extends State<MapScreenWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  Set<Marker> markers = Set();

  void _onMarkerTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShowShoppingItems(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
          markerId: MarkerId("1"),
          position: LatLng(13.106061, -59.613158),
          onTap: _onMarkerTapped),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 1,
        decoration: BoxDecoration(
          color: MainTheme.of(context).secondaryBackground,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: Image.asset(
              'assets/images/Group_6821.png',
            ).image,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(0),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: MainTheme.of(context).sigmaX,
              sigmaY: MainTheme.of(context).sigmaY,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Colors.white.withOpacity(0.5),
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 44, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding:
                              EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Hello',
                                    style: MainTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Lexend Deca',
                                      color: MainTheme.of(context).black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        4, 0, 0, 0),
                                    child: Text(
                                      '[Name]',
                                      style: MainTheme.of(context)
                                          .displaySmall
                                          .override(
                                        fontFamily: 'Lexend Deca',
                                        color: MainTheme.of(context).black,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 4, 0, 0),
                                  child: Text(
                                    'Here are Shopping Lists near you',
                                    textAlign: TextAlign.center,
                                    style: MainTheme.of(context)
                                        .bodyText1
                                        .override(
                                      fontFamily: 'Lexend Deca',
                                      color: MainTheme.of(context).black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: GoogleMap(
                      initialCameraPosition: const CameraPosition(
                        target: LatLng(13.106061, -59.613158),
                        zoom: 15,
                      ),
                      markers: markers,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}