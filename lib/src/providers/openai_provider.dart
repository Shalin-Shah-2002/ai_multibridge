import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenAIProvider {
  final String apiKey;
  final String url;

  OpenAIProvider({
    required this.apiKey,
    this.url = "https://api.openai.com/v1/chat/completions",
  });

  Future<String> generateContent(String prompt) async {
    final response = await http.post(
      Uri.parse(url),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "gpt-3.5-turbo",
        "messages": [
          {"role": "user", "content": prompt},
        ],
      }),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("Failed to generate content");
    }
  }
}
