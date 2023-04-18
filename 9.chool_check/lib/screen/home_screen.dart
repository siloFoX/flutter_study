import "package:flutter/material.dart"
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:geolocator/geolocator.dart";


class HomeScreen extends StatelessWidget {
  static final LatLng companyLatLng = LatLng(
    37.5233273,
    126,921252,
  );
  
  static final Marker marker = Marker(
    markerId : MarkerId("company"),
    position : companyLatLng,
  );
  
  static final Circle circle = Circle(
    circleId : CircleId("choolCheckCircle"),
    center : companyLatLng,
    fillColor : Colors.blue.withOpacity(0.5),
    radius : 100,
    strokeColor : Colors.blue,
    strokeWidth : 1,
  );
  
  const HomeScreen({Key? key}) : super(key : key);
  
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar : renderAppBar(),
      body : Futurebuilder<String>(
        future : checkPermission(),
        builder : (context, snapshot) {
          
          if (!snapshot.hasData && snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child : CircularProgressIndicator(),
            );
          }
          
          if (snapshot.data == "Location Service Access complete") {
            return Column(
              children : [
                Expanded(
                  flex : 2,
                  child : GoogleMap(
                    initialCameraPosition : CameraPosition(
                      target : companyLatLng,
                      zoom : 16,
                    ),
                    myLocationEnabled : true,
                    markers : Set.from([marker]),
                    circles : Set.from([circle]),
                  ),
                ),
                // 교통정리가 필요함
                Expanded(
                  child : Column(
                    mainAxisAlignment : MainAxisAlignment.center,
                    children : [
                      Icon(
                        Icons.timelapse_outlined,
                        color : Colors.blue,
                        size : 50.0,
                      ),
                      const SizedBox(height : 20.0),
                      ElevatedButton(
                        onPressed : () async {
                          final curPosition = await Geolocator.getCurrentPosition();
                          
                          final distance = Geolocator.distanceBetween(
                            curPosition.latitude,
                            curPosition.longitude,
                            companyLatLng.latitude,
                            companyLatLng.longitude,
                          );
                          
                          bool canCheck = distance < 100;
                          
                          showDialog(
                            context : context,
                            builder : (_) {
                              return AlertDialog(
                                title : Text("출근"),
                                content : Text(
                                  canCheck ? "출근을 하시겠습니까?" : "출근할 수 없는 위치입니다.",
                                  actions : [
                                    TextButton(
                                      onPressed : () {
                                        Navigator.of(context).pop(false);
                                        child : Text("Cancel"),
                                        if(canCheck) {
                                          TextButton(
                                            onPressed : () {
                                              Navigator.of(context).pop(true);
                                        child : Text("출근하기"),
                                      },
                                    )
                                        }
                                        
                                      }
                                    ),
                                  ]
                                ),
                              ),
                            },
                          )
                        },
                        child : Text("Check!"),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
          
          return center(
            child : Text(
              snapshot.data.toString(),
            ),
          );
        },
      ),
    );
  }
  
  AppBar renderAppBar() {
    return AppBar(
      centerTitle : true,
      title : Text(
        "Chool_Check"
      style : TextStyle(
        color : Colors.blue,
        fontWeight : FontWeight.w700,
        ),
      ),
      backgroundColor : Colors.white,
    );
  }
  
  Future<String> checkPermission() async {
    final isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    
    if (!isLocationEnabled) 
      return "Please Activate Location service permission";
    
    LocationPermission checkedPermission = await geolocator.checkPermission();
    
    if (checkedPermission == LocationPermission.denied) {
      checkedPermission = await Geolocator.requestPermission();
      
      if (checkedPermission == LocatedPermission.deinied)
        return "Please Activate Location authority";
    }
    
    if (checkedPermission == LocationPermission.deniedForever)
      return "Please Activate Location Authority in Settings";
      
      
    return "Location Service Access complete";
  }
}