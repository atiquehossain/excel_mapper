///  localization file -  2024-12-31
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FamilyinfoScreen extends StatefulWidget {

  final Map<String, dynamic>? liveData;
  final Map<String, dynamic>? peddingData;

  FamilyinfoScreen({this.liveData, this.peddingData});

  @override
  _FamilyinfoScreenState createState() => _FamilyinfoScreenState();
}

class _FamilyinfoScreenState extends State<FamilyinfoScreen> {
  FamilyinfoModel familyinfo = FamilyinfoModel();
  
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
      familyinfo = Familyinfo.fromJson(widget.peddingData as Map<String, dynamic>);
    } else {
      familyinfo = Familyinfo.fromJson(widget.liveData as Map<String, dynamic>);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageUF(
      appBar: appBarGeneral(context, appColor, title: Languages.getText(context)!.Familyinfo),
      backgroundColor: appColor.Background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            /// Question number  = 2
            buildFamilyinfoQuestion(
            number: 2,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.If_family_data_has_been_collected_so_far,
                question: Languages.getText(context)!.has_one_family_or_of_multiple_families_living_in_the_same_household_been_censused,
                fieldType: AppConstant.FieldType_radio,
                model: familyinfo.family_data_collected,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    familyinfo.family_data_collected = value;
                    selectedOptions[Languages.getText(context)!.has_one_family_or_of_multiple_families_living_in_the_same_household_been_censused] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 4
            buildFamilyinfoQuestion(
            number: 4,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Number_of_family_members,
                question: Languages.getText(context)!.Write_down_the_number_below,
                fieldType: AppConstant.FieldType_EditText,
                model: familyinfo.family_members_count,
                dataList: null,
                onChanged: (value) {
                    familyinfo.family_members_count = value;
                    selectedOptions[Languages.getText(context)!.Write_down_the_number_below] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 5
            buildFamilyinfoQuestion(
            number: 5,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.The_serial_number_of_the_member,
                question: Languages.getText(context)!.Write_down_the_serial_number_below,
                fieldType: AppConstant.FieldType_EditText,
                model: familyinfo.member_serial_no,
                dataList: null,
                onChanged: (value) {
                    familyinfo.member_serial_no = value;
                    selectedOptions[Languages.getText(context)!.Write_down_the_serial_number_below] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 6
            buildFamilyinfoQuestion(
            number: 6,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Relationship_of_the_applicant,
                question: Languages.getText(context)!.Write_down_in_the_text_field,
                fieldType: AppConstant.FieldType_EditText,
                model: familyinfo.relationship,
                dataList: null,
                onChanged: (value) {
                    familyinfo.relationship = value;
                    selectedOptions[Languages.getText(context)!.Write_down_in_the_text_field] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 7
            buildFamilyinfoQuestion(
            number: 7,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Information_about_families_with_mother_or_father,
                question: Languages.getText(context)!.Indicate_whether_the_family_applying_for_benefits_is_a_single_parent_family_with_only_the_mother_or_father_present,
                fieldType: AppConstant.FieldType_dropdown,
                model: familyinfo.family_with_parents_info,
                dataList: SetupData.getDropDownItems(context, SetupConstant.family_with_parents_info),
                onChanged: (value) {
                    familyinfo.family_with_parents_info = value;
                    selectedOptions[Languages.getText(context)!.Indicate_whether_the_family_applying_for_benefits_is_a_single_parent_family_with_only_the_mother_or_father_present] = SetupConstant.family_with_parents_info + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 14
            buildFamilyinfoQuestion(
            number: 14,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Full_name_of_the_member,
                question: Languages.getText(context)!.Write_down_your_name_below,
                fieldType: AppConstant.FieldType_EditText,
                model: familyinfo.full_name,
                dataList: null,
                onChanged: (value) {
                    familyinfo.full_name = value;
                    selectedOptions[Languages.getText(context)!.Write_down_your_name_below] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 15
            buildFamilyinfoQuestion(
            number: 15,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Gender,
                question: Languages.getText(context)!.Select_the_gender_from_the_options_below,
                fieldType: AppConstant.FieldType_dropdown,
                model: familyinfo.gender,
                dataList: SetupData.getDropDownItems(context, SetupConstant.gender),
                onChanged: (value) {
                    familyinfo.gender = value;
                    selectedOptions[Languages.getText(context)!.Select_the_gender_from_the_options_below] = SetupConstant.gender + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 18
            buildFamilyinfoQuestion(
            number: 18,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Marital_Status,
                question: Languages.getText(context)!.Select_the_correct_item_about_the_member_s_marital_status,
                fieldType: AppConstant.FieldType_dropdown,
                model: familyinfo.marital_status,
                dataList: SetupData.getDropDownItems(context, SetupConstant.marital_status),
                onChanged: (value) {
                    familyinfo.marital_status = value;
                    selectedOptions[Languages.getText(context)!.Select_the_correct_item_about_the_member_s_marital_status] = SetupConstant.marital_status + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 23
            buildFamilyinfoQuestion(
            number: 23,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Date_of_Birth_of_the_member,
                question: Languages.getText(context)!.Select_the_date_and_year_from_the_calender,
                fieldType: AppConstant.FieldType_EditText,
                model: familyinfo.dob,
                dataList: null,
                onChanged: (value) {
                    familyinfo.dob = value;
                    selectedOptions[Languages.getText(context)!.Select_the_date_and_year_from_the_calender] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 25
            buildFamilyinfoQuestion(
            number: 25,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Age_of_the_member,
                question: Languages.getText(context)!.Select_the_age_from_the_dropdown,
                fieldType: AppConstant.FieldType_EditText,
                model: familyinfo.age,
                dataList: null,
                onChanged: (value) {
                    familyinfo.age = value;
                    selectedOptions[Languages.getText(context)!.Select_the_age_from_the_dropdown] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 26
            buildFamilyinfoQuestion(
            number: 26,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Mobile_number_of_the_member,
                question: Languages.getText(context)!.If_there_is_a_phone_number_of_the_relevant_member_mention_the_phone_number_When_entering_the_phone_number_enter_all_10_digits_with_the_first_0,
                fieldType: AppConstant.FieldType_EditText,
                model: familyinfo.mobile_no,
                dataList: null,
                onChanged: (value) {
                    familyinfo.mobile_no = value;
                    selectedOptions[Languages.getText(context)!.If_there_is_a_phone_number_of_the_relevant_member_mention_the_phone_number_When_entering_the_phone_number_enter_all_10_digits_with_the_first_0] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 27
            buildFamilyinfoQuestion(
            number: 27,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Identity_card_number_of_the_member,
                question: Languages.getText(context)!.Mention_the_number_below,
                fieldType: AppConstant.FieldType_EditText,
                model: familyinfo.id_card_no,
                dataList: null,
                onChanged: (value) {
                    familyinfo.id_card_no = value;
                    selectedOptions[Languages.getText(context)!.Mention_the_number_below] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 28
            buildFamilyinfoQuestion(
            number: 28,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Front_side_photo_of_the_member_s_ID_card,
                question: Languages.getText(context)!.Upload_the_picture_here,
                fieldType: AppConstant.FieldType_Image,
                model: familyinfo.id_front_photo,
                dataList: null,
                onChanged: (value) {
                    familyinfo.id_front_photo = value;
                    selectedOptions[Languages.getText(context)!.Upload_the_picture_here] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 29
            buildFamilyinfoQuestion(
            number: 29,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Backside_photo_of_the_member_s_ID_card,
                question: Languages.getText(context)!.Upload_the_picture_here,
                fieldType: AppConstant.FieldType_Image,
                model: familyinfo.id_back_photo,
                dataList: null,
                onChanged: (value) {
                    familyinfo.id_back_photo = value;
                    selectedOptions[Languages.getText(context)!.Upload_the_picture_here] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 30
            buildFamilyinfoQuestion(
            number: 30,
            condition: true, 
            widget: FamilyinfoUI(
                label: Languages.getText(context)!.Obtaining_the_photograph_of_the_respective_member,
                question: Languages.getText(context)!.Upload_the_picture_here,
                fieldType: AppConstant.FieldType_Image,
                model: familyinfo.member_photo,
                dataList: null,
                onChanged: (value) {
                    familyinfo.member_photo = value;
                    selectedOptions[Languages.getText(context)!.Upload_the_picture_here] = null + AppConstant.SEPERATOR + value;
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

  Widget buildFamilyinfoQuestion({
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
            model: FamilyinfoModel(),
            modelData: familyinfo,
            liveData: widget.liveData,
          ),
        ),
      );
    }
  }
}

class FamilyinfoUI extends StatelessWidget {
  final String label;
  final String question;
  final String fieldType;
  final Function onChanged;
  final dynamic dataList;
  var model;
  AppColor? appColor;

  FamilyinfoUI({
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