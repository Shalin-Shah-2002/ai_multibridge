import 'dart:convert';

class AiMultibridgeResponseParser {
  static String parseGeminiResponse(String responseBody) {
    try {
      final json = jsonDecode(responseBody);
      final candidates = json['candidates'];
      if (candidates != null && candidates.isNotEmpty) {
        final content = candidates[0]['content'];
        if (content != null &&
            content['parts'] != null &&
            content['parts'].isNotEmpty) {
          return content['parts'][0]['text'] ?? '';
        }
      }
      throw Exception('Invalid Gemini response format');
    } catch (e) {
      throw Exception('Failed to parse Gemini response: $e');
    }
  }

  static String parseOpenAIResponse(String responseBody) {
    try {
      final json = jsonDecode(responseBody);
      final choices = json['choices'];
      if (choices != null && choices.isNotEmpty) {
        final message = choices[0]['message'];
        if (message != null && message['content'] != null) {
          return message['content'];
        }
      }
      throw Exception('Invalid OpenAI response format');
    } catch (e) {
      throw Exception('Failed to parse OpenAI response: $e');
    }
  }

  static String parseHuggingFaceResponse(String responseBody) {
    try {
      final json = jsonDecode(responseBody);

      // Handle new OpenAI-compatible format from HuggingFace Router API
      if (json['choices'] != null &&
          json['choices'] is List &&
          json['choices'].isNotEmpty) {
        final choice = json['choices'][0];
        if (choice['message'] != null && choice['message']['content'] != null) {
          return choice['message']['content'];
        }
      }

      // Handle legacy array response (common for old HuggingFace API)
      if (json is List && json.isNotEmpty) {
        final firstItem = json[0];
        if (firstItem['generated_text'] != null) {
          return firstItem['generated_text'];
        }
        if (firstItem['text'] != null) {
          return firstItem['text'];
        }
      }

      // Handle legacy single object response
      if (json['generated_text'] != null) {
        return json['generated_text'];
      }
      if (json['text'] != null) {
        return json['text'];
      }
      if (json['output'] != null) {
        return json['output'];
      }

      throw Exception('Invalid HuggingFace response format');
    } catch (e) {
      throw Exception('Failed to parse HuggingFace response: $e');
    }
  }

  static String parseResponse(String provider, String responseBody) {
    switch (provider.toLowerCase()) {
      case 'gemini':
        return parseGeminiResponse(responseBody);
      case 'openai':
        return parseOpenAIResponse(responseBody);
      case 'huggingface':
        return parseHuggingFaceResponse(responseBody);
      default:
        throw Exception('Unknown provider: $provider');
    }
  }
}
