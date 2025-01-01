static const String cooking_fuel_type = "cooking_fuel_type";
static const String department_of_job = "department_of_job";
static const String expenses_category = "expenses_category";
static const String loss_of_livelihood_type = "loss_of_livelihood_type";
static const String nature_of_job = "nature_of_job";
static const String professional_level = "professional_level";
static const String samurdhi_beneficiary_type = "samurdhi_beneficiary_type";
static const String walfare_type = "walfare_type";
else if (modelName == SetupConstant.cooking_fuel_type) {
  items.add(SetupModel(Languages.getText(context)!.firewood_cooking_fuel_type, "1"));
  items.add(SetupModel(Languages.getText(context)!.kerosene_oil_cooking_fuel_type, "2"));
  items.add(SetupModel(Languages.getText(context)!.gas_cooking_fuel_type, "3"));
  items.add(SetupModel(Languages.getText(context)!.electricity_cooking_fuel_type, "4"));
  items.add(SetupModel(Languages.getText(context)!.other_cooking_fuel_type, "5"));
}

else if (modelName == SetupConstant.department_of_job) {
  items.add(SetupModel(Languages.getText(context)!.farming_department_of_job, "1"));
  items.add(SetupModel(Languages.getText(context)!.fisheries_department_of_job, "2"));
  items.add(SetupModel(Languages.getText(context)!.livestock_department_of_job, "3"));
  items.add(SetupModel(Languages.getText(context)!.handicrafts_department_of_job, "4"));
  items.add(SetupModel(Languages.getText(context)!.textile_industry_department_of_job, "5"));
  items.add(SetupModel(Languages.getText(context)!.plantation_department_of_job, "6"));
  items.add(SetupModel(Languages.getText(context)!.mining_and_excavation_department_of_job, "7"));
  items.add(SetupModel(Languages.getText(context)!.labourer_department_of_job, "8"));
  items.add(SetupModel(Languages.getText(context)!.minor_export_crops_department_of_job, "9"));
  items.add(SetupModel(Languages.getText(context)!.construction_department_of_job, "10"));
  items.add(SetupModel(Languages.getText(context)!.carpentry_department_of_job, "11"));
  items.add(SetupModel(Languages.getText(context)!.trading_department_of_job, "12"));
  items.add(SetupModel(Languages.getText(context)!.transport_department_of_job, "13"));
  items.add(SetupModel(Languages.getText(context)!.technical_department_of_job, "14"));
  items.add(SetupModel(Languages.getText(context)!.retired_department_of_job, "15"));
  items.add(SetupModel(Languages.getText(context)!.government_employer_department_of_job, "16"));
  items.add(SetupModel(Languages.getText(context)!.student_department_of_job, "17"));
  items.add(SetupModel(Languages.getText(context)!.other_department_of_job, "18"));
  items.add(SetupModel(Languages.getText(context)!.small_business_department_of_job, "19"));
}

else if (modelName == SetupConstant.expenses_category) {
  items.add(SetupModel(Languages.getText(context)!.food_and_drinks_expenses_category, "1"));
  items.add(SetupModel(Languages.getText(context)!.water_expenses_category, "2"));
  items.add(SetupModel(Languages.getText(context)!.cloths_expenses_category, "3"));
  items.add(SetupModel(Languages.getText(context)!.medicine_for_health_expenses_category, "4"));
  items.add(SetupModel(Languages.getText(context)!.housing_if_stay_in_rented_house__expenses_category, "5"));
  items.add(SetupModel(Languages.getText(context)!.personal_needs_expenses_category, "6"));
  items.add(SetupModel(Languages.getText(context)!.transport_travelling_expenses_expenses_category, "7"));
  items.add(SetupModel(Languages.getText(context)!.electricity_expenses_category, "8"));
  items.add(SetupModel(Languages.getText(context)!.fuel_including_gas_kerosene_expenses_category, "9"));
  items.add(SetupModel(Languages.getText(context)!.telephone_mobile_and_fixed_line_expenses_expenses_category, "10"));
  items.add(SetupModel(Languages.getText(context)!.education_expenses_expenses_category, "11"));
  items.add(SetupModel(Languages.getText(context)!.for_sports_entertainment_and_religious_activities_expenses_category, "12"));
  items.add(SetupModel(Languages.getText(context)!.other_expenses_including_loan_lease_mortgage__expenses_category, "13"));
}

else if (modelName == SetupConstant.loss_of_livelihood_type) {
  items.add(SetupModel(Languages.getText(context)!.agriculture_loss_of_livelihood_type, "1"));
  items.add(SetupModel(Languages.getText(context)!.fisheries_loss_of_livelihood_type, "2"));
  items.add(SetupModel(Languages.getText(context)!.livestock_loss_of_livelihood_type, "3"));
  items.add(SetupModel(Languages.getText(context)!.handicraft_loss_of_livelihood_type, "4"));
  items.add(SetupModel(Languages.getText(context)!.textile_industry_loss_of_livelihood_type, "5"));
  items.add(SetupModel(Languages.getText(context)!.plantation_loss_of_livelihood_type, "6"));
  items.add(SetupModel(Languages.getText(context)!.mining_and_excavation_loss_of_livelihood_type, "7"));
  items.add(SetupModel(Languages.getText(context)!.labourer_loss_of_livelihood_type, "8"));
  items.add(SetupModel(Languages.getText(context)!.minot_export_crops_loss_of_livelihood_type, "9"));
  items.add(SetupModel(Languages.getText(context)!.construction_loss_of_livelihood_type, "10"));
  items.add(SetupModel(Languages.getText(context)!.carpentry_masonry_loss_of_livelihood_type, "11"));
  items.add(SetupModel(Languages.getText(context)!.trade_loss_of_livelihood_type, "12"));
  items.add(SetupModel(Languages.getText(context)!.transport_loss_of_livelihood_type, "13"));
  items.add(SetupModel(Languages.getText(context)!.technical_loss_of_livelihood_type, "14"));
  items.add(SetupModel(Languages.getText(context)!.service_sector_loss_of_livelihood_type, "15"));
  items.add(SetupModel(Languages.getText(context)!.other_loss_of_livelihood_type, "16"));
}

else if (modelName == SetupConstant.nature_of_job) {
  items.add(SetupModel(Languages.getText(context)!.no_economic_activities_nature_of_job, "1"));
  items.add(SetupModel(Languages.getText(context)!.government_employee_nature_of_job, "2"));
  items.add(SetupModel(Languages.getText(context)!.semi_government_employee_nature_of_job, "3"));
  items.add(SetupModel(Languages.getText(context)!.employer_nature_of_job, "4"));
  items.add(SetupModel(Languages.getText(context)!.engages_in_his_own_economic_activity_nature_of_job, "5"));
  items.add(SetupModel(Languages.getText(context)!.laborer_nature_of_job, "6"));
  items.add(SetupModel(Languages.getText(context)!.contributing_to_a_family_business_nature_of_job, "7"));
  items.add(SetupModel(Languages.getText(context)!.private_sector_employee_nature_of_job, "8"));
  items.add(SetupModel(Languages.getText(context)!.retired_employee_nature_of_job, "9"));
  items.add(SetupModel(Languages.getText(context)!.expecting_a_job_nature_of_job, "10"));
  items.add(SetupModel(Languages.getText(context)!.migrant_worker_nature_of_job, "11"));
}

else if (modelName == SetupConstant.professional_level) {
  items.add(SetupModel(Languages.getText(context)!.nvq_3_g_c_e_o_l_conformity_status__professional_level, "1"));
  items.add(SetupModel(Languages.getText(context)!.nvq_3_g_c_e_a_l_conformity_status__professional_level, "2"));
  items.add(SetupModel(Languages.getText(context)!.nvq_5_diploma_level__professional_level, "3"));
  items.add(SetupModel(Languages.getText(context)!.nvq_6_higher_diploma_level__professional_level, "4"));
  items.add(SetupModel(Languages.getText(context)!.nvq_7_degree_level__professional_level, "5"));
  items.add(SetupModel(Languages.getText(context)!.non_nvq_professional_level, "6"));
  items.add(SetupModel(Languages.getText(context)!.unknown_professional_level, "7"));
}

else if (modelName == SetupConstant.samurdhi_beneficiary_type) {
  items.add(SetupModel(Languages.getText(context)!.420_samurdhi_beneficiary_type, "1"));
  items.add(SetupModel(Languages.getText(context)!.1900_samurdhi_beneficiary_type, "2"));
  items.add(SetupModel(Languages.getText(context)!.3200_samurdhi_beneficiary_type, "3"));
  items.add(SetupModel(Languages.getText(context)!.4500_samurdhi_beneficiary_type, "4"));
}

else if (modelName == SetupConstant.walfare_type) {
  items.add(SetupModel(Languages.getText(context)!.samurdhi_walfare_type, "1"));
  items.add(SetupModel(Languages.getText(context)!.allowances_for_elders_walfare_type, "2"));
  items.add(SetupModel(Languages.getText(context)!.allowances_for_disables_walfare_type, "3"));
  items.add(SetupModel(Languages.getText(context)!.allowances_for_kidney_walfare_type, "4"));
  items.add(SetupModel(Languages.getText(context)!.allowances_for_thalassemia_patients_walfare_type, "5"));
  items.add(SetupModel(Languages.getText(context)!.allowances_for_cancer_patients_walfare_type, "6"));
  items.add(SetupModel(Languages.getText(context)!.mahapola_walfare_type, "7"));
  items.add(SetupModel(Languages.getText(context)!.scholarship_year_5__walfare_type, "8"));
  items.add(SetupModel(Languages.getText(context)!.public_aids_walfare_type, "9"));
  items.add(SetupModel(Languages.getText(context)!.other_walfare_type, "10"));
  items.add(SetupModel(Languages.getText(context)!.aswesuma_walfare_type, "11"));
  items.add(SetupModel(Languages.getText(context)!.non_govermental_assistance_walfare_type, "12"));
}

