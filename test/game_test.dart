import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_sapan_atisi/oyun_sapan_atisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(sapanConfig.title.length, 33);
    expect(sapanConfig.tagline.length, 33);
    for (final s in sapanConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir ve bot tarafından geçilir', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(sapanRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: sapanId, optionalMechanics: sapanRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(sapanRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
