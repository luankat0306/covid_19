class Country{
  final String name, flag, cases, recovered, deaths;

  Country({this.cases, this.recovered, this.deaths, this.name, this.flag});

}

List<Country> countrys = [
  Country(
      cases: '5,476,266',
      recovered: '2,875,147',
      deaths: '171,535',
      flag: 'assets/flags/us.png',
      name: 'USA'
  ),
  Country(
      cases: '3,278,895',
      recovered: '2,384,302',
      deaths: '106,571',
      flag: 'assets/flags/bra.png',
      name: 'Brazil'
  ),
  Country(
      cases: '2,553,578',
      recovered: '353,595',
      deaths: '155',
      flag: 'assets/flags/in.png',
      name: 'Indian'
  ),
  Country(
      cases: '2,553,578',
      recovered: '353,595',
      deaths: '155',
      flag: 'assets/flags/rus.png',
      name: 'Russia',
  ),
  Country(
      cases: '950',
      recovered: '437	',
      deaths: '23',
      flag: 'assets/flags/vn.png',
      name: 'Vietnam'
  )
];