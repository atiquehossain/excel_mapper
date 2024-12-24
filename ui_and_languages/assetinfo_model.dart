
class AssetinfoModel {
  final String have_land;
  final double total_cultivable_land;
  final String crops_grown_land;
  final String have_cultivable_paddy_land;
  final String total_cultivable_paddy_land;
  final int have_owns_vehicles;
  final String vehicles_type;
  final int have_economic_machinery;
  final String machinery_type;
  final int have_animal_husbandry_livestock;
  final String animal_husbandry_livestock_type;
  final String house_type;
  final String house_floor_type;
  final String image_floor;
  final String house_roof_type;
  final String house_roof_img;
  final String house_wall_type;
  final String house_floor_area;
  final int has_secure_door_windows;
  final String residential_nature;
  final String residential_ownership;
  final int has_other_house;
  final String light_source;
  final String drinking_water_source;
  final String sanitation_facilities;
  final String toilet_type;
  final String natural_disasters_affected;
  final String latitude;
  final String longitude;
  final String photo_of_house;
  final String bank_account;
  final String bank_title;
  final String bank_branch;
  final String bank_name;
  final String bank_account_nominee;
  final String ownership;

  AssetinfoModel({
    this.have_land,
    this.total_cultivable_land,
    this.crops_grown_land,
    this.have_cultivable_paddy_land,
    this.total_cultivable_paddy_land,
    this.have_owns_vehicles,
    this.vehicles_type,
    this.have_economic_machinery,
    this.machinery_type,
    this.have_animal_husbandry_livestock,
    this.animal_husbandry_livestock_type,
    this.house_type,
    this.house_floor_type,
    this.image_floor,
    this.house_roof_type,
    this.house_roof_img,
    this.house_wall_type,
    this.house_floor_area,
    this.has_secure_door_windows,
    this.residential_nature,
    this.residential_ownership,
    this.has_other_house,
    this.light_source,
    this.drinking_water_source,
    this.sanitation_facilities,
    this.toilet_type,
    this.natural_disasters_affected,
    this.latitude,
    this.longitude,
    this.photo_of_house,
    this.bank_account,
    this.bank_title,
    this.bank_branch,
    this.bank_name,
    this.bank_account_nominee,
    this.ownership,
  });

  factory AssetinfoModel.fromJson(Map<String, dynamic> json) {
    return AssetinfoModel(
      have_land: json['have_land'],;
      total_cultivable_land: json['total_cultivable_land'],;
      crops_grown_land: json['crops_grown_land'],;
      have_cultivable_paddy_land: json['have_cultivable_paddy_land'],;
      total_cultivable_paddy_land: json['total_cultivable_paddy_land'],;
      have_owns_vehicles: json['have_owns_vehicles'],;
      vehicles_type: json['vehicles_type'],;
      have_economic_machinery: json['have_economic_machinery'],;
      machinery_type: json['machinery_type'],;
      have_animal_husbandry_livestock: json['have_animal_husbandry_livestock'],;
      animal_husbandry_livestock_type: json['animal_husbandry_livestock_type'],;
      house_type: json['house_type'],;
      house_floor_type: json['house_floor_type'],;
      image_floor: json['image_floor'],;
      house_roof_type: json['house_roof_type'],;
      house_roof_img: json['house_roof_img'],;
      house_wall_type: json['house_wall_type'],;
      house_floor_area: json['house_floor_area'],;
      has_secure_door_windows: json['has_secure_door_windows'],;
      residential_nature: json['residential_nature'],;
      residential_ownership: json['residential_ownership'],;
      has_other_house: json['has_other_house'],;
      light_source: json['light_source'],;
      drinking_water_source: json['drinking_water_source'],;
      sanitation_facilities: json['sanitation_facilities'],;
      toilet_type: json['toilet_type'],;
      natural_disasters_affected: json['natural_disasters_affected'],;
      latitude: json['latitude'],;
      longitude: json['longitude'],;
      photo_of_house: json['photo_of_house'],;
      bank_account: json['bank_account'],;
      bank_title: json['bank_title'],;
      bank_branch: json['bank_branch'],;
      bank_name: json['bank_name'],;
      bank_account_nominee: json['bank_account_nominee'],;
      ownership: json['ownership'],;
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'have_land': have_land,
      'total_cultivable_land': total_cultivable_land,
      'crops_grown_land': crops_grown_land,
      'have_cultivable_paddy_land': have_cultivable_paddy_land,
      'total_cultivable_paddy_land': total_cultivable_paddy_land,
      'have_owns_vehicles': have_owns_vehicles,
      'vehicles_type': vehicles_type,
      'have_economic_machinery': have_economic_machinery,
      'machinery_type': machinery_type,
      'have_animal_husbandry_livestock': have_animal_husbandry_livestock,
      'animal_husbandry_livestock_type': animal_husbandry_livestock_type,
      'house_type': house_type,
      'house_floor_type': house_floor_type,
      'image_floor': image_floor,
      'house_roof_type': house_roof_type,
      'house_roof_img': house_roof_img,
      'house_wall_type': house_wall_type,
      'house_floor_area': house_floor_area,
      'has_secure_door_windows': has_secure_door_windows,
      'residential_nature': residential_nature,
      'residential_ownership': residential_ownership,
      'has_other_house': has_other_house,
      'light_source': light_source,
      'drinking_water_source': drinking_water_source,
      'sanitation_facilities': sanitation_facilities,
      'toilet_type': toilet_type,
      'natural_disasters_affected': natural_disasters_affected,
      'latitude': latitude,
      'longitude': longitude,
      'photo_of_house': photo_of_house,
      'bank_account': bank_account,
      'bank_title': bank_title,
      'bank_branch': bank_branch,
      'bank_name': bank_name,
      'bank_account_nominee': bank_account_nominee,
      'ownership': ownership,
    };
  }

  @override
  String toString() {
    return 'AssetinfoModel(have_land: ${have_land}, total_cultivable_land: ${total_cultivable_land}, crops_grown_land: ${crops_grown_land}, have_cultivable_paddy_land: ${have_cultivable_paddy_land}, total_cultivable_paddy_land: ${total_cultivable_paddy_land}, have_owns_vehicles: ${have_owns_vehicles}, vehicles_type: ${vehicles_type}, have_economic_machinery: ${have_economic_machinery}, machinery_type: ${machinery_type}, have_animal_husbandry_livestock: ${have_animal_husbandry_livestock}, animal_husbandry_livestock_type: ${animal_husbandry_livestock_type}, house_type: ${house_type}, house_floor_type: ${house_floor_type}, image_floor: ${image_floor}, house_roof_type: ${house_roof_type}, house_roof_img: ${house_roof_img}, house_wall_type: ${house_wall_type}, house_floor_area: ${house_floor_area}, has_secure_door_windows: ${has_secure_door_windows}, residential_nature: ${residential_nature}, residential_ownership: ${residential_ownership}, has_other_house: ${has_other_house}, light_source: ${light_source}, drinking_water_source: ${drinking_water_source}, sanitation_facilities: ${sanitation_facilities}, toilet_type: ${toilet_type}, natural_disasters_affected: ${natural_disasters_affected}, latitude: ${latitude}, longitude: ${longitude}, photo_of_house: ${photo_of_house}, bank_account: ${bank_account}, bank_title: ${bank_title}, bank_branch: ${bank_branch}, bank_name: ${bank_name}, bank_account_nominee: ${bank_account_nominee}, ownership: ${ownership})';
  }
}
