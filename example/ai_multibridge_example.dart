import 'package:ai_multibridge/ai_multibridge.dart';

/// Example usage of AI Multi-Bridge package
/// 
/// This example demonstrates how to use the AI Multi-Bridge package
/// with multiple AI providers and automatic fallback.
void main() async {
  // Configure your AI providers
  // Replace with your actual API keys
  final config = AIMultiBridgeConfig(
    // Get your Gemini API key from: https://makersuite.google.com/app/apikey
    geminiKey: 'YOUR_GEMINI_API_KEY_HERE',
    
    // Get your OpenAI API key from: https://platform.openai.com/api-keys
    openAIKey: 'YOUR_OPENAI_API_KEY_HERE',
    
    // Get your HuggingFace token from: https://huggingface.co/settings/tokens
    huggingFaceKey: 'YOUR_HUGGINGFACE_TOKEN_HERE',
    
    // Define fallback order (tries providers in this sequence)
    fallbackOrder: ['gemini', 'openai', 'huggingface'],
  );

  // Create the AI handler
  final handler = AiMultibridgeApiHandler(config: config);

  try {
    print('🚀 Testing AI Multi-Bridge Package...');
    print('📝 This will try providers in order: ${config.fallbackOrder.join(' → ')}');
    print('');

    // Generate AI content
    final response = await handler.generateText('Hello, how are you?');

    print('✅ Success! AI Response received:');
    print('📄 Raw Response: $response');
    
    // Parse the response to get clean text
    final parsedResponse = AiMultibridgeResponseParser.parseResponse('gemini', response);
    print('🧹 Clean Response: $parsedResponse');
    
  } catch (e) {
    print('❌ Error: $e');
    print('');
    print('💡 Troubleshooting tips:');
    print('1. Make sure you have valid API keys');
    print('2. Check your internet connection');
    print('3. Verify API key permissions');
    print('4. Check the README.md for detailed setup instructions');
  }
}

/// Example of using individual providers
void individualProviderExample() async {
  // Using Gemini provider directly
  final geminiProvider = GeminiProvider(
    apiKey: 'YOUR_GEMINI_API_KEY',
  );
  
  try {
    final response = await geminiProvider.generateContent('Hello from Gemini!');
    print('Gemini response: $response');
  } catch (e) {
    print('Gemini error: $e');
  }
  
  // Using HuggingFace provider directly
  final hfProvider = HuggingFaceProvider(
    apiKey: 'YOUR_HF_TOKEN',
  );
  
  try {
    final response = await hfProvider.generateContent('Hello from HuggingFace!');
    print('HuggingFace response: $response');
  } catch (e) {
    print('HuggingFace error: $e');
  }
}

/// Example of custom configuration
void customConfigExample() {
  // Custom fallback order
  final customConfig = AIMultiBridgeConfig(
    geminiKey: 'YOUR_GEMINI_KEY',
    openAIKey: 'YOUR_OPENAI_KEY',
    huggingFaceKey: 'YOUR_HF_KEY',
    fallbackOrder: ['openai', 'gemini'], // Only use OpenAI and Gemini
  );
  
  // Custom URLs for specific models
  final advancedConfig = AIMultiBridgeConfig(
    geminiKey: 'YOUR_GEMINI_KEY',
    openAIKey: 'YOUR_OPENAI_KEY',
    huggingFaceKey: 'YOUR_HF_KEY',
    geminiUrl: 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro',
    openAIUrl: 'https://api.openai.com/v1/chat/completions',
    huggingFaceUrl: 'https://router.huggingface.co/v1',
    fallbackOrder: ['gemini', 'openai', 'huggingface'],
  );
}
