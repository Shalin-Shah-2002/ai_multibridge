import 'package:flutter_test/flutter_test.dart';

import 'package:ai_multibridge/ai_multibridge.dart';

void main() {
  test('config creates with default fallback order', () {
    final config = AIMultiBridgeConfig();
    expect(config.fallbackOrder, ['gemini', 'openai', 'huggingface']);
  });

  test('api handler creates with config', () {
    final config = AIMultiBridgeConfig();
    final handler = AiMultibridgeApiHandler(config: config);
    expect(handler.config, config);
  });
}
