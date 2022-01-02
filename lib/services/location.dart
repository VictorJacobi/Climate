import 'package:clima/location_brain.dart';
import 'networking.dart';

NetworkingHttpControl myNetwork =NetworkingHttpControl();

class MyLocationData extends MyCurrentLocation{
var myOnlineData;


  Future<dynamic> getOnlineDataByLatAndLong() async{// every other thing outside of this function will keep working aside the function itself
    await getCurrentLocation();// the function will run synchronously with respect to itself
  myOnlineData = await myNetwork.getData(url);// go to location_brain for the url
  return myOnlineData;
  }
Future<dynamic> getOnlineDataByCityName(String result) async{// every other thing outside of this function will keep working aside the function itself
  cityUrl  = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$result&appid=$myApiKey&units=metric');
  myOnlineData = await myNetwork.getData(cityUrl);
  //print(cityUrl.toString()+'this is the city url');
  return myOnlineData;
}
}





