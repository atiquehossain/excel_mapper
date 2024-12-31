static const String family_with_parents_info = "family_with_parents_info";
static const String gender = "gender";
static const String marital_status = "marital_status";
else if (modelName == SetupConstant.family_with_parents_info) {
  items.add(SetupModel(Languages.getText(context)!.the_head_of_household_is_widowed_or_family_with_parents_info, "1"));
  items.add(SetupModel(Languages.getText(context)!.his_her_spouse_is_divorced_or_legally_separated_or_family_with_parents_info, "2"));
  items.add(SetupModel(Languages.getText(context)!.not_legally_separated_but_lives_apart_with_no_connection_to_this_family_unit_or_family_with_parents_info, "3"));
  items.add(SetupModel(Languages.getText(context)!.a_family_unit_where_only_a_mother_or_father_lives_solely_with_their_own_children_is_considered_as_a_household_with_only_the_mother_or_father__family_with_parents_info, "4"));
  items.add(SetupModel(Languages.getText(context)!.only_the_mother_family_with_parents_info, "5"));
  items.add(SetupModel(Languages.getText(context)!.only_the_father_family_with_parents_info, "6"));
  items.add(SetupModel(Languages.getText(context)!.only_the_guardian_family_with_parents_info, "7"));
}

else if (modelName == SetupConstant.gender) {
  items.add(SetupModel(Languages.getText(context)!.male_gender, "1"));
  items.add(SetupModel(Languages.getText(context)!.female_gender, "2"));
  items.add(SetupModel(Languages.getText(context)!.other_gender, "3"));
}

else if (modelName == SetupConstant.marital_status) {
  items.add(SetupModel(Languages.getText(context)!.unmarried_marital_status, "1"));
  items.add(SetupModel(Languages.getText(context)!.married_marital_status, "2"));
  items.add(SetupModel(Languages.getText(context)!.widow_marital_status, "3"));
  items.add(SetupModel(Languages.getText(context)!.divorced_marital_status, "4"));
  items.add(SetupModel(Languages.getText(context)!.separated_marital_status, "5"));
}

