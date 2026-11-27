import 'package:ekub_hub/core/demo/demo_ids.dart';
import 'package:ekub_hub/features/auth/presentation/providers/session_provider.dart';
import 'package:ekub_hub/features/invitations/data/fake_qr_scanner_service.dart';
import 'package:ekub_hub/features/invitations/domain/qr_scanner_service.dart';
import 'package:ekub_hub/features/invitations/presentation/join_equb_screen.dart';
import 'package:ekub_hub/features/invitations/presentation/providers/join_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

class _JoinScreenHarness extends ConsumerStatefulWidget {
  const _JoinScreenHarness();

  @override
  ConsumerState<_JoinScreenHarness> createState() => _JoinScreenHarnessState();
}

class _JoinScreenHarnessState extends ConsumerState<_JoinScreenHarness> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        ref.read(sessionProvider.notifier).signInAsDemo(DemoIds.prospectUserId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: JoinEqubScreen()));
  }
}

void main() {
  testWidgets('scans, previews Equb, requests to join, and validates errors', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          qrScannerServiceProvider.overrideWithValue(FakeQrScannerService()),
        ],
        child: const _JoinScreenHarness(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('scan-button')));
    await tester.pumpAndSettle();
    final inviteField = tester.widget<TextField>(
      find.byKey(const Key('invite-code-field')),
    );
    expect(inviteField.controller?.text, DemoIds.merchantInviteCode);
    expect(find.byKey(const Key('equb-preview-card')), findsOneWidget);
    expect(find.text('Merchant Equb'), findsOneWidget);

    await tester.tap(find.byKey(const Key('request-join-button')));
    await tester.pumpAndSettle();
    expect(find.text('Pending approval'), findsOneWidget);

    await tester.enterText(
      find.byKey(const Key('invite-code-field')),
      'ZZZZZZ',
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('equb-preview-card')), findsNothing);

    await tester.tap(find.byKey(const Key('request-join-button')));
    await tester.pumpAndSettle();
    expect(
      find.text('No Equb was found for that invite code.'),
      findsOneWidget,
    );
  });

  testWidgets('permissionDenied shows fallback message and allows manual entry', (
    tester,
  ) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          qrScannerServiceProvider.overrideWithValue(
            FakeQrScannerService(
              result: const QrScanResult.permissionDenied(),
            ),
          ),
        ],
        child: const _JoinScreenHarness(),
      ),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.byKey(const Key('scan-button')));
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('scan-status')), findsOneWidget);
    expect(
      find.textContaining('Camera permission is needed'),
      findsOneWidget,
    );

    await tester.enterText(
      find.byKey(const Key('invite-code-field')),
      DemoIds.merchantInviteCode,
    );
    await tester.pumpAndSettle();
    expect(find.byKey(const Key('equb-preview-card')), findsOneWidget);

    await tester.tap(find.byKey(const Key('request-join-button')));
    await tester.pumpAndSettle();
    expect(find.text('Pending approval'), findsOneWidget);
  });
}
