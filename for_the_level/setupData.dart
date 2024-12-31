static const String current_education = "current_education";
static const String higher_education = "higher_education";
else if (modelName == SetupConstant.current_education) {
  items.add(SetupModel(Languages.getText(context)!.pre_school_current_education, "1"));
  items.add(SetupModel(Languages.getText(context)!.school_current_education, "2"));
  items.add(SetupModel(Languages.getText(context)!.universities_current_education, "3"));
  items.add(SetupModel(Languages.getText(context)!.professional_technical_institutions_current_education, "4"));
  items.add(SetupModel(Languages.getText(context)!.educational_institutions_for_special_needs_current_education, "5"));
  items.add(SetupModel(Languages.getText(context)!.other_educational_institutions_current_education, "6"));
  items.add(SetupModel(Languages.getText(context)!.not_having_education_current_education, "7"));
  items.add(SetupModel(Languages.getText(context)!.education_for_special_needs_current_education, "8"));
}

else if (modelName == SetupConstant.higher_education) {
  items.add(SetupModel(Languages.getText(context)!.grade_1_pass_higher_education, "1"));
  items.add(SetupModel(Languages.getText(context)!.grade_5_pass_higher_education, "2"));
  items.add(SetupModel(Languages.getText(context)!.grade_8_pass_higher_education, "3"));
  items.add(SetupModel(Languages.getText(context)!.grade_10_pass_higher_education, "4"));
  items.add(SetupModel(Languages.getText(context)!.g_c_e_o_l_pass_higher_education, "5"));
  items.add(SetupModel(Languages.getText(context)!.g_c_e_a_l_pass_higher_education, "6"));
  items.add(SetupModel(Languages.getText(context)!.degree_higher_education, "7"));
  items.add(SetupModel(Languages.getText(context)!.post_graduate_degree_higher_education, "8"));
  items.add(SetupModel(Languages.getText(context)!.never_attended_school_higher_education, "9"));
}

