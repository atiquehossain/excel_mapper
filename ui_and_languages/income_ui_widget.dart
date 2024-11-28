import 'package:flutter/material.dart';

class IncomeScreen extends StatefulWidget {
  @override
  _IncomeScreenState createState() => _IncomeScreenState();
}

class _IncomeScreenState extends State<IncomeScreen> {
  IncomeModel income = IncomeModel();
  
    Map<String, dynamic> selectedOptions = ;
      late AppColor appColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  appColor = AppColor();

  @override
  Widget build(BuildContext context) {
    return PageUF(
      backgroundColor: appColor.Background,
      body: Column(
        children: [
          
        IncomeUI(
          label: Languages.getText(context)!.Professional_level_attained_by_the_member,
          question: Languages.getText(context)!.which_welfare_program_that_government_assistance_is_received_by_the_respective_member,
          fieldType: AppConstant.FieldType_dropdown,
          model: income.professional_level,
          dataList: SetupData.getDropDownItems(context, SetupConstant.professional_level),
          onChanged: (value) {
              income.professional_level = value;
              selectedOptions[Languages.getText(context)!.which_welfare_program_that_government_assistance_is_received_by_the_respective_member] = SetupData.getDropDownItems(context, SetupConstant.professional_level) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Main_economic_activity_in_which_the_member_is_engaged,
          question: Languages.getText(context)!.Select_the_correct_item_for_the_nature_of_the_job,
          fieldType: AppConstant.FieldType_dropdown,
          model: income.nature_of_job,
          dataList: SetupData.getDropDownItems(context, SetupConstant.nature_of_job),
          onChanged: (value) {
              income.nature_of_job = value;
              selectedOptions[Languages.getText(context)!.Select_the_correct_item_for_the_nature_of_the_job] = SetupData.getDropDownItems(context, SetupConstant.nature_of_job) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Area_of_the_main_economic_activity_of_the_member,
          question: Languages.getText(context)!.Select_the_field_department_related_to_the_main_economic_activity_that_is_currently_engaged_in,
          fieldType: AppConstant.FieldType_dropdown,
          model: income.department_of_job,
          dataList: SetupData.getDropDownItems(context, SetupConstant.department_of_job),
          onChanged: (value) {
              income.department_of_job = value;
              selectedOptions[Languages.getText(context)!.Select_the_field_department_related_to_the_main_economic_activity_that_is_currently_engaged_in] = SetupData.getDropDownItems(context, SetupConstant.department_of_job) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Information_about_current_social_welfare_programs_that_the_benefits_are_received,
          question: Languages.getText(context)!.Has_the_respective_member_already_received_government_assistance,
          fieldType: AppConstant.FieldType_radio,
          model: income.received_walfare_assistance,
          dataList: SetupData.getDropDownItems(context, SetupConstant.yes_no),
          onChanged: (value) {
              income.received_walfare_assistance = value;
              selectedOptions[Languages.getText(context)!.Has_the_respective_member_already_received_government_assistance] = SetupData.getDropDownItems(context, SetupConstant.yes_no) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Details_of_receipt_of_welfare_benefits,
          question: Languages.getText(context)!.Enter_which_welfare_program_that_government_assistance_is_received_by_the_respective_member,
          fieldType: AppConstant.FieldType_dropdown,
          model: income.walfare_type,
          dataList: SetupData.getDropDownItems(context, SetupConstant.walfare_type),
          onChanged: (value) {
              income.walfare_type = value;
              selectedOptions[Languages.getText(context)!.Enter_which_welfare_program_that_government_assistance_is_received_by_the_respective_member] = SetupData.getDropDownItems(context, SetupConstant.walfare_type) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Details_of_Samrudhi_beneficiaries,
          question: Languages.getText(context)!.Is_the_applicant_s_family_previous_recipient_of_Samurdhi_grant_Or_not,
          fieldType: AppConstant.FieldType_radio,
          model: income.samurdhi_beneficiary_type,
          dataList: SetupData.getDropDownItems(context, SetupConstant.yes_no),
          onChanged: (value) {
              income.samurdhi_beneficiary_type = value;
              selectedOptions[Languages.getText(context)!.Is_the_applicant_s_family_previous_recipient_of_Samurdhi_grant_Or_not] = SetupData.getDropDownItems(context, SetupConstant.yes_no) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Value_of_samurdhi_benefit,
          question: Languages.getText(context)!.Do_you_recieve_samurdhi,
          fieldType: AppConstant.FieldType_multiple_choice,
          model: income.samurdhi_benefit_value,
          dataList: SetupData.getCheklistItems(context, SetupConstant.samurdhi_benefit_value),
          onChanged: (value) {
              income.samurdhi_benefit_value = value;
              selectedOptions[Languages.getText(context)!.Do_you_recieve_samurdhi] = SetupData.getCheklistItems(context, SetupConstant.samurdhi_benefit_value) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Details_of_monthly_expenses_of_the_family,
          question: Languages.getText(context)!.Select_the_category_relevant_to_that_family_from_the_following_expenditure_categories,
          fieldType: AppConstant.FieldType_EditText,
          model: income.expenses_category,
          dataList: null,
          onChanged: (value) {
              income.expenses_category = value;
              selectedOptions[Languages.getText(context)!.Select_the_category_relevant_to_that_family_from_the_following_expenditure_categories] = null + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Details_about_the_family_s_electricity_consumption,
          question: Languages.getText(context)!.Is_the_aapplicant_is_an_electricity_consumer,
          fieldType: AppConstant.FieldType_radio,
          model: income.has_electricity,
          dataList: SetupData.getDropDownItems(context, SetupConstant.yes_no),
          onChanged: (value) {
              income.has_electricity = value;
              selectedOptions[Languages.getText(context)!.Is_the_aapplicant_is_an_electricity_consumer] = SetupData.getDropDownItems(context, SetupConstant.yes_no) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Fuel_used_during_cooking,
          question: "Missing value in excel",
          fieldType: AppConstant.FieldType_EditText,
          model: income.fuel_cooking,
          dataList: null,
          onChanged: (value) {
              income.fuel_cooking = value;
              selectedOptions["Missing value in excel"] = null + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Details_about_the_number_of_electricity_units_consumed_monthly,
          question: Languages.getText(context)!.Please_enter_the_number_of_electricity_units_consumed_monthly,
          fieldType: AppConstant.FieldType_EditText,
          model: income.electricity_unit,
          dataList: null,
          onChanged: (value) {
              income.electricity_unit = value;
              selectedOptions[Languages.getText(context)!.Please_enter_the_number_of_electricity_units_consumed_monthly] = null + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Details_about_the_account_number_on_the_electricity_bill,
          question: Languages.getText(context)!.indicate_the_account_number_from_the_electricity_bill,
          fieldType: AppConstant.FieldType_EditText,
          model: income.electricity_account_number,
          dataList: null,
          onChanged: (value) {
              income.electricity_account_number = value;
              selectedOptions[Languages.getText(context)!.indicate_the_account_number_from_the_electricity_bill] = null + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Information_regarding_loss_of_livelihood,
          question: Languages.getText(context)!.Has_the_member_faced_a_loss_of_livelihood_in_the_past_6_months_If_there_has_been_a_loss_of_livelihood_select_yes_if_not_select_no,
          fieldType: AppConstant.FieldType_radio,
          model: income.loss_of_livelihood,
          dataList: SetupData.getDropDownItems(context, SetupConstant.yes_no),
          onChanged: (value) {
              income.loss_of_livelihood = value;
              selectedOptions[Languages.getText(context)!.Has_the_member_faced_a_loss_of_livelihood_in_the_past_6_months_If_there_has_been_a_loss_of_livelihood_select_yes_if_not_select_no] = SetupData.getDropDownItems(context, SetupConstant.yes_no) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: "Missing value in excel",
          question: Languages.getText(context)!.If_the_member_has_faced_a_loss_of_livelihood_in_the_past_6_months_please_select_and_specify_what_type_of_livelihood_has_been_lost,
          fieldType: AppConstant.FieldType_radio,
          model: income.loss_of_livelihood_type,
          dataList: SetupData.getDropDownItems(context, SetupConstant.yes_no),
          onChanged: (value) {
              income.loss_of_livelihood_type = value;
              selectedOptions[Languages.getText(context)!.If_the_member_has_faced_a_loss_of_livelihood_in_the_past_6_months_please_select_and_specify_what_type_of_livelihood_has_been_lost] = SetupData.getDropDownItems(context, SetupConstant.yes_no) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Information_on_the_family_s_monthly_fuel_consumption,
          question: Languages.getText(context)!.Please_provide_details_about_the_type_of_fuel_required_for_family_transportation_economic_activities_and_household_tasks_along_with_the_monthly_fuel_consumption,
          fieldType: AppConstant.FieldType_dropdown,
          model: income.required_fuel_type,
          dataList: SetupData.getDropDownItems(context, SetupConstant.required_fuel_type),
          onChanged: (value) {
              income.required_fuel_type = value;
              selectedOptions[Languages.getText(context)!.Please_provide_details_about_the_type_of_fuel_required_for_family_transportation_economic_activities_and_household_tasks_along_with_the_monthly_fuel_consumption] = SetupData.getDropDownItems(context, SetupConstant.required_fuel_type) + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Monthly_Amount_of_Fuel_Required,
          question: "Missing value in excel",
          fieldType: AppConstant.FieldType_EditText,
          model: income. monthly_fuel_amount,
          dataList: null,
          onChanged: (value) {
              income. monthly_fuel_amount = value;
              selectedOptions["Missing value in excel"] = null + AppConstant.SEPERATOR + value;
          },
        ),
        

        IncomeUI(
          label: Languages.getText(context)!.Fuel_used_during_cooking,
          question: Languages.getText(context)!.Specify_the_main_fuel_used_for_cooking_food,
          fieldType: AppConstant.FieldType_multiple_choice,
          model: income.cooking_fuel_type,
          dataList: SetupData.getCheklistItems(context, SetupConstant.cooking_fuel_type),
          onChanged: (value) {
              income.cooking_fuel_type = value;
              selectedOptions[Languages.getText(context)!.Specify_the_main_fuel_used_for_cooking_food] = SetupData.getCheklistItems(context, SetupConstant.cooking_fuel_type) + AppConstant.SEPERATOR + value;
          },
        ),
        
        ],
      ),
    );
  }
}

class IncomeUI extends StatelessWidget {
  final String label;
  final String question;
  final String fieldType;
  final Function onChanged;
  final dynamic dataList;
  var model;
  AppColor? appColor;

  IncomeUI({
    required this.label,
    required this.question,
    required this.fieldType,
    this.dataList,
    required this.onChanged,
    required this.model,
    this.appColor,
  });

    AppColor appColor = AppColor();


  @override
  Widget build(BuildContext context) {
    appColor = AppColor();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: AppDimens.getTextSize(textSizeType: TextSizeType.normal),
                letterSpacing: AppDimens.getTextLetterSpacing(),
                color: appColor!.H1_Title_Text,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            child: Text(
              question,
              style: TextStyle(
                fontSize: AppDimens.getTextSize(textSizeType: TextSizeType.normal),
                letterSpacing: AppDimens.getTextLetterSpacing(),
                color: appColor!.H1_Title_Text,
              ),
            ),
          ),
          if (fieldType == AppConstant.FieldType_dropdown)
            DropdownAAP(
              items: dataList,
              showMandatoryStar: false,
              selectedOptionValue: model,
              dropdownType: DropdownType.simple,
              borderColor: appColor!.H1_Title_Text,
              textColor: appColor!.H1_Title_Text,
              normalColor: appColor!.Background,
              itemsBackground: appColor!.Disabled_Background,
              background: appColor!.Disabled_Background as Color,
              onChange: onChanged,
            )
          else if (fieldType == AppConstant.FieldType_EditText)
            NewTextFieldAAP(
              labelText: "",
              initialValue: model,
              borderRadius: 10,
              isLabelTextShow: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your value';
                }
                return null;
              },
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }
}