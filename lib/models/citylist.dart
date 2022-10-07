class City
{
  String? image;
  String? code;
  String? cityName;

  City({ this.cityName,this.image,this.code });
}

List<City> cities = 
[
  City(image: "assets/a.png", cityName: "en-English" , code: "en"),
  City(image: "assets/b.png", cityName: "tr-Turkish" , code: "tr"),
  City(image: "assets/c.png", cityName: "es-Spanish" , code: "es"),
  City(image: "assets/d.png", cityName: "fr-French" , code: "fr"),
  City(image: "assets/e.png", cityName: "hi-Hindi" , code: "hi"),
  // City(image: "assets/e.png", cityName: "Select" , code: "any"),
];