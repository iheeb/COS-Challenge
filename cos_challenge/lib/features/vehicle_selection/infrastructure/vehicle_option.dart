class VehicleOption {
  final String make;
  final String model;
  final String containerName;
  final int similarity;
  final String uuid;
  final String? feedback;
  final bool? positiveCustomerFeedback;

  VehicleOption({
    required this.make,
    required this.model,
    required this.containerName,
    required this.similarity,
    required this.uuid,
    required this.feedback,
    required this.positiveCustomerFeedback,
  });

  factory VehicleOption.fromJson(Map<String, dynamic> json) {
    return VehicleOption(
      make: json['make'] ?? 'Unknown',
      model: json['model'] ?? 'Unknown',
      containerName: json['containerName'] ?? '',
      similarity: json['similarity'] ?? 0,
      uuid: json['externalId'] ?? '',
      feedback: json['feedback'],
      positiveCustomerFeedback: json['positiveCustomerFeedback'],
    );
  }
}
