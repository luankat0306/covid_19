import 'package:equatable/equatable.dart';

class Country extends Equatable{
  final String name,
      flag,
      cases,
      recovered,
      deaths;

  Country({this.cases, this.recovered, this.deaths, this.name, this.flag});

  @override
  // TODO: implement props
  List<Object> get props => [cases, recovered, deaths, name, flag];

}