class DartWidgetGenerator:
    @staticmethod
    def generate_widget_template(class_name, model_instance, widgets):
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
import 'package:flutter/material.dart';
import 'languages.dart';

class {class_name}Widget extends StatefulWidget {{
  @override
  _{class_name}WidgetState createState() => _{class_name}WidgetState();
}}

class _{class_name}WidgetState extends State<{class_name}Widget> {{
  {class_name}Model {model_instance} = {class_name}Model();

  @override
  Widget build(BuildContext context) {{
    return Column(
      children: [
        {widgets}
      ],
    );
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
    appColor ??= AppColor();

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
              validator: (value) {{
                if (value == null || value.isEmpty) {{
                  return 'Please enter your value';
                }}
                return null;
              }},
              onChanged: onChanged,
            ),
        ],
      ),
    );
  }}
}}
"""
        return dart_widget_template.strip()
