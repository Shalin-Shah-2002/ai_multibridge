# AI Multi-Bridge 🚀

[![pub package](https://img.shields.io/pub/v/ai_multibridge.svg)](https://pub.dev/packages/ai_multibridge)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Flutter package that provides a unified interface to multiple AI providers with automatic fallback support. Built by **Shalin Shah** to make AI integration simple, secure, and reliable for developers of all levels.

## 👨‍💻 About the Author

**Shalin Shah** is a passionate Flutter developer and AI enthusiast who believes in making technology accessible to everyone. With experience in mobile development and AI integration, Shalin created this package to solve the common challenges developers face when integrating multiple AI services.

**Connect with Shalin:**
- 📧 Email: 2002shalin@gmail.com
- 🌐 GitHub: [Shalin-Shah-2002](https://github.com/Shalin-Shah-2002)
- 💼 LinkedIn: [Shalin Shah](https://www.linkedin.com/in/shalin-shah0705/)

## 🤔 Why I Built This

### The Problem
When integrating AI into applications, developers often face several challenges:

1. **Vendor Lock-in**: Being tied to a single AI provider
2. **Reliability Issues**: What happens when your primary AI service is down?
3. **Rate Limiting**: Hitting API limits and having no backup
4. **Complex Integration**: Different APIs have different formats and requirements
5. **Security Concerns**: Managing multiple API keys securely
6. **Beginner Friendly**: AI integration can be overwhelming for new developers

### The Solution
AI Multi-Bridge provides:

- 🔄 **Automatic Fallback**: If one provider fails, automatically try the next
- 🔒 **Secure API Management**: Centralized configuration with best practices
- 🎯 **Beginner Friendly**: Simple API that works out of the box
- 🔧 **Flexible**: Support for multiple providers with easy customization
- 📊 **Production Ready**: Built with reliability and error handling in mind

## ✨ Features

- **Multiple AI Providers**: Support for Gemini, OpenAI, and HuggingFace
- **Automatic Fallback**: Seamless switching between providers when one fails
- **Secure Configuration**: Best practices for API key management
- **Response Parsing**: Clean, parsed responses from any provider
- **Error Handling**: Graceful failure handling with detailed error messages
- **Logging Support**: Built-in logging for debugging and monitoring
- **Beginner Friendly**: Simple API that's easy to understand and use

## 🚀 Quick Start

### 1. Add the Package

Add `ai_multibridge` to your `pubspec.yaml`:

```yaml
dependencies:
  ai_multibridge: ^1.0.0
```

### 2. Basic Usage

```dart
import 'package:ai_multibridge/ai_multibridge.dart';

void main() async {
  // Configure your AI providers
  final config = AIMultiBridgeConfig(
    geminiKey: 'your-gemini-api-key',
    openAIKey: 'your-openai-api-key',
    huggingFaceKey: 'your-huggingface-api-key',
    fallbackOrder: ['gemini', 'openai', 'huggingface'],
  );

  // Create the handler
  final handler = AiMultibridgeApiHandler(config: config);

  // Generate AI content
  try {
    final response = await handler.generateText('Hello, how are you?');
    print('AI Response: $response');
  } catch (e) {
    print('Error: $e');
  }
}
```

## 🔑 Getting API Keys

### 🤖 Gemini (Google AI) - FREE TIER AVAILABLE

**Step-by-step guide:**

1. **Visit Google AI Studio**
   - Go to [Google AI Studio](https://makersuite.google.com/app/apikey)
   - Sign in with your Google account

2. **Create API Key**
   - Click "Create API Key" button
   - Select your Google Cloud project (or create a new one)
   - Choose "Create API key in new project" for beginners

3. **Copy Your Key**
   - Your API key will look like: `AIzaSyBpxCG8uwNR-kF-L-Gzl3X-J7e1tNdoIyw`
   - **Important**: Save this key securely - you won't be able to see it again!

4. **Free Tier Limits**
   - 15 requests per minute
   - 1 million tokens per day
   - Perfect for development and testing

---

### 🧠 OpenAI - PAID SERVICE

**Step-by-step guide:**

1. **Visit OpenAI Platform**
   - Go to [OpenAI Platform](https://platform.openai.com/api-keys)
   - Sign up or log in to your OpenAI account

2. **Add Payment Method**
   - Go to [Billing](https://platform.openai.com/account/billing)
   - Add a credit card or payment method
   - **Note**: You need to add at least $5 credit to use the API

3. **Create API Key**
   - Go to [API Keys](https://platform.openai.com/api-keys)
   - Click "Create new secret key"
   - Give it a name (e.g., "Flutter App")
   - Copy the key (starts with `sk-...`)

4. **Pricing (as of 2024)**
   - GPT-3.5-turbo: ~$0.002 per 1K tokens
   - GPT-4: ~$0.03 per 1K tokens

---

### 🤗 HuggingFace - FREE & PAID OPTIONS

**Step-by-step guide:**

1. **Create HuggingFace Account**
   - Go to [HuggingFace](https://huggingface.co/join)
   - Sign up for a free account

2. **Create API Token**
   - Go to [Settings > Access Tokens](https://huggingface.co/settings/tokens)
   - Click "New token"
   - **IMPORTANT**: Select "Write" role (not "Read")
   - Give it a name (e.g., "AI Multi-Bridge")
   - Click "Generate a token"

3. **Copy Your Token**
   - Your token will look like: `hf_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
   - **Important**: Save this token securely!

4. **Free vs Paid**
   - **Free**: Limited requests, basic models
   - **Paid**: More requests, access to premium models

---

### 🎯 Which API Key Do I Need?

**For beginners, start with:**

1. **Gemini** (Recommended first choice)
   - ✅ Completely free
   - ✅ Easy to set up
   - ✅ Good quality responses
   - ✅ No credit card required

2. **HuggingFace** (Second choice)
   - ✅ Free tier available
   - ✅ Many open-source models
   - ✅ Good for experimentation

3. **OpenAI** (When you need premium quality)
   - 💰 Requires payment setup
   - ✅ Highest quality responses
   - ✅ Most reliable service

### 💡 Pro Tips for API Keys

- **Start with Gemini**: It's free and works great for most use cases
- **Test with one provider first**: Don't get all keys at once
- **Use environment variables**: Never hardcode keys in your app
- **Monitor usage**: Keep track of your API usage to avoid unexpected charges
- **Rotate keys regularly**: Change your API keys periodically for security

## 🛡️ Security Best Practices

### For Beginners: Safe API Key Management

**❌ NEVER do this:**
```dart
// DON'T hardcode API keys in your code
final config = AIMultiBridgeConfig(
  geminiKey: 'AIzaSyBpxCG8uwNR-kF-L-Gzl3X-J7e1tNdoIyw', // EXPOSED!
);
```

**✅ DO this instead:**

#### Option 1: Environment Variables (Recommended)
```dart
import 'dart:io';

void main() async {
  final config = AIMultiBridgeConfig(
    geminiKey: Platform.environment['GEMINI_API_KEY'],
    openAIKey: Platform.environment['OPENAI_API_KEY'],
    huggingFaceKey: Platform.environment['HF_API_KEY'],
  );
}
```

#### Option 2: Secure Storage
```dart
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureConfig {
  static final _storage = FlutterSecureStorage();
  
  static Future<AIMultiBridgeConfig> getConfig() async {
    return AIMultiBridgeConfig(
      geminiKey: await _storage.read(key: 'gemini_key'),
      openAIKey: await _storage.read(key: 'openai_key'),
      huggingFaceKey: await _storage.read(key: 'hf_key'),
    );
  }
}
```

#### Option 3: Server-Side Proxy (Most Secure)
```dart
// Call your own backend API instead of AI providers directly
final response = await http.post(
  Uri.parse('https://your-backend.com/api/ai/generate'),
  headers: {'Authorization': 'Bearer $userToken'},
  body: jsonEncode({'prompt': userPrompt}),
);
```

## 📚 Advanced Usage

### Custom Fallback Order

```dart
final config = AIMultiBridgeConfig(
  geminiKey: 'your-key',
  openAIKey: 'your-key',
  huggingFaceKey: 'your-key',
  fallbackOrder: ['openai', 'gemini', 'huggingface'], // Custom order
);
```

### Custom Model URLs

```dart
final config = AIMultiBridgeConfig(
  geminiKey: 'your-key',
  openAIKey: 'your-key',
  huggingFaceKey: 'your-key',
  // Use custom models
  geminiUrl: 'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro',
  openAIUrl: 'https://api.openai.com/v1/chat/completions',
  huggingFaceUrl: 'https://router.huggingface.co/v1',
);
```

### Response Parsing

```dart
final rawResponse = await handler.generateText('Hello');
final parsedResponse = AiMultibridgeResponseParser.parseResponse('gemini', rawResponse);
print('Clean text: $parsedResponse');
```

### Logging

```dart
// Enable logging for debugging
AiMultibridgeLogger.info('Starting AI request');
AiMultibridgeLogger.error('Provider failed', error);
```

## 🔄 How Fallback Works

1. **Primary Provider**: Tries the first provider in your fallback order
2. **Automatic Switch**: If it fails, automatically tries the next provider
3. **Graceful Failure**: If all providers fail, throws a clear error message
4. **Transparent**: Your app doesn't need to know which provider responded

```dart
// With this configuration:
fallbackOrder: ['gemini', 'openai', 'huggingface']

// The flow is:
// 1. Try Gemini → Success ✅ (Use response)
// 2. Try Gemini → Fail ❌ → Try OpenAI → Success ✅ (Use response)
// 3. Try Gemini → Fail ❌ → Try OpenAI → Fail ❌ → Try HuggingFace → Success ✅
// 4. All fail → Throw exception with helpful message
```

## 🧪 Testing

The package includes comprehensive tests and examples:

```bash
# Run tests
flutter test

# Run example
dart run example/test_example.dart
```

## 📋 Requirements

- Dart >=3.0.0
- Flutter >=3.0.0

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Google AI** for Gemini API
- **OpenAI** for their powerful language models
- **HuggingFace** for democratizing AI access
- **Flutter Team** for the amazing framework
- **Community** for feedback and contributions

## 📞 Support

If you encounter any issues or have questions:

1. **Check the [Issues](https://github.com/your-username/ai_multibridge/issues)** page
2. **Create a new issue** with detailed information
3. **Contact Shalin** at 2002shalin@gmail.com

## 🎯 Roadmap

- [ ] Support for more AI providers (Claude, Cohere, etc.)
- [ ] Streaming responses
- [ ] Custom retry logic
- [ ] Response caching
- [ ] Usage analytics
- [ ] Web support

---

**Made with ❤️ by Shalin Shah**

*Empowering developers to build amazing AI-powered applications with confidence and ease.*