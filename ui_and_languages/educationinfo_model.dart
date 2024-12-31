
class EducationinfoModel {
  final String current_education;
  final String higher_education;

  EducationinfoModel({
    this.current_education,
    this.higher_education,
  });

  factory EducationinfoModel.fromJson(Map<String, dynamic> json) {
    return EducationinfoModel(
      current_education: json['current_education'],;
      higher_education: json['higher_education'],;
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'current_education': current_education,
      'higher_education': higher_education,
    };
  }

  @override
  String toString() {
    return 'EducationinfoModel(current_education: ${current_education}, higher_education: ${higher_education})';
  }
}
