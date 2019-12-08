class Secret {
  final String apiKey;

  Secret({this.apiKey = ""});

  factory Secret.fromJson(Map<String, dynamic> jsonmap) {
    return Secret(apiKey: jsonmap["weather_api_key"]);
  }
}
