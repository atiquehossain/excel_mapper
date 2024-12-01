
class IncomeinfoModel {
  final int professional_level;
  final int nature_of_job;
  final int department_of_job;
  final int received_walfare_assistance;
  final int walfare_type;
  final int samurdhi_beneficiary_type;
  final String samurdhi_benefit_value;
  final double expenses_category;
  final int has_electricity;
  final String fuel_cooking;
  final double electricity_unit;
  final double electricity_account_number;
  final int loss_of_livelihood;
  final int loss_of_livelihood_type;
  final int required_fuel_type;

  IncomeinfoModel({
    this.professional_level,
    this.nature_of_job,
    this.department_of_job,
    this.received_walfare_assistance,
    this.walfare_type,
    this.samurdhi_beneficiary_type,
    this.samurdhi_benefit_value,
    this.expenses_category,
    this.has_electricity,
    this.fuel_cooking,
    this.electricity_unit,
    this.electricity_account_number,
    this.loss_of_livelihood,
    this.loss_of_livelihood_type,
    this.required_fuel_type,
  });

  factory IncomeinfoModel.fromJson(Map<String, dynamic> json) {
    return IncomeinfoModel(
      professional_level: json['professional_level'],;
      nature_of_job: json['nature_of_job'],;
      department_of_job: json['department_of_job'],;
      received_walfare_assistance: json['received_walfare_assistance'],;
      walfare_type: json['walfare_type'],;
      samurdhi_beneficiary_type: json['samurdhi_beneficiary_type'],;
      samurdhi_benefit_value: json['samurdhi_benefit_value'],;
      expenses_category: json['expenses_category'],;
      has_electricity: json['has_electricity'],;
      fuel_cooking: json['fuel_cooking'],;
      electricity_unit: json['electricity_unit'],;
      electricity_account_number: json['electricity_account_number'],;
      loss_of_livelihood: json['loss_of_livelihood'],;
      loss_of_livelihood_type: json['loss_of_livelihood_type'],;
      required_fuel_type: json['required_fuel_type'],;
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'professional_level': professional_level,
      'nature_of_job': nature_of_job,
      'department_of_job': department_of_job,
      'received_walfare_assistance': received_walfare_assistance,
      'walfare_type': walfare_type,
      'samurdhi_beneficiary_type': samurdhi_beneficiary_type,
      'samurdhi_benefit_value': samurdhi_benefit_value,
      'expenses_category': expenses_category,
      'has_electricity': has_electricity,
      'fuel_cooking': fuel_cooking,
      'electricity_unit': electricity_unit,
      'electricity_account_number': electricity_account_number,
      'loss_of_livelihood': loss_of_livelihood,
      'loss_of_livelihood_type': loss_of_livelihood_type,
      'required_fuel_type': required_fuel_type,
    };
  }

  @override
  String toString() {
    return 'IncomeinfoModel(professional_level: ${professional_level}, nature_of_job: ${nature_of_job}, department_of_job: ${department_of_job}, received_walfare_assistance: ${received_walfare_assistance}, walfare_type: ${walfare_type}, samurdhi_beneficiary_type: ${samurdhi_beneficiary_type}, samurdhi_benefit_value: ${samurdhi_benefit_value}, expenses_category: ${expenses_category}, has_electricity: ${has_electricity}, fuel_cooking: ${fuel_cooking}, electricity_unit: ${electricity_unit}, electricity_account_number: ${electricity_account_number}, loss_of_livelihood: ${loss_of_livelihood}, loss_of_livelihood_type: ${loss_of_livelihood_type}, required_fuel_type: ${required_fuel_type})';
  }
}
