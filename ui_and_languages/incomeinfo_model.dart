
class IncomeinfoModel {
  final String professional_level;
  final String nature_of_job;
  final String department_of_job;
  final String received_walfare_assistance;
  final String walfare_type;
  final String samurdhi_benefit_value;
  final String samurdhi_beneficiary_type;
  final String expenses_category;
  final String has_electricity;
  final double electricity_unit;
  final double electricity_account_number;
  final String loss_of_livelihood;
  final String loss_of_livelihood_type;
  final String required_fuel_type;
  final String  monthly_fuel_amount;
  final String cooking_fuel_type;

  IncomeinfoModel({
    this.professional_level,
    this.nature_of_job,
    this.department_of_job,
    this.received_walfare_assistance,
    this.walfare_type,
    this.samurdhi_benefit_value,
    this.samurdhi_beneficiary_type,
    this.expenses_category,
    this.has_electricity,
    this.electricity_unit,
    this.electricity_account_number,
    this.loss_of_livelihood,
    this.loss_of_livelihood_type,
    this.required_fuel_type,
    this. monthly_fuel_amount,
    this.cooking_fuel_type,
  });

  factory IncomeinfoModel.fromJson(Map<String, dynamic> json) {
    return IncomeinfoModel(
      professional_level: json['professional_level'],;
      nature_of_job: json['nature_of_job'],;
      department_of_job: json['department_of_job'],;
      received_walfare_assistance: json['received_walfare_assistance'],;
      walfare_type: json['walfare_type'],;
      samurdhi_benefit_value: json['samurdhi_benefit_value'],;
      samurdhi_beneficiary_type: json['samurdhi_beneficiary_type'],;
      expenses_category: json['expenses_category'],;
      has_electricity: json['has_electricity'],;
      electricity_unit: json['electricity_unit'],;
      electricity_account_number: json['electricity_account_number'],;
      loss_of_livelihood: json['loss_of_livelihood'],;
      loss_of_livelihood_type: json['loss_of_livelihood_type'],;
      required_fuel_type: json['required_fuel_type'],;
      monthly_fuel_amount: json[' monthly_fuel_amount'],;
      cooking_fuel_type: json['cooking_fuel_type'],;
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'professional_level': professional_level,
      'nature_of_job': nature_of_job,
      'department_of_job': department_of_job,
      'received_walfare_assistance': received_walfare_assistance,
      'walfare_type': walfare_type,
      'samurdhi_benefit_value': samurdhi_benefit_value,
      'samurdhi_beneficiary_type': samurdhi_beneficiary_type,
      'expenses_category': expenses_category,
      'has_electricity': has_electricity,
      'electricity_unit': electricity_unit,
      'electricity_account_number': electricity_account_number,
      'loss_of_livelihood': loss_of_livelihood,
      'loss_of_livelihood_type': loss_of_livelihood_type,
      'required_fuel_type': required_fuel_type,
      ' monthly_fuel_amount':  monthly_fuel_amount,
      'cooking_fuel_type': cooking_fuel_type,
    };
  }

  @override
  String toString() {
    return 'IncomeinfoModel(professional_level: ${professional_level}, nature_of_job: ${nature_of_job}, department_of_job: ${department_of_job}, received_walfare_assistance: ${received_walfare_assistance}, walfare_type: ${walfare_type}, samurdhi_benefit_value: ${samurdhi_benefit_value}, samurdhi_beneficiary_type: ${samurdhi_beneficiary_type}, expenses_category: ${expenses_category}, has_electricity: ${has_electricity}, electricity_unit: ${electricity_unit}, electricity_account_number: ${electricity_account_number}, loss_of_livelihood: ${loss_of_livelihood}, loss_of_livelihood_type: ${loss_of_livelihood_type}, required_fuel_type: ${required_fuel_type},  monthly_fuel_amount: ${ monthly_fuel_amount}, cooking_fuel_type: ${cooking_fuel_type})';
  }
}
