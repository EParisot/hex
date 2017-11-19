import 'package:hexview/hexview.dart';
import 'package:test/test.dart';

void main() {
  group('Record16', () {
    setUp(() {});

    test('General', () {
      final rec = new Record16(16, new List<int>.generate(16, (i) => i));
      expect(rec.length, 16);
      expect(rec.startAddress, 16);
      expect(rec.endAddress, 31);
      for (int i = 16; i < 32; i++) {
        expect(rec[i], i - 16);
      }
    });

    test('With offset', () {
      final rec1 = new Record16(48, new List<int>.generate(16, (i) => i + 48));
      final rec = rec1.withOffset(16);
      expect(rec.length, 16);
      expect(rec.startAddress, 64);
      expect(rec.endAddress, 79);
      for (int i = 0; i < 16; i++) {
        expect(rec[i + 64], i + 48);
      }
    });

    test('Misaligned', () {
	    expect(() {
		    new Record16(17, new List<int>.generate(16, (i) => i));
	    }, throwsA(new isInstanceOf<Exception>()));
    });

    test('Mis length', () {
	    expect(() {
		    new Record16(16, new List<int>.generate(15, (i) => i));
	    }, throwsA(new isInstanceOf<Exception>()));
    });
  });
}
