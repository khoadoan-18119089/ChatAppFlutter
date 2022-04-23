import 'dart:convert';

import 'package:chat_messanger_ui/model/model_mess.dart';

import '../controller/apiconstant.dart';
import 'package:http/http.dart' as http;


Future getdata() async {
  var url = ApiConstant().baseUrl + ApiConstant().readData;
  var response = await http.get(Uri.parse(url));
  var data = jsonDecode(response.body);
  //var id = data['id'];
  //var postHeader = data['post_header'];
  //var postBody = data['post_body'];
  //print(data.toString());
  return data;
  //print(postHeader.toString());
  //print(post
  //Body.toString());
}

Future<ModelMess> fetchAlbum() async {
  final response =
      await http.get(Uri.parse(ApiConstant().baseUrl + ApiConstant().readData));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ModelMess.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
  
}
