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
                question: Languages.getText(context)!.Is_there_land_owned_by_the_applicant_or_a_family_member_Does_the_applicant_or_a_family_member_have_any_plot_of_land,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.have_land,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.have_land = value;
                    selectedOptions[Languages.getText(context)!.Is_there_land_owned_by_the_applicant_or_a_family_member_Does_the_applicant_or_a_family_member_have_any_plot_of_land] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 5
            buildAssetinfoQuestion(
            number: 5,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_extent_of_dry_land_owned_by_the_family,
                question: Languages.getText(context)!.Indicate_the_total_cultivable_land_in_acres_in_digits_for_the_applicant_and_family_members,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.total_cultivable_land,
                dataList: null,
                onChanged: (value) {
                    assetinfo.total_cultivable_land = value;
                    selectedOptions[Languages.getText(context)!.Indicate_the_total_cultivable_land_in_acres_in_digits_for_the_applicant_and_family_members] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 6
            buildAssetinfoQuestion(
            number: 6,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Crops_grown_on_the_land,
                question: Languages.getText(context)!.Select_and_mark_the_items_about_the_crops_grown_on_the_land_owned_by_the_applicant,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.crops_grown_land,
                dataList: SetupData.getDropDownItems(context, SetupConstant.crops_grown_land),
                onChanged: (value) {
                    assetinfo.crops_grown_land = value;
                    selectedOptions[Languages.getText(context)!.Select_and_mark_the_items_about_the_crops_grown_on_the_land_owned_by_the_applicant] = SetupConstant.crops_grown_land + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 13
            buildAssetinfoQuestion(
            number: 13,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_paddy_land_owned_by_the_family,
                question: Languages.getText(context)!.If_the_applicant_or_family_members_have_cultivable_paddy_land_then_select_Yes_Otherwise_select_No,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.have_cultivable_paddy_land,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.have_cultivable_paddy_land = value;
                    selectedOptions[Languages.getText(context)!.If_the_applicant_or_family_members_have_cultivable_paddy_land_then_select_Yes_Otherwise_select_No] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
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
                question: Languages.getText(context)!.If_the_applicant_or_family_owns_vehicles_for_transportation_select_Yes_or_otherwise_No,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.have_owns_vehicles,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.have_owns_vehicles = value;
                    selectedOptions[Languages.getText(context)!.If_the_applicant_or_family_owns_vehicles_for_transportation_select_Yes_or_otherwise_No] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 19
            buildAssetinfoQuestion(
            number: 19,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_type_of_vehicle_and_number_of_vehicles_owned_by_the_family,
                question: Languages.getText(context)!.If_the_applicant_or_family_members_have_vehicles_click_in_front_of_the_respective_vehicle_types,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.vehicles_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.vehicles_type),
                onChanged: (value) {
                    assetinfo.vehicles_type = value;
                    selectedOptions[Languages.getText(context)!.If_the_applicant_or_family_members_have_vehicles_click_in_front_of_the_respective_vehicle_types] = SetupConstant.vehicles_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 26
            buildAssetinfoQuestion(
            number: 26,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_machinery_owned_by_the_family,
                question: Languages.getText(context)!.If_the_applicant_or_the_family_has_any_forms_of_machinery_related_to_economic_activity_select_Yes_otherwise_select_No,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.have_economic_machinery,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.have_economic_machinery = value;
                    selectedOptions[Languages.getText(context)!.If_the_applicant_or_the_family_has_any_forms_of_machinery_related_to_economic_activity_select_Yes_otherwise_select_No] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 28
            buildAssetinfoQuestion(
            number: 28,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_type_and_amount_of_machinery_owned_by_the_family,
                question: Languages.getText(context)!.If_the_applicant_or_family_members_have_machinery_select_the_type_of_machinery_the_family_member_own,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.machinery_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.machinery_type),
                onChanged: (value) {
                    assetinfo.machinery_type = value;
                    selectedOptions[Languages.getText(context)!.If_the_applicant_or_family_members_have_machinery_select_the_type_of_machinery_the_family_member_own] = SetupConstant.machinery_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 34
            buildAssetinfoQuestion(
            number: 34,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_family_owned_livestock,
                question: Languages.getText(context)!.Select_Yes_or_otherwise_No_if_the_applicant_or_family_members_are_involved_in_animal_husbandry,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.have_animal_husbandry_livestock,
                dataList: null,
                onChanged: (value) {
                    assetinfo.have_animal_husbandry_livestock = value;
                    selectedOptions[Languages.getText(context)!.Select_Yes_or_otherwise_No_if_the_applicant_or_family_members_are_involved_in_animal_husbandry] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 36
            buildAssetinfoQuestion(
            number: 36,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_of_the_type_and_amount_of_livestock_owned_by_the_family,
                question: Languages.getText(context)!.Write_down_the_number_of_the_livestock_the_family_owns,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.animal_husbandry_livestock_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.animal_husbandry_livestock_type),
                onChanged: (value) {
                    assetinfo.animal_husbandry_livestock_type = value;
                    selectedOptions[Languages.getText(context)!.Write_down_the_number_of_the_livestock_the_family_owns] = SetupConstant.animal_husbandry_livestock_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 42
            buildAssetinfoQuestion(
            number: 42,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_nature_of_the_residential_house,
                question: Languages.getText(context)!.Select_the_nature_type_of_the_residence_where_the_applicant_and_family_live_from_the_colors_above,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_type),
                onChanged: (value) {
                    assetinfo.house_type = value;
                    selectedOptions[Languages.getText(context)!.Select_the_nature_type_of_the_residence_where_the_applicant_and_family_live_from_the_colors_above] = SetupConstant.house_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 52
            buildAssetinfoQuestion(
            number: 52,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_nature_of_the_house_s_floor,
                question: Languages.getText(context)!.If_more_than_one_material_has_been_used_to_construct_the_floor_please_select_the_primary_material_used,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_floor_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_floor_type),
                onChanged: (value) {
                    assetinfo.house_floor_type = value;
                    selectedOptions[Languages.getText(context)!.If_more_than_one_material_has_been_used_to_construct_the_floor_please_select_the_primary_material_used] = SetupConstant.house_floor_type + AppConstant.SEPERATOR + value;
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
                label: Languages.getText(context)!.Materials_used_for_the_roofing_of_the_house,
                question: Languages.getText(context)!.If_more_than_one_material_has_been_used_to_construct_the_roof_please_select_the_primary_material_used,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_roof_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_roof_type),
                onChanged: (value) {
                    assetinfo.house_roof_type = value;
                    selectedOptions[Languages.getText(context)!.If_more_than_one_material_has_been_used_to_construct_the_roof_please_select_the_primary_material_used] = SetupConstant.house_roof_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 67
            buildAssetinfoQuestion(
            number: 67,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Main_materials_used_for_the_walls_of_the_house,
                question: Languages.getText(context)!.If_more_than_one_material_has_been_used_to_construct_the_walls_please_select_the_primary_material_used,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_wall_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_wall_type),
                onChanged: (value) {
                    assetinfo.house_wall_type = value;
                    selectedOptions[Languages.getText(context)!.If_more_than_one_material_has_been_used_to_construct_the_walls_please_select_the_primary_material_used] = SetupConstant.house_wall_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 75
            buildAssetinfoQuestion(
            number: 75,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Missing_value_in_excel,
                question: Languages.getText(context)!.Image_of_the_roof_of_the_house,
                fieldType: AppConstant.FieldType_Image,
                model: assetinfo.house_roof_img,
                dataList: null,
                onChanged: (value) {
                    assetinfo.house_roof_img = value;
                    selectedOptions[Languages.getText(context)!.Image_of_the_roof_of_the_house] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 76
            buildAssetinfoQuestion(
            number: 76,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_square_footage_of_the_house_s_floor,
                question: Languages.getText(context)!.Select_the_number_of_the_square_foot_below,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.house_floor_area,
                dataList: SetupData.getDropDownItems(context, SetupConstant.house_floor_area),
                onChanged: (value) {
                    assetinfo.house_floor_area = value;
                    selectedOptions[Languages.getText(context)!.Select_the_number_of_the_square_foot_below] = SetupConstant.house_floor_area + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 78
            buildAssetinfoQuestion(
            number: 78,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Details_about_the_doors_and_windows_of_the_house,
                question: Languages.getText(context)!.If_the_residence_where_the_applicant_lives_has_secure_doors_windows_select_yes_if_not_select_no,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.has_secure_door_windows,
                dataList: null,
                onChanged: (value) {
                    assetinfo.has_secure_door_windows = value;
                    selectedOptions[Languages.getText(context)!.If_the_residence_where_the_applicant_lives_has_secure_doors_windows_select_yes_if_not_select_no] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 80
            buildAssetinfoQuestion(
            number: 80,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_nature_of_the_residential_house,
                question: Languages.getText(context)!.Write_down_below_in_the_text_field,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.residential_nature,
                dataList: null,
                onChanged: (value) {
                    assetinfo.residential_nature = value;
                    selectedOptions[Languages.getText(context)!.Write_down_below_in_the_text_field] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 81
            buildAssetinfoQuestion(
            number: 81,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Ownership_of_the_residential_house,
                question: Languages.getText(context)!.Select_the_appropriate_answer_to_indicate_whether_the_residence_belongs_to_the_applicant_or_a_family_member_Select_the_relevant_item_from_the_options_provided_in_the_box_regarding_the_ownership_of_the_applicant_s_residence,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.residential_ownership,
                dataList: null,
                onChanged: (value) {
                    assetinfo.residential_ownership = value;
                    selectedOptions[Languages.getText(context)!.Select_the_appropriate_answer_to_indicate_whether_the_residence_belongs_to_the_applicant_or_a_family_member_Select_the_relevant_item_from_the_options_provided_in_the_box_regarding_the_ownership_of_the_applicant_s_residence] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 92
            buildAssetinfoQuestion(
            number: 92,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_ownership_of_any_other_house_or_building,
                question: Languages.getText(context)!.If_the_applicant_or_a_family_member_owns_another_house_or_building_select_yes_if_not_select_no,
                fieldType: AppConstant.FieldType_radio,
                model: assetinfo.has_other_house,
                dataList: SetupData.getCheklistItemsWithoutFuture(context, SetupConstant.yes_no),
                onChanged: (value) {
                    assetinfo.has_other_house = value;
                    selectedOptions[Languages.getText(context)!.If_the_applicant_or_a_family_member_owns_another_house_or_building_select_yes_if_not_select_no] = SetupConstant.yes_no + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 94
            buildAssetinfoQuestion(
            number: 94,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.The_main_source_of_light,
                question: Languages.getText(context)!.click_infront_of_the_main_source_of_light_that_the_applicant_family_members_use_If_there_are_several_sources_of_light_for_the_house_include_only_the_main_source_that_is_primarily_used,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.light_source,
                dataList: SetupData.getDropDownItems(context, SetupConstant.light_source),
                onChanged: (value) {
                    assetinfo.light_source = value;
                    selectedOptions[Languages.getText(context)!.click_infront_of_the_main_source_of_light_that_the_applicant_family_members_use_If_there_are_several_sources_of_light_for_the_house_include_only_the_main_source_that_is_primarily_used] = SetupConstant.light_source + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 100
            buildAssetinfoQuestion(
            number: 100,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_the_main_source_of_drinking_water,
                question: Languages.getText(context)!.Click_in_front_of_the_main_source_of_drinking_water_that_the_applicant_family_members_use_If_there_are_several_sources_of_drinking_water_include_only_the_main_source_that_is_primarily_used,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.drinking_water_source,
                dataList: SetupData.getDropDownItems(context, SetupConstant.drinking_water_source),
                onChanged: (value) {
                    assetinfo.drinking_water_source = value;
                    selectedOptions[Languages.getText(context)!.Click_in_front_of_the_main_source_of_drinking_water_that_the_applicant_family_members_use_If_there_are_several_sources_of_drinking_water_include_only_the_main_source_that_is_primarily_used] = SetupConstant.drinking_water_source + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 113
            buildAssetinfoQuestion(
            number: 113,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_the_nature_of_the_sanitation_facilities_used,
                question: Languages.getText(context)!.Select_and_include_the_relevant_item_that_accurately_describes_the_nature_of_the_sanitation_facilities_used_in_the_house,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.sanitation_facilities,
                dataList: SetupData.getDropDownItems(context, SetupConstant.sanitation_facilities),
                onChanged: (value) {
                    assetinfo.sanitation_facilities = value;
                    selectedOptions[Languages.getText(context)!.Select_and_include_the_relevant_item_that_accurately_describes_the_nature_of_the_sanitation_facilities_used_in_the_house] = SetupConstant.sanitation_facilities + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 118
            buildAssetinfoQuestion(
            number: 118,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_the_type_of_toilet,
                question: Languages.getText(context)!.Select_the_type_of_toilet_used_in_the_house_accurately_and_click_the_button_in_front,
                fieldType: AppConstant.FieldType_dropdown,
                model: assetinfo.toilet_type,
                dataList: SetupData.getDropDownItems(context, SetupConstant.toilet_type),
                onChanged: (value) {
                    assetinfo.toilet_type = value;
                    selectedOptions[Languages.getText(context)!.Select_the_type_of_toilet_used_in_the_house_accurately_and_click_the_button_in_front] = SetupConstant.toilet_type + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 126
            buildAssetinfoQuestion(
            number: 126,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_natural_disasters,
                question: Languages.getText(context)!.what_natural_disasters_have_affected_the_house_in_the_past_5_years_Please_specify,
                fieldType: AppConstant.FieldType_multiple_choice,
                model: assetinfo.natural_disasters_affected,
                dataList: SetupData.SetupData.getCheklistItems(context, SetupConstant.natural_disasters_affected),
                onChanged: (value) {
                    assetinfo.natural_disasters_affected = value;
                    selectedOptions[Languages.getText(context)!.what_natural_disasters_have_affected_the_house_in_the_past_5_years_Please_specify] = SetupConstant.natural_disasters_affected + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 138
            buildAssetinfoQuestion(
            number: 138,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_on_the_geographical_location_of_the_housing_unit,
                question: Languages.getText(context)!.Click_on_the_Get_Location_to_obtain_the_location_of_the_applicant_s_housing_unit_via_GPS_technology_The_latitude_and_longitude_of_the_applicant_s_home_location_should_be_acquired_here,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.latitude,
                dataList: null,
                onChanged: (value) {
                    assetinfo.latitude = value;
                    selectedOptions[Languages.getText(context)!.Click_on_the_Get_Location_to_obtain_the_location_of_the_applicant_s_housing_unit_via_GPS_technology_The_latitude_and_longitude_of_the_applicant_s_home_location_should_be_acquired_here] = null + AppConstant.SEPERATOR + value;
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
                model: assetinfo.longitude,
                dataList: null,
                onChanged: (value) {
                    assetinfo.longitude = value;
                    selectedOptions[Languages.getText(context)!.Missing_value_in_excel] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 140
            buildAssetinfoQuestion(
            number: 140,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Taking_Photos_of_the_House,
                question: Languages.getText(context)!.Four_photos_should_be_taken_the_front_back_side_and_interior_of_the_house,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.photo_of_house,
                dataList: null,
                onChanged: (value) {
                    assetinfo.photo_of_house = value;
                    selectedOptions[Languages.getText(context)!.Four_photos_should_be_taken_the_front_back_side_and_interior_of_the_house] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 141
            buildAssetinfoQuestion(
            number: 141,
            condition: true, 
            widget: AssetinfoUI(
                label: Languages.getText(context)!.Information_regarding_bank_account,
                question: Languages.getText(context)!.Enter_information_about_active_bank_accounts_belonging_to_the_applicant_or_a_family_member_After_selecting_the_relevant_bank_enter_the_bank_branch_name_account_number_and_account_holder_s_name_in_the_fields_displayed_below_Specify_whether_the_account_ownership_belongs_to_the_applicant_a_family_member_or_a_nominee,
                fieldType: AppConstant.FieldType_EditText,
                model: assetinfo.bank_account,
                dataList: null,
                onChanged: (value) {
                    assetinfo.bank_account = value;
                    selectedOptions[Languages.getText(context)!.Enter_information_about_active_bank_accounts_belonging_to_the_applicant_or_a_family_member_After_selecting_the_relevant_bank_enter_the_bank_branch_name_account_number_and_account_holder_s_name_in_the_fields_displayed_below_Specify_whether_the_account_ownership_belongs_to_the_applicant_a_family_member_or_a_nominee] = null + AppConstant.SEPERATOR + value;
                },
            ),
            ),
        

            /// Question number  = 142
            buildAssetinfoQuestion(
            number: 142,
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
        

            /// Question number  = 143
            buildAssetinfoQuestion(
            number: 143,
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
        

            /// Question number  = 144
            buildAssetinfoQuestion(
            number: 144,
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
        

            /// Question number  = 159
            buildAssetinfoQuestion(
            number: 159,
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
        

            /// Question number  = 160
            buildAssetinfoQuestion(
            number: 160,
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
          GestureDetector(
            onLongPress: () {
              // Copy the question to clipboard
              Clipboard.setData(ClipboardData(text: question));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('⚡ “Expecto Patronum!” The question is now protected in your clipboard! ⚡')),
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
            ),
        ],
      ),
    );
  }
}