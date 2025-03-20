class SuwarModel {
  final int id;
  final String name;
  final int startPage;
  final int endPage;
  final int makkia;
  final int type;

  SuwarModel({
    required this.id,
    required this.name,
    required this.startPage,
    required this.endPage,
    required this.makkia,
    required this.type,
  });

  factory SuwarModel.fromJson(json) {
    return SuwarModel(
      id: json['id'],
      name: json['name'],
      startPage: json['start_page'],
      endPage: json['end_page'],
      makkia: json['makkia'],
      type: json['type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'start_page': startPage,
      'end_page': endPage,
      'makkia': makkia,
      'type': type,
    };
  }
}
