class TemplateProvider:
    """Provides templates for Dart models, widgets, and localization."""

    @staticmethod
    def get_model_template():
        return """
class {class_name}Model {{
  {fields}

  {class_name}Model({{
    {constructor_params}
  }});

  factory {class_name}Model.fromJson(Map<String, dynamic> json) {{
    return {class_name}Model(
      {from_json}
    );
  }}

  Map<String, dynamic> toJson() {{
    return {{
      {to_json}
    }};
  }}

  @override
  String toString() {{
    return '{class_name}Model({to_string})';
  }}
}}
"""

    @staticmethod
    def get_localization_template():
        return """
class Languages {{
  static Languages? _instance;
  static Languages getText(BuildContext context) => _instance ??= Languages();

  {fields}
}}
"""
