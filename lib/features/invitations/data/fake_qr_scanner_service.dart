import '../../../core/demo/demo_ids.dart';
import '../domain/qr_scanner_service.dart';

class FakeQrScannerService implements QrScannerService {
  FakeQrScannerService({QrScanResult? result})
    : _result =
          result ??
          const QrScanResult.scanned(
            'ekubhub://join?code=${DemoIds.merchantInviteCode}',
          );

  final QrScanResult _result;

  @override
  Future<QrScanResult> scanInvitePayload() async {
    return _result;
  }
}
