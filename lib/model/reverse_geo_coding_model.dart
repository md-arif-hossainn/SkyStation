class ReverseGeoCoding {
  final List<Result> results;
  final Query query;

  ReverseGeoCoding({required this.results, required this.query});

  factory ReverseGeoCoding.fromJson(Map<String, dynamic> json) {
    return ReverseGeoCoding(
      results: (json['results'] as List<dynamic>)
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
      query: Query.fromJson(json['query']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'results': results.map((e) => e.toJson()).toList(),
      'query': query.toJson(),
    };
  }
}

class Result {
  final Datasource datasource;
  final String? country;
  final String? countryCode;
  final String? state;
  final String? county;
  final String? stateDistrict;
  final String? city;
  final String? postcode;
  final double lon;
  final double lat;
  final double? distance;
  final String? resultType;
  final String? formatted;
  final String? addressLine1;
  final String? addressLine2;
  final Timezone? timezone;
  final String? plusCode;
  final Rank? rank;
  final String? placeId;
  final Bbox? bbox;

  Result({
    required this.datasource,
    this.country,
    this.countryCode,
    this.state,
    this.county,
    this.stateDistrict,
    this.city,
    this.postcode,
    required this.lon,
    required this.lat,
    this.distance,
    this.resultType,
    this.formatted,
    this.addressLine1,
    this.addressLine2,
    this.timezone,
    this.plusCode,
    this.rank,
    this.placeId,
    this.bbox,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      datasource: Datasource.fromJson(json['datasource']),
      country: json['country'],
      countryCode: json['country_code'],
      state: json['state'],
      county: json['county'],
      stateDistrict: json['state_district'],
      city: json['city'],
      postcode: json['postcode'],
      lon: (json['lon'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      distance: (json['distance'] as num?)?.toDouble(),
      resultType: json['result_type'],
      formatted: json['formatted'],
      addressLine1: json['address_line1'],
      addressLine2: json['address_line2'],
      timezone: json['timezone'] != null
          ? Timezone.fromJson(json['timezone'])
          : null,
      plusCode: json['plus_code'],
      rank: json['rank'] != null ? Rank.fromJson(json['rank']) : null,
      placeId: json['place_id'],
      bbox: json['bbox'] != null ? Bbox.fromJson(json['bbox']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'datasource': datasource.toJson(),
      'country': country,
      'country_code': countryCode,
      'state': state,
      'county': county,
      'state_district': stateDistrict,
      'city': city,
      'postcode': postcode,
      'lon': lon,
      'lat': lat,
      'distance': distance,
      'result_type': resultType,
      'formatted': formatted,
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'timezone': timezone?.toJson(),
      'plus_code': plusCode,
      'rank': rank?.toJson(),
      'place_id': placeId,
      'bbox': bbox?.toJson(),
    };
  }
}

class Datasource {
  final String sourcename;
  final String attribution;
  final String license;
  final String url;

  Datasource({
    required this.sourcename,
    required this.attribution,
    required this.license,
    required this.url,
  });

  factory Datasource.fromJson(Map<String, dynamic> json) {
    return Datasource(
      sourcename: json['sourcename'],
      attribution: json['attribution'],
      license: json['license'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sourcename': sourcename,
      'attribution': attribution,
      'license': license,
      'url': url,
    };
  }
}

class Timezone {
  final String name;
  final String offsetSTD;
  final int offsetSTDSeconds;
  final String offsetDST;
  final int offsetDSTSeconds;

  Timezone({
    required this.name,
    required this.offsetSTD,
    required this.offsetSTDSeconds,
    required this.offsetDST,
    required this.offsetDSTSeconds,
  });

  factory Timezone.fromJson(Map<String, dynamic> json) {
    return Timezone(
      name: json['name'],
      offsetSTD: json['offset_STD'],
      offsetSTDSeconds: json['offset_STD_seconds'],
      offsetDST: json['offset_DST'],
      offsetDSTSeconds: json['offset_DST_seconds'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'offset_STD': offsetSTD,
      'offset_STD_seconds': offsetSTDSeconds,
      'offset_DST': offsetDST,
      'offset_DST_seconds': offsetDSTSeconds,
    };
  }
}

class Rank {
  final double? importance;
  final double? popularity;

  Rank({this.importance, this.popularity});

  factory Rank.fromJson(Map<String, dynamic> json) {
    return Rank(
      importance: (json['importance'] as num?)?.toDouble(),
      popularity: (json['popularity'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'importance': importance,
      'popularity': popularity,
    };
  }
}

class Bbox {
  final double lon1;
  final double lat1;
  final double lon2;
  final double lat2;

  Bbox({
    required this.lon1,
    required this.lat1,
    required this.lon2,
    required this.lat2,
  });

  factory Bbox.fromJson(Map<String, dynamic> json) {
    return Bbox(
      lon1: (json['lon1'] as num).toDouble(),
      lat1: (json['lat1'] as num).toDouble(),
      lon2: (json['lon2'] as num).toDouble(),
      lat2: (json['lat2'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lon1': lon1,
      'lat1': lat1,
      'lon2': lon2,
      'lat2': lat2,
    };
  }
}

class Query {
  final double lat;
  final double lon;
  final String? plusCode;

  Query({required this.lat, required this.lon, this.plusCode});

  factory Query.fromJson(Map<String, dynamic> json) {
    return Query(
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      plusCode: json['plus_code'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lon': lon,
      'plus_code': plusCode,
    };
  }
}
