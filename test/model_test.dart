import 'package:event_db_tester/event_db_tester.dart';
import 'package:test/test.dart';
import 'package:tuple/tuple.dart';
import 'package:vhcsite_models/vhcsite_models.dart';

void main() {
  group('Models', () {
    group('copy', () {
      genericModelTest(models: modelTestCases);
    });
    group('BlogManifest', () {
      test('category', () {
        final manifest1 = BlogManifest()..path = 'Stupendous/Incredible/Insane';
        final manifest2 = BlogManifest()..path = 'amazing/great/cool';

        expect(manifest1.category, 'Incredible');
        expect(manifest2.category, 'great');
        expect(manifest1.convertedPath, ['Stupendous', 'Incredible', 'Insane']);
        expect(manifest2.convertedPath, ['amazing', 'great', 'cool']);
      });
    });
    group('BlogViews', () {
      test('path', () {
        final manifest1 = BlogViews()..path = 'cool';

        expect(manifest1.id, 'BlogViews::cool');
      });
    });
  });
}

final modelTestCases = {
  'BlogManifest': () => Tuple2(
        BlogManifest()
          ..name = 'This is my Blog!'
          ..path = 'This/is/my/name'
          ..uploadDate = DateTime(1990),
        BlogManifest.new,
      ),
  'BlogViews': () => Tuple2(
        BlogViews()
          ..path = 'amazing'
          ..viewCount = 125,
        BlogViews.new,
      ),
};
