class Country{
  final int id, cases, recovered, deaths;
  final String name, flag;

  Country({this.id, this.cases, this.recovered, this.deaths, this.name, this.flag});

}

List<Country> countrys = [
  Country(
    id: 1,
    cases: 1203588,
    recovered: 255555,
    deaths: 3555,
    flag: 'assets/flags/us.png',
    name: 'USA'
  ),
  Country(
      id: 2,
      cases: 753578,
      recovered: 353595,
      deaths: 155,
      flag: 'assets/flags/in.png',
      name: 'Indian'
  ),
];