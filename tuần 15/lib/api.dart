import 'dart:convert';
import 'package:http/http.dart' as http;

String token =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhcGlrZXkiOiI1ZTZlNDVlYS1hNGIzLTQ2MGMtOWY0Yy01ZTg2NjEyMTBjNGUiLCJwZXJtaXNzaW9ucyI6WyJhbGxvd19qb2luIl0sImlhdCI6MTY1MzkxOTg2NywiZXhwIjoxNjU0NTI0NjY3fQ.jWHbzZiOFkB0Xt3cYHy3RX1o8kaKFOsVVweuy-FnQuk";

Future<String> createMeeting() async {
  final http.Response httpResponse = await http.post(
    Uri.parse("https://api.videosdk.live/v1/meetings"),
    headers: {'Authorization': token},
  );

  return json.decode(httpResponse.body)['meetingId'];
}
