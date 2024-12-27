
import 'package:sky_station/model/iss_model.dart';
import 'package:sky_station/model/reverse_geo_coding_model.dart';

abstract class IssRepository {
  Future<IssModel> fetchData();
  Future<ReverseGeoCoding> fetchLocationName(double lat,double lan);
}