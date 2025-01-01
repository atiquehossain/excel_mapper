///  localization file -  2025-01-01
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MedicalScreen extends StatefulWidget {

  final Map<String, dynamic>? liveData;
  final Map<String, dynamic>? peddingData;

  MedicalScreen({this.liveData, this.peddingData});

  @override
  _MedicalScreenState createState() => _MedicalScreenState();
}

class _MedicalScreenState extends State<MedicalScreen> {
  MedicalModel medical = MedicalModel();
  
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
      medical = Medical.fromJson(widget.peddingData as Map<String, dynamic>);
    } else {
      medical = Medical.fromJson(widget.liveData as Map<String, dynamic>);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageUF(
      appBar: appBarGeneral(context, appColor, title: Languages.getText(context)!.Medical),
      backgroundColor: appColor.Background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
                    /// Question number  = 2
                    buildMedicalQuestion(
                    number: 2,
                    condition: true, 
                    widget: MedicalUI(
                        label: Languages.getText(context)!.Information_about_the_difficulties_suffered_by_the_member,
                        question: Languages.getText(context)!.Select_only_the_item_with_which_the_member_is_experiencing_severe_difficulty_If_there_is_no_difficulty_select_item,
                        fieldType: AppConstant.FieldType_multiple_choice,
                        model: medical.difficulties,
                        dataList: SetupData.SetupData.getCheklistItems(context, SetupConstant.difficulties),
                        onChanged: (value) {
                            medical.difficulties = value;
                            selectedOptions[Languages.getText(context)!.Select_only_the_item_with_which_the_member_is_experiencing_severe_difficulty_If_there_is_no_difficulty_select_item] = SetupConstant.difficulties 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 9
                    buildMedicalQuestion(
                    number: 9,
                    condition: true, 
                    widget: MedicalUI(
                        label: Languages.getText(context)!.Information_about_the_member_s_disability,
                        question: Languages.getText(context)!.If_the_respective_member_is_a_disabled_person_select_the_code_Yes_or_No,
                        fieldType: AppConstant.FieldType_radio,
                        model: medical.member_disability,
                        dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.member_disability),
                        onChanged: (value) {
                            medical.member_disability = value;
                            selectedOptions[Languages.getText(context)!.If_the_respective_member_is_a_disabled_person_select_the_code_Yes_or_No] = SetupConstant.member_disability 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 11
                    buildMedicalQuestion(
                    number: 11,
                    condition: true, 
                    widget: MedicalUI(
                        label: Languages.getText(context)!.Information_on_disability,
                        question: Languages.getText(context)!.If_the_respective_member_is_disabled_select_the_disability_status_After_selecting_the_relevant_disability_select_the_correct_item_from_below_about_how_the_disability_occurred,
                        fieldType: AppConstant.FieldType_multiple_choice,
                        model: medical.disability,
                        dataList: SetupData.SetupData.getCheklistItems(context, SetupConstant.disability),
                        onChanged: (value) {
                            medical.disability = value;
                            selectedOptions[Languages.getText(context)!.If_the_respective_member_is_disabled_select_the_disability_status_After_selecting_the_relevant_disability_select_the_correct_item_from_below_about_how_the_disability_occurred] = SetupConstant.disability 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 22
                    buildMedicalQuestion(
                    number: 22,
                    condition: true, 
                    widget: MedicalUI(
                        label: Languages.getText(context)!.Obtaining_Medical_Records,
                        question: Languages.getText(context)!.Click_picture_of_the_record_and_upload_it_here,
                        fieldType: AppConstant.FieldType_Image,
                        model: medical.medical_records,
                        dataList: null,
                        onChanged: (value) {
                            medical.medical_records = value;
                            selectedOptions[Languages.getText(context)!.Click_picture_of_the_record_and_upload_it_here] = null 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 23
                    buildMedicalQuestion(
                    number: 23,
                    condition: true, 
                    widget: MedicalUI(
                        label: Languages.getText(context)!.Details_of_chronic_illnesses,
                        question: Languages.getText(context)!.if_the_member_is_suffering_from_chronic_diseases,
                        fieldType: AppConstant.FieldType_dropdown,
                        model: medical.chronic_illness,
                        dataList: SetupData.getDropDownItems(context, SetupConstant.chronic_illness),
                        onChanged: (value) {
                            medical.chronic_illness = value;
                            selectedOptions[Languages.getText(context)!.if_the_member_is_suffering_from_chronic_diseases] = SetupConstant.chronic_illness 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 30
                    buildMedicalQuestion(
                    number: 30,
                    condition: true, 
                    widget: MedicalUI(
                        label: "Missing value in excel",
                        question: Languages.getText(context)!.Select_Yes_if_the_respective_member_is_suffering_from_any_chronic_medical_condition_and_if_not_suffering_select_No,
                        fieldType: AppConstant.FieldType_radio,
                        model: medical.chronic_disease,
                        dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.chronic_disease),
                        onChanged: (value) {
                            medical.chronic_disease = value;
                            selectedOptions[Languages.getText(context)!.Select_Yes_if_the_respective_member_is_suffering_from_any_chronic_medical_condition_and_if_not_suffering_select_No] = SetupConstant.chronic_disease 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 32
                    buildMedicalQuestion(
                    number: 32,
                    condition: true, 
                    widget: MedicalUI(
                        label: Languages.getText(context)!.Details_of_chronic_kidney_disease,
                        question: Languages.getText(context)!.Select_Yes_or_No_if_the_respective_member_is_suffering_from_undiagnosed_kidney_disease,
                        fieldType: AppConstant.FieldType_radio,
                        model: medical.kidney_disease,
                        dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.kidney_disease),
                        onChanged: (value) {
                            medical.kidney_disease = value;
                            selectedOptions[Languages.getText(context)!.Select_Yes_or_No_if_the_respective_member_is_suffering_from_undiagnosed_kidney_disease] = SetupConstant.kidney_disease 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 34
                    buildMedicalQuestion(
                    number: 34,
                    condition: true, 
                    widget: MedicalUI(
                        label: Languages.getText(context)!.Details_of_the_hospital_receiving_treatment,
                        question: Languages.getText(context)!.If_a_person_is_being_treated_for_such_kidney_disease_mention_the_name_of_the_hospital_where_he_is_being_treated,
                        fieldType: AppConstant.FieldType_EditText,
                        model: medical.treatment_hospital_name,
                        dataList: null,
                        onChanged: (value) {
                            medical.treatment_hospital_name = value;
                            selectedOptions[Languages.getText(context)!.If_a_person_is_being_treated_for_such_kidney_disease_mention_the_name_of_the_hospital_where_he_is_being_treated] = null 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 35
                    buildMedicalQuestion(
                    number: 35,
                    condition: true, 
                    widget: MedicalUI(
                        label: Languages.getText(context)!.If_the_undergoing_dialysis_details_about_it,
                        question: Languages.getText(context)!.If_the_concerned_member_is_suffering_from_kidney_disease_and_is_currently_undergoing_dialysis_select_yes_if_not_so_select_no,
                        fieldType: AppConstant.FieldType_radio,
                        model: medical.dialysis,
                        dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.dialysis),
                        onChanged: (value) {
                            medical.dialysis = value;
                            selectedOptions[Languages.getText(context)!.If_the_concerned_member_is_suffering_from_kidney_disease_and_is_currently_undergoing_dialysis_select_yes_if_not_so_select_no] = SetupConstant.dialysis 
                                + AppConstant.SEPERATOR 
                                + value;
                        },
                    ),
                    ),
            

                    /// Question number  = 37
                    buildMedicalQuestion(
                    number: 37,
                    condition: true, 
                    widget: MedicalUI(
                        label: "Missing value in excel",
                        question: Languages.getText(context)!.If_the_relevant_member_is_under_dialysis_request_for_the_relevant_reports_to_confirm_it,
                        fieldType: AppConstant.FieldType_Image,
                        model: medical.dialysis_report,
                        dataList: null,
                        onChanged: (value) {
                            medical.dialysis_report = value;
                            selectedOptions[Languages.getText(context)!.If_the_relevant_member_is_under_dialysis_request_for_the_relevant_reports_to_confirm_it] = null 
                                + AppConstant.SEPERATOR 
                                + value;
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

  Widget buildMedicalQuestion({
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
            model: MedicalModel(),
            modelData: medical,
            liveData: widget.liveData,
          ),
        ),
      );
    }
  }
}

class MedicalUI extends StatelessWidget {
  final String label;
  final String question;
  final String fieldType;
  final Function onChanged;
  final dynamic dataList;
  var model;
  AppColor? appColor;

  MedicalUI({
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
        bool isLabelValid = label != "Missing value in excel";
    bool isQuestionValid = question != "Missing value in excel";

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           if (isLabelValid)
            GestureDetector(
              onLongPress: () {
                Clipboard.setData(ClipboardData(text: label));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Label copied to clipboard!')),
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
          if (isQuestionValid)
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