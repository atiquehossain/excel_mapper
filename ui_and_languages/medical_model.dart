
class MedicalModel {
  final String difficulties;
  final int member_disability;
  final String disability;
  final String medical_records;
  final String chronic_illness;
  final int chronic_disease;
  final int kidney_disease;
  final String treatment_hospital_name;
  final int dialysis;
  final String dialysis_report;

  MedicalModel({
    this.difficulties,
    this.member_disability,
    this.disability,
    this.medical_records,
    this.chronic_illness,
    this.chronic_disease,
    this.kidney_disease,
    this.treatment_hospital_name,
    this.dialysis,
    this.dialysis_report,
  });

  factory MedicalModel.fromJson(Map<String, dynamic> json) {
    return MedicalModel(
      difficulties: json['difficulties'],;
      member_disability: json['member_disability'],;
      disability: json['disability'],;
      medical_records: json['medical_records'],;
      chronic_illness: json['chronic_illness'],;
      chronic_disease: json['chronic_disease'],;
      kidney_disease: json['kidney_disease'],;
      treatment_hospital_name: json['treatment_hospital_name'],;
      dialysis: json['dialysis'],;
      dialysis_report: json['dialysis_report'],;
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'difficulties': difficulties,
      'member_disability': member_disability,
      'disability': disability,
      'medical_records': medical_records,
      'chronic_illness': chronic_illness,
      'chronic_disease': chronic_disease,
      'kidney_disease': kidney_disease,
      'treatment_hospital_name': treatment_hospital_name,
      'dialysis': dialysis,
      'dialysis_report': dialysis_report,
    };
  }

  @override
  String toString() {
    return 'MedicalModel(difficulties: ${difficulties}, member_disability: ${member_disability}, disability: ${disability}, medical_records: ${medical_records}, chronic_illness: ${chronic_illness}, chronic_disease: ${chronic_disease}, kidney_disease: ${kidney_disease}, treatment_hospital_name: ${treatment_hospital_name}, dialysis: ${dialysis}, dialysis_report: ${dialysis_report})';
  }
}
