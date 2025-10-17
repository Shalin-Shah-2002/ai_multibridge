import 'dart:convert';
import 'package:http/http.dart' as http;

class GeminiProvider {
  final String apiKey;
  final String url;

  GeminiProvider({
    required this.apiKey,
    this.url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent",
  });

  Future<String> generateContent(String prompt) async {
    // Gemini uses API key as a query parameter
    final uri = Uri.parse('$url?key=$apiKey');

    final response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "contents": [
          {
            "parts": [
              {"text": prompt},
            ],
          },
        ],
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
        "Failed to generate content: ${response.statusCode} - ${response.body}",
      );
    }
  }
}
