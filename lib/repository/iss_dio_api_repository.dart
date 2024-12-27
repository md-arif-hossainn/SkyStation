


import 'package:sky_station/data/app_url/app_url.dart';
import 'package:sky_station/model/iss_model.dart';
import 'package:sky_station/model/reverse_geo_coding_model.dart';

import '../data/network/network_api_services.dart';
import 'iss_repository.dart';

class IssDioApiRepository implements IssRepository {

  final api = NetworkApiService();

  @override
  Future<IssModel> fetchData() async  {
    final response = await api.getApi(AppUrl.issTrackEndPoint);
    return IssModel.fromJson(response);
  }

  @override
  Future<ReverseGeoCoding> fetchLocationName(double lat, double lan) async {
   final response = await api.getApi(AppUrl.geoCodingEndPoint(lat, lan));
   return ReverseGeoCoding.fromJson(response);
  }


}