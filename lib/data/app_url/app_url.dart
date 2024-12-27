



class AppUrl {

  static var baseUrl = 'http://api.open-notify.org/' ;
  static var issTrackEndPoint ='$baseUrl/iss-now.json' ;

  ///Reverse Geo Coding API
  static var geoBaseUrl = 'https://api.geoapify.com/v1/geocode';
  static var geoApiKey = '324a658f9e3f46a0a583aa45cbd363bb';

  static geoCodingEndPoint(
      double lat, double lan) => '$geoBaseUrl/reverse?lat=$lat&lon=$lan&format=json&apiKey=$geoApiKey';


}