class TransactionTypeModel {
  final int? id;
  final String? name;
  final String? code;
  final String? action;
  final String? thumbnail;

  const TransactionTypeModel({
    this.id,
    this.name,
    this.action,
    this.code,
    this.thumbnail,
  });

  factory TransactionTypeModel.fromJson(Map<String, dynamic> json) =>
      TransactionTypeModel(
        id: json['id'],
        name: json['name'],
        action: json['action'],
        code: json['code'],
        thumbnail: json['thumbnail'],
      );
}
