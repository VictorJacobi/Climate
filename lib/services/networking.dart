import 'package:http/http.dart' as http;

class NetworkingHttpControl {
  Uri url;
  dynamic getData(url) async {
    http.Response response = await http.get(url);
if (response.statusCode==200) {
  var myOnlineData = response.body;
  return myOnlineData;
}else{
  print(response.statusCode);
}

  }

}
