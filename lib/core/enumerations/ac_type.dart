enum AcType { full, half, non }

extension AcTypeExtension on AcType {
  String get displayName {
    switch (this) {
      case AcType.full:
        return 'Full AC';
      case AcType.half:
        return 'Half AC';
      case AcType.non:
        return 'Non AC';
    }
  }

  static AcType fromString(String value) {
    switch (value) {
      case 'Full AC':
        return AcType.full;
      case 'Half AC':
        return AcType.half;
      case 'Non AC':
        return AcType.non;
      default:
        return AcType.full;
    }
  }
}
