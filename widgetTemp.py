from datetime import datetime
class DartWidgetGenerator:
    @staticmethod
    def generate_widget_template(class_name, model_instance, widgets):
        today_date = datetime.now().strftime('%Y-%m-%d')
        """
        Generates a Dart widget template for Flutter.

        Args:
            class_name (str): Name of the class to be used in the widget.
            model_instance (str): Name of the model instance variable.
            widgets (str): Widget definitions to include in the `Column`.

        Returns:
            str: A formatted Dart widget template.
        """
        dart_widget_template = f"""
      ///  localization file -  {today_date}
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class {class_name}Screen extends StatefulWidget {{

  final Map<String, dynamic>? liveData;
  final Map<String, dynamic>? peddingData;

  {class_name}Screen({{this.liveData, this.peddingData}});

  @override
  _{class_name}ScreenState createState() => _{class_name}ScreenState();
}}

class _{class_name}ScreenState extends State<{class_name}Screen> {{
  {class_name}Model {model_instance} = {class_name}Model();
  
  Map<String, dynamic> selectedOptions = {{}}; 
  late AppColor appColor;

  @override
  void didChangeDependencies() {{
    super.didChangeDependencies();
    appColor = AppColor();
  }}

  @override
  void initState() {{
    if (widget.peddingData != null) {{
      {model_instance} = {class_name}.fromJson(widget.peddingData as Map<String, dynamic>);
    }} else {{
      {model_instance} = {class_name}.fromJson(widget.liveData as Map<String, dynamic>);
    }}
    super.initState();
  }}

  @override
  Widget build(BuildContext context) {{
    return PageUF(
      appBar: appBarGeneral(context, appColor, title: Languages.getText(context)!.{class_name}),
      backgroundColor: appColor.Background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            {widgets}
            EqualDividerAAP(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppBlueButton(
                    function: () {{
                      Navigator.pop(context);
                    }},
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
  }}

  Widget build{class_name}Question({{
    required int number,
    required bool condition,
    required Widget widget,
  }}) {{
    if (condition) {{
      return widget;
    }} else {{
      return SizedBox.shrink();
    }}
  }}

  void save() {{
    if (selectedOptions.isEmpty) {{
      CustomSnackBar.showErrorSnackBar(
        Languages.getText(context)!.Select_Item_to_update, context, appColor
      );
    }} else {{
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewScreen(
            onCallBack: () {{
              Future.delayed(const Duration(milliseconds: 500)).then((val) {{
                Navigator.pop(context);
              }});
            }},
            selectedOptionsMap: selectedOptions,
            previewScreenType: AppConstant.DISASTER,
            model: {class_name}Model(),
            modelData: {model_instance},
            liveData: widget.liveData,
          ),
        ),
      );
    }}
  }}
}}

class {class_name}UI extends StatelessWidget {{
  final String label;
  final String question;
  final String fieldType;
  final Function onChanged;
  final dynamic dataList;
  var model;
  AppColor? appColor;

  {class_name}UI({{
    required this.label,
    required this.question,
    required this.fieldType,
    this.dataList,
    required this.onChanged,
    required this.model,
    this.appColor,
  }});

  @override
  Widget build(BuildContext context) {{
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
              onLongPress: () {{
                Clipboard.setData(ClipboardData(text: label));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Label copied to clipboard!')),
                );
              }},
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
              onLongPress: () {{
                Clipboard.setData(ClipboardData(text: question));
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Question copied to clipboard!')),
                );
              }},
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
              validator: (value) {{
                if (value == null || value.isEmpty) {{
                  return 'Please enter your value';
                }}
                return null;
              }},
              onChanged: (value) {{
                onChanged(value);
              }},
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

                    
onChange: (filename, filePath, fileType, file, date) {{
if(onChanged != null){{
onChanged(filename, filePath, fileType, file, date);
}}
}},

                    
                  ),
        ],
      ),
    );
  }}
}}
"""
        return dart_widget_template.strip()
