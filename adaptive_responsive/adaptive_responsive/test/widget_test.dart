import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:adaptive_responsive/main.dart';

void main() {
  testWidgets('App loads and shows home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Verifikasi bahwa halaman Home muncul
    expect(find.text('Daftar Kegiatan'), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });
}
