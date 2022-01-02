import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/location.dart';



class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getOnlineData();
  }

  void getOnlineData() async{
    MyLocationData data = MyLocationData();
    var myOnlineData = await data.getOnlineDataByLatAndLong();
    Navigator.push(context, MaterialPageRoute(
        builder: (context){
          return LocationScreen(myPassedData: myOnlineData);
        }
    ),);
  }
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          size: 60,
          color: Colors.white,

        ),
      ),
    );
  }
}
