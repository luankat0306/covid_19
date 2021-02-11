import 'package:covid_19/src/models/country.dart';
import 'package:equatable/equatable.dart';

abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryInitial extends CountryState {}

class CountryFailure extends CountryState {}

class CountrySuccess extends CountryState {
  final List<Country> countries;

  const CountrySuccess({
    this.countries,
  });

  CountrySuccess copyWith({
    List<Country> countries,
  }) {
    return CountrySuccess(
      countries: countries ?? this.countries,
    );
  }

  @override
  List<Object> get props => [countries];
}