import 'package:geolocator/geolocator.dart';

const myApiKey = '9444670a0e9edc344c03200008f95932';

class MyCurrentLocation {
  double latitude;
  double longitude;
  Position position;
  Uri url;
  Uri cityUrl;
  Future <void> getCurrentLocation() async{
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      latitude = position.latitude;
      longitude = position.longitude;
       url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$myApiKey&units=metric');
    }catch(e){
      print(e.toString()+' This is the error');
    }

  }
}