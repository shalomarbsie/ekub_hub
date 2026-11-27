enum QrScanStatus {
  scanned,
  cancelled,
  permissionDenied,
  permissionPermanentlyDenied,
  unavailable,
}

class QrScanResult {
  const QrScanResult({required this.status, this.payload});

  const QrScanResult.scanned(String payload)
    : this(status: QrScanStatus.scanned, payload: payload);

  const QrScanResult.cancelled() : this(status: QrScanStatus.cancelled);

  const QrScanResult.permissionDenied()
    : this(status: QrScanStatus.permissionDenied);

  const QrScanResult.permissionPermanentlyDenied()
    : this(status: QrScanStatus.permissionPermanentlyDenied);

  const QrScanResult.unavailable() : this(status: QrScanStatus.unavailable);

  final QrScanStatus status;
  final String? payload;
}

abstract interface class QrScannerService {
  Future<QrScanResult> scanInvitePayload();
}
