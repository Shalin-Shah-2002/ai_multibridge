import 'dart:convert';
import 'package:http/http.dart' as http;

class HuggingFaceProvider {
  final String apiKey;
  final String url;

  HuggingFaceProvider({
    required this.apiKey,
    this.url = "https://router.huggingface.co/v1",
  });

  Future<String> generateContent(String prompt) async {
    final response = await http.post(
      Uri.parse("$url/chat/completions"),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "openai/gpt-oss-120b:novita", // Default model
        "messages": [
          {"role": "user", "content": prompt},
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
