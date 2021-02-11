import 'dart:convert';

import 'package:covid_19/src/bloc/country_event.dart';
import 'package:covid_19/src/bloc/country_state.dart';
import 'package:covid_19/src/models/country.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final http.Client httpClient;

  CountryBloc({this.httpClient}) : super(CountryInitial());
  
  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if(event is CountryFetched) {
      try {
        if(state is CountryInitial) {
          final countries = await _fetchCountries();
          yield CountrySuccess(countries: countries);
          return;
        }
      } catch(_) {
        yield CountryFailure();
      }
    }
  }

  Future<List<Country>> _fetchCountries() async {
    final response = await httpClient.get('https://api.covid19api.com/summary');
    if(response.statusCode == 200) {
      final dataMap = json.decode(response.body) as Map;
      final data = dataMap['Countries'] as List;
      return data.map((country) {
        return Country(
            cases: country['TotalConfirmed'].toString(),
            recovered: country['TotalRecovered'].toString(),
            deaths: country['TotalDeaths'].toString(),
            name: country['CountryCode'].toString(),
            flag: country['CountryCode'].toString().toLowerCase()
        );
      }).toList();
    }
  }
}

