import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncomeinfoScreen extends StatefulWidget {

  final Map<String, dynamic>? liveData;
  final Map<String, dynamic>? peddingData;

  IncomeinfoScreen({this.liveData, this.peddingData});

  @override
  _IncomeinfoScreenState createState() => _IncomeinfoScreenState();
}

class _IncomeinfoScreenState extends State<IncomeinfoScreen> {
  IncomeinfoModel incomeinfo = IncomeinfoModel();
  
  Map<String, dynamic> selectedOptions = {}; 
  late AppColor appColor;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appColor = AppColor();
  }

  @override
  void initState() {
    if (widget.peddingData != null) {
      incomeinfo = Incomeinfo.fromJson(widget.peddingData as Map<String, dynamic>);
    } else {
      incomeinfo = Incomeinfo.fromJson(widget.liveData as Map<String, dynamic>);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageUF(
      appBar: appBarGeneral(context, appColor, title: Languages.getText(context)!.Incomeinfo),
      backgroundColor: appColor.Background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            /// Question number  = 2
            buildIncomeinfoQuestion(
            number: 2,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Professional_level_attained_by_the_member,
                question: Languages.getText(context)!.The_highest_professional_qualification_level_of_the_respective_member_select_the_relevant_item_and_click_on_its_button_If_it_doesn_t_know_about_it_click_on_the_Unknown_item,
                fieldType: AppConstant.FieldType_dropdown,
                model: incomeinfo.professional_level,
                dataList: SetupData.getDropDownItems(context, SetupConstant.professional_level),
                onChanged: (value) {
                    incomeinfo.professional_level = value;
                    selectedOptions[Languages.getText(context)!.The_highest_professional_qualification_level_of_the_respective_member_select_the_relevant_item_and_click_on_its_button_If_it_doesn_t_know_about_it_click_on_the_Unknown_item] = SetupConstant.professional_level + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 9
            buildIncomeinfoQuestion(
            number: 9,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Main_economic_activity_in_which_the_member_is_engaged,
                question: Languages.getText(context)!.Select_the_correct_item_for_the_nature_of_the_job,
                fieldType: AppConstant.FieldType_dropdown,
                model: incomeinfo.nature_of_job,
                dataList: SetupData.getDropDownItems(context, SetupConstant.nature_of_job),
                onChanged: (value) {
                    incomeinfo.nature_of_job = value;
                    selectedOptions[Languages.getText(context)!.Select_the_correct_item_for_the_nature_of_the_job] = SetupConstant.nature_of_job + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 20
            buildIncomeinfoQuestion(
            number: 20,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Area_of_the_main_economic_activity_of_the_member,
                question: Languages.getText(context)!.Select_the_field_department_related_to_the_main_economic_activity_that_is_currently_engaged_in,
                fieldType: AppConstant.FieldType_multiple_choice,
                model: incomeinfo.department_of_job,
                dataList: SetupData.SetupData.getCheklistItems(context, SetupConstant.department_of_job),
                onChanged: (value) {
                    incomeinfo.department_of_job = value;
                    selectedOptions[Languages.getText(context)!.Select_the_field_department_related_to_the_main_economic_activity_that_is_currently_engaged_in] = SetupConstant.department_of_job + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 39
            buildIncomeinfoQuestion(
            number: 39,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Information_about_current_social_welfare_programs_that_the_benefits_are_received,
                question: Languages.getText(context)!.Has_the_respective_member_already_received_government_assistance,
                fieldType: AppConstant.FieldType_radio,
                model: incomeinfo.received_walfare_assistance,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    incomeinfo.received_walfare_assistance = value;
                    selectedOptions[Languages.getText(context)!.Has_the_respective_member_already_received_government_assistance] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 41
            buildIncomeinfoQuestion(
            number: 41,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Details_of_receipt_of_welfare_benefits,
                question: Languages.getText(context)!.Enter_which_welfare_program_that_government_assistance_is_received_by_the_respective_member,
                fieldType: AppConstant.FieldType_dropdown,
                model: incomeinfo.walfare_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.walfare_type),
                onChanged: (value) {
                    incomeinfo.walfare_type = value;
                    selectedOptions[Languages.getText(context)!.Enter_which_welfare_program_that_government_assistance_is_received_by_the_respective_member] = SetupConstant.walfare_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 53
            buildIncomeinfoQuestion(
            number: 53,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Value_of_samurdhi_benefit,
                question: Languages.getText(context)!.Do_you_recieve_samurdhi,
                fieldType: AppConstant.FieldType_radio,
                model: incomeinfo.samurdhi_benefit_value,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    incomeinfo.samurdhi_benefit_value = value;
                    selectedOptions[Languages.getText(context)!.Do_you_recieve_samurdhi] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 55
            buildIncomeinfoQuestion(
            number: 55,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Details_of_Samrudhi_beneficiaries,
                question: Languages.getText(context)!.Is_the_applicant_s_family_previous_recipient_of_Samurdhi_grant_Or_not_Select_the_correct_item_in_that_respect,
                fieldType: AppConstant.FieldType_dropdown,
                model: incomeinfo.samurdhi_beneficiary_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.samurdhi_beneficiary_type),
                onChanged: (value) {
                    incomeinfo.samurdhi_beneficiary_type = value;
                    selectedOptions[Languages.getText(context)!.Is_the_applicant_s_family_previous_recipient_of_Samurdhi_grant_Or_not_Select_the_correct_item_in_that_respect] = SetupConstant.samurdhi_beneficiary_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 59
            buildIncomeinfoQuestion(
            number: 59,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Details_of_monthly_expenses_of_the_family,
                question: Languages.getText(context)!.Select_the_category_relevant_to_that_family_from_the_following_expenditure_categories,
                fieldType: AppConstant.FieldType_multiple_choice,
                model: incomeinfo.expenses_category,
                dataList: SetupData.SetupData.getCheklistItems(context, SetupConstant.expenses_category),
                onChanged: (value) {
                    incomeinfo.expenses_category = value;
                    selectedOptions[Languages.getText(context)!.Select_the_category_relevant_to_that_family_from_the_following_expenditure_categories] = SetupConstant.expenses_category + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 72
            buildIncomeinfoQuestion(
            number: 72,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Details_about_the_family_s_electricity_consumption,
                question: Languages.getText(context)!.Is_the_aapplicant_is_an_electricity_consumer,
                fieldType: AppConstant.FieldType_radio,
                model: incomeinfo.has_electricity,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    incomeinfo.has_electricity = value;
                    selectedOptions[Languages.getText(context)!.Is_the_aapplicant_is_an_electricity_consumer] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 74
            buildIncomeinfoQuestion(
            number: 74,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Details_about_the_number_of_electricity_units_consumed_monthly,
                question: Languages.getText(context)!.Please_enter_the_number_of_electricity_units_consumed_monthly,
                fieldType: AppConstant.FieldType_EditText,
                model: incomeinfo.electricity_unit,
                dataList: null,
                onChanged: (value) {
                    incomeinfo.electricity_unit = value;
                    selectedOptions[Languages.getText(context)!.Please_enter_the_number_of_electricity_units_consumed_monthly] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 75
            buildIncomeinfoQuestion(
            number: 75,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Details_about_the_account_number_on_the_electricity_bill,
                question: Languages.getText(context)!.indicate_the_account_number_from_the_electricity_bill,
                fieldType: AppConstant.FieldType_EditText,
                model: incomeinfo.electricity_account_number,
                dataList: null,
                onChanged: (value) {
                    incomeinfo.electricity_account_number = value;
                    selectedOptions[Languages.getText(context)!.indicate_the_account_number_from_the_electricity_bill] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 76
            buildIncomeinfoQuestion(
            number: 76,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Information_regarding_loss_of_livelihood,
                question: Languages.getText(context)!.Has_the_member_faced_a_loss_of_livelihood_in_the_past_6_months_If_there_has_been_a_loss_of_livelihood_select_yes_if_not_select_no,
                fieldType: AppConstant.FieldType_radio,
                model: incomeinfo.loss_of_livelihood,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    incomeinfo.loss_of_livelihood = value;
                    selectedOptions[Languages.getText(context)!.Has_the_member_faced_a_loss_of_livelihood_in_the_past_6_months_If_there_has_been_a_loss_of_livelihood_select_yes_if_not_select_no] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 78
            buildIncomeinfoQuestion(
            number: 78,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Missing_value_in_excel,
                question: Languages.getText(context)!.If_the_member_has_faced_a_loss_of_livelihood_in_the_past_6_months_please_select_and_specify_what_type_of_livelihood_has_been_lost,
                fieldType: AppConstant.FieldType_dropdown,
                model: incomeinfo.loss_of_livelihood_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.loss_of_livelihood_type),
                onChanged: (value) {
                    incomeinfo.loss_of_livelihood_type = value;
                    selectedOptions[Languages.getText(context)!.If_the_member_has_faced_a_loss_of_livelihood_in_the_past_6_months_please_select_and_specify_what_type_of_livelihood_has_been_lost] = SetupConstant.loss_of_livelihood_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 94
            buildIncomeinfoQuestion(
            number: 94,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Information_on_the_family_s_monthly_fuel_consumption,
                question: Languages.getText(context)!.Please_provide_details_about_the_type_of_fuel_required_for_family_transportation_economic_activities_and_household_tasks_along_with_the_monthly_fuel_consumption,
                fieldType: AppConstant.FieldType_EditText,
                model: incomeinfo.required_fuel_type,
                dataList: null,
                onChanged: (value) {
                    incomeinfo.required_fuel_type = value;
                    selectedOptions[Languages.getText(context)!.Please_provide_details_about_the_type_of_fuel_required_for_family_transportation_economic_activities_and_household_tasks_along_with_the_monthly_fuel_consumption] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 95
            buildIncomeinfoQuestion(
            number: 95,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Monthly_Amount_of_Fuel_Required,
                question: Languages.getText(context)!.Specify_monthly_fuel_amount_below,
                fieldType: AppConstant.FieldType_EditText,
                model: incomeinfo. monthly_fuel_amount,
                dataList: null,
                onChanged: (value) {
                    incomeinfo. monthly_fuel_amount = value;
                    selectedOptions[Languages.getText(context)!.Specify_monthly_fuel_amount_below] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 96
            buildIncomeinfoQuestion(
            number: 96,
            condition: true, 
            widget: IncomeinfoUI(
                label: Languages.getText(context)!.Fuel_used_during_cooking,
                question: Languages.getText(context)!.Specify_the_main_fuel_used_for_cooking_food,
                fieldType: AppConstant.FieldType_multiple_choice,
                model: incomeinfo.cooking_fuel_type,
                dataList: SetupData.SetupData.getCheklistItems(context, SetupConstant.cooking_fuel_type),
                onChanged: (value) {
                    incomeinfo.cooking_fuel_type = value;
                    selectedOptions[Languages.getText(context)!.Specify_the_main_fuel_used_for_cooking_food] = SetupConstant.cooking_fuel_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        
            EqualDividerAAP(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppBlueButton(
                    function: () {
                      Navigator.pop(context);
                    },
                    buttonText: Languages.getText(context)!.cancel,
                    showArrow: false,
                    buttonRadius: 12,
                    buttonColor: appColor.Disabled_Background,
                    appColor: appColor,
                    textStyle: TextStyleAAP.getTextStyle(
                      color: appColor.H1_Title_Text as Color, 
                      textSizeType: TextSizeType.normal
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppBlueButton(
                    function: save,
                    buttonText: Languages.getText(context)!.save_preview,
                    showArrow: false,
                    buttonRadius: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildIncomeinfoQuestion({
    required int number,
    required bool condition,
    required Widget widget,
  }) {
    if (condition) {
      return widget;
    } else {
      return SizedBox.shrink();
    }
  }

  void save() {
    if (selectedOptions.isEmpty) {
      CustomSnackBar.showErrorSnackBar(
        Languages.getText(context)!.Select_Item_to_update, context, appColor
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            onCallBack: () {
              Future.delayed(const Duration(milliseconds: 500)).then((val) {
                Navigator.pop(context);
              });
            },
            selectedOptionsMap: selectedOptions,
            previewScreenType: AppConstant.DISASTER,
            model: IncomeinfoModel(),
            modelData: incomeinfo,
            liveData: widget.liveData,
          ),
        ),
      );
    }
  }
}

class IncomeinfoUI extends StatelessWidget {
  final String label;
  final String question;
  final String fieldType;
  final Function onChanged;
  final dynamic dataList;
  var model;
  AppColor? appColor;

  IncomeinfoUI({
    required this.label,
    required this.question,
    required this.fieldType,
    this.dataList,
    required this.onChanged,
    required this.model,
    this.appColor,
  });

  @override
  Widget build(BuildContext context) {
    appColor = AppColor();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onLongPress: () {
             
              Clipboard.setData(ClipboardData(text: label));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('label copied to clipboard!')),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              child: Text(
                label,
                style: TextStyle(
                  fontSize: AppDimens.getTextSize(textSizeType: TextSizeType.normal),
                  letterSpacing: AppDimens.getTextLetterSpacing(),
                  color: appColor!.H1_Title_Text,
                ),
              ),
            ),
          ),
          GestureDetector(
            onLongPress: () {
          
              Clipboard.setData(ClipboardData(text: question));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Question copied to clipboard!')),
              );
            },
            child: Padding(
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
              onChanged: (value) {
                onChanged(value);
              },
            )
          else if (fieldType == AppConstant.FieldType_radio)
            RadioGroupAAP(
              radioGroupType: RadioGroupType.simple,
              direction: Axis.vertical,
              selectedOptionValue: model,
              list: dataList,
              borderColor: AppColor.border_color,
              onChange: onChanged,
            )
          else if (fieldType == AppConstant.FieldType_multiple_choice)
            MultipleChoiceAAP(
              checkList: dataList,
              textColor: appColor?.H1_Title_Text,
              checkBoxColor: appColor?.Warning_Text,
              borderColor: appColor?.H1_Title_Text,
              backgroundColor: appColor?.Disabled_Background,
              appColor: appColor,
              selectedOptionValues: model,
              onChange: (value) => onChanged.call(value),
              fontSize: AppDimens.getTextSize(
                  textSizeType: TextSizeType.normal),
            )
            else if (fieldType ==  AppConstant.FieldType_Image)
                  FilePickerGeneralAAP(
                    appColor: appColor as AppColor,
                    uploadType: UploadType.Base64,
                    pickerType: PickerType.Image,
                    field: model,
                    borderColor: appColor!.H1_Title_Text,

                    background: appColor!.Disabled_Background as Color,
                    fileNameField: fileNameField,
                    fileTypeField: fileTypeField,
                    fileDateField: fileDateField,

                    fileStoragePath: Operations.getFileStoragePath(userId: userId, photoType: photoType ),
                    //fieldTitle: 'dbuivsahvfhsv bvgidsbvfi jgfty',
                    //dialogSubtitle: "bjbscjvd",
                    //dialogTitle: "eeeeeeee",
                    dialogIconPath: "assets/images/papers.png",

                    
onChange: (filename, filePath, fileType, file, date) {
if(onChanged != null){
onChanged(filename, filePath, fileType, file, date);
}
},

                    
                  ),
        ],
      ),
    );
  }
}