import 'config.dart';
import 'providers/gemini_provider.dart';
import 'providers/huggingface_provider.dart';
import 'providers/openai_provider.dart';

class AiMultibridgeApiHandler {
  final AIMultiBridgeConfig config;

  AiMultibridgeApiHandler({required this.config});

  Future<String> generateText(String prompt) async {
    for (final providerName in config.fallbackOrder) {
      try {
        switch (providerName) {
          case 'gemini':
            if (config.geminiKey != null) {
              return await GeminiProvider(
                apiKey: config.geminiKey!,
                url:
                    config.geminiUrl ??
                    "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent",
              ).generateContent(prompt);
            }
            break;
          case 'openai':
            if (config.openAIKey != null) {
              return await OpenAIProvider(
                apiKey: config.openAIKey!,
                url:
                    config.openAIUrl ??
                    "https://api.openai.com/v1/chat/completions",
              ).generateContent(prompt);
            }
            break;
          case 'huggingface':
            if (config.huggingFaceKey != null) {
              return await HuggingFaceProvider(
                apiKey: config.huggingFaceKey!,
                url:
                    config.huggingFaceUrl ?? "https://router.huggingface.co/v1",
              ).generateContent(prompt);
            }
            break;
        }
      } catch (e) {
        print('$providerName failed: $e');
        continue;
      }
    }
    throw Exception('All providers failed.');
  }
}
