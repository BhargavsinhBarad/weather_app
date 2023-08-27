class api_model {
  Map location;
  Map current;
  Map forecast;

  api_model({required this.location, required this.current,required this.forecast});

  factory api_model.js({required Map data})
  {
    return api_model(location: data['location'], current: data['current'], forecast: data['forecast']);
  }
}
