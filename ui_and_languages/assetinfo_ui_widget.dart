///  localization file -  2024-12-15
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AssetinfoScreen extends StatefulWidget {

  final Map<String, dynamic>? liveData;
  final Map<String, dynamic>? peddingData;

  AssetinfoScreen({this.liveData, this.peddingData});

  @override
  _AssetinfoScreenState createState() => _AssetinfoScreenState();
}

class _AssetinfoScreenState extends State<AssetinfoScreen> {
  AssetinfoModel assetinfo = AssetinfoModel();
  
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
      assetinfo = Assetinfo.fromJson(widget.peddingData as Map<String, dynamic>);
    } else {
      assetinfo = Assetinfo.fromJson(widget.liveData as Map<String, dynamic>);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageUF(
      appBar: appBarGeneral(context, appColor, title: Languages.getText(context)!.Assetinfo),
      backgroundColor: appColor.Background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            /// Question number  = 2
            buildAssetinfoQuestion(
            number: 2,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_plot_of_lands_owned_to_the_family,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.have_land,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.have_land = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 5
            buildAssetinfoQuestion(
            number: 5,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_extent_of_dry_land_owned_by_the_family,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.total_cultivable_land,
                dataList: null,
                onChanged: (value) {
                    assetinfo.total_cultivable_land = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 6
            buildAssetinfoQuestion(
            number: 6,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Crops_grown_on_the_land,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.crops_grown_land,
                dataList: SetupData.getDropDownItems(context, SetupConstant.crops_grown_land),
                onChanged: (value) {
                    assetinfo.crops_grown_land = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.crops_grown_land + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 13
            buildAssetinfoQuestion(
            number: 13,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_paddy_land_owned_by_the_family,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.have_cultivable_paddy_land,
                dataList: SetupData.getDropDownItems(context, SetupConstant.have_cultivable_paddy_land),
                onChanged: (value) {
                    assetinfo.have_cultivable_paddy_land = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.have_cultivable_paddy_land + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 16
            buildAssetinfoQuestion(
            number: 16,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_extent_of_paddy_land_owned_by_the_family,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.total_cultivable_paddy_land,
                dataList: null,
                onChanged: (value) {
                    assetinfo.total_cultivable_paddy_land = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 17
            buildAssetinfoQuestion(
            number: 17,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_vehicles_used_by_the_family_for_transportation_owned,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.have_owns_vehicles,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.have_owns_vehicles = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 19
            buildAssetinfoQuestion(
            number: 19,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_type_of_vehicle_and_number_of_vehicles_owned_by_the_family,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.vehicles_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.vehicles_type),
                onChanged: (value) {
                    assetinfo.vehicles_type = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.vehicles_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 26
            buildAssetinfoQuestion(
            number: 26,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_machinery_owned_by_the_family,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.have_economic_machinery,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.have_economic_machinery = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 28
            buildAssetinfoQuestion(
            number: 28,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_type_and_amount_of_machinery_owned_by_the_family,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.machinery_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.machinery_type),
                onChanged: (value) {
                    assetinfo.machinery_type = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.machinery_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 34
            buildAssetinfoQuestion(
            number: 34,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_family_owned_livestock,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.have_animal_husbandry_livestock,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.have_animal_husbandry_livestock = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 36
            buildAssetinfoQuestion(
            number: 36,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_type_and_amount_of_livestock_owned_by_the_family,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.animal_husbandry_livestock_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.animal_husbandry_livestock_type),
                onChanged: (value) {
                    assetinfo.animal_husbandry_livestock_type = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.animal_husbandry_livestock_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 42
            buildAssetinfoQuestion(
            number: 42,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_nature_of_the_residential_house,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_type),
                onChanged: (value) {
                    assetinfo.house_type = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.house_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 52
            buildAssetinfoQuestion(
            number: 52,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_nature_of_the_house_s_floor,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_floor_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_floor_type),
                onChanged: (value) {
                    assetinfo.house_floor_type = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.house_floor_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 59
            buildAssetinfoQuestion(
            number: 59,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Missing_value_in_excel,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_Image,
                model: assetinfo.image_floor,
                dataList: null,
                onChanged: (value) {
                    assetinfo.image_floor = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 60
            buildAssetinfoQuestion(
            number: 60,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Materials_used_for_the_roofing_of_the_house_n_n,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_roof_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_roof_type),
                onChanged: (value) {
                    assetinfo.house_roof_type = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.house_roof_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 66
            buildAssetinfoQuestion(
            number: 66,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Missing_value_in_excel,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_Image,
                model: assetinfo.house_roof_img,
                dataList: null,
                onChanged: (value) {
                    assetinfo.house_roof_img = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 67
            buildAssetinfoQuestion(
            number: 67,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Main_materials_used_for_the_walls_of_the_house,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_wall_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_wall_type),
                onChanged: (value) {
                    assetinfo.house_wall_type = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.house_wall_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 75
            buildAssetinfoQuestion(
            number: 75,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_square_footage_of_the_house_s_floor,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_floor_area,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_floor_area),
                onChanged: (value) {
                    assetinfo.house_floor_area = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.house_floor_area + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 77
            buildAssetinfoQuestion(
            number: 77,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_about_the_doors_and_windows_of_the_house,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.has_secure_door_windows,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.has_secure_door_windows = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 79
            buildAssetinfoQuestion(
            number: 79,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_nature_of_the_residential_house,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.residential_nature,
                dataList: SetupData.getDropDownItems(context, SetupConstant.residential_nature),
                onChanged: (value) {
                    assetinfo.residential_nature = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.residential_nature + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 82
            buildAssetinfoQuestion(
            number: 82,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Ownership_of_the_residential_house,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.residential_ownership,
                dataList: SetupData.getDropDownItems(context, SetupConstant.residential_ownership),
                onChanged: (value) {
                    assetinfo.residential_ownership = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.residential_ownership + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 93
            buildAssetinfoQuestion(
            number: 93,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_ownership_of_any_other_house_or_building,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.has_other_house,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.has_other_house = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 95
            buildAssetinfoQuestion(
            number: 95,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_main_source_of_light,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.light_source,
                dataList: SetupData.getDropDownItems(context, SetupConstant.light_source),
                onChanged: (value) {
                    assetinfo.light_source = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.light_source + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 101
            buildAssetinfoQuestion(
            number: 101,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_the_main_source_of_drinking_water,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.drinking_water_source,
                dataList: SetupData.getDropDownItems(context, SetupConstant.drinking_water_source),
                onChanged: (value) {
                    assetinfo.drinking_water_source = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.drinking_water_source + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 114
            buildAssetinfoQuestion(
            number: 114,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_the_nature_of_the_sanitation_facilities_used,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.sanitation_facilities,
                dataList: SetupData.getDropDownItems(context, SetupConstant.sanitation_facilities),
                onChanged: (value) {
                    assetinfo.sanitation_facilities = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.sanitation_facilities + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 119
            buildAssetinfoQuestion(
            number: 119,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_the_type_of_toilet,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.toilet_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.toilet_type),
                onChanged: (value) {
                    assetinfo.toilet_type = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.toilet_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 127
            buildAssetinfoQuestion(
            number: 127,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_natural_disasters,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_multiple_choice,
                model: assetinfo.natural_disasters_affected,
                dataList: SetupData.SetupData.getCheklistItems(context, SetupConstant.natural_disasters_affected),
                onChanged: (value) {
                    assetinfo.natural_disasters_affected = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.natural_disasters_affected + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 139
            buildAssetinfoQuestion(
            number: 139,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_on_the_geographical_location_of_the_housing_unit,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.latitude,
                dataList: null,
                onChanged: (value) {
                    assetinfo.latitude = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 140
            buildAssetinfoQuestion(
            number: 140,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Missing_value_in_excel,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.longitude,
                dataList: null,
                onChanged: (value) {
                    assetinfo.longitude = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 141
            buildAssetinfoQuestion(
            number: 141,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Taking_Photos_of_the_House,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_Image,
                model: assetinfo.photo_of_house,
                dataList: null,
                onChanged: (value) {
                    assetinfo.photo_of_house = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 142
            buildAssetinfoQuestion(
            number: 142,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_bank_account,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.bank_account,
                dataList: null,
                onChanged: (value) {
                    assetinfo.bank_account = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 143
            buildAssetinfoQuestion(
            number: 143,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Bank_Title,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.bank_title,
                dataList: null,
                onChanged: (value) {
                    assetinfo.bank_title = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 144
            buildAssetinfoQuestion(
            number: 144,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Bank_Branch,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.bank_branch,
                dataList: null,
                onChanged: (value) {
                    assetinfo.bank_branch = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 145
            buildAssetinfoQuestion(
            number: 145,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Bank_Name,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.bank_name,
                dataList: SetupData.getDropDownItems(context, SetupConstant.bank_name),
                onChanged: (value) {
                    assetinfo.bank_name = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = SetupConstant.bank_name + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 160
            buildAssetinfoQuestion(
            number: 160,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Bank_account_nominee,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.bank_account_nominee,
                dataList: null,
                onChanged: (value) {
                    assetinfo.bank_account_nominee = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 161
            buildAssetinfoQuestion(
            number: 161,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.ownership,
                question: Languages.getText(context)!.Missing_value_in_excel,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.ownership,
                dataList: null,
                onChanged: (value) {
                    assetinfo.ownership = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
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

  Widget buildAssetinfoQuestion({
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
            model: AssetinfoModel(),
            modelData: assetinfo,
            liveData: widget.liveData,
          ),
        ),
      );
    }
  }
}

class AssetinfoUI extends StatelessWidget {
  final String label;
  final String question;
  final String fieldType;
  final Function onChanged;
  final dynamic dataList;
  var model;
  AppColor? appColor;

  AssetinfoUI({
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