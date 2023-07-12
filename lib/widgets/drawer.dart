import 'package:flutter/material.dart';
import '../model/weather_model.dart';
import '../screens/feels_like_page.dart';
import '../screens/humidity_page.dart';
import '../screens/pressure_page.dart';
import '../screens/wind_page.dart';
import 'package:weather_icons/weather_icons.dart';

class DrawerWidget extends StatefulWidget {
  final String selectedCity;
  final Weather? data;
  const DrawerWidget({
    Key? key,
    required this.selectedCity,
    this.data,
  }) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  Weather? data;

  @override
  void initState() {
    super.initState();
  }

  get location => widget.selectedCity;
  get windSpeed => widget.data!.thisWindSpeed;
  get windDeg => widget.data!.thisWindDegrees;
  get windGust => widget.data!.thisWindGust;
  get humidity => widget.data!.thisHumidity;
  get feelsLike => widget.data!.thisFeelsLike;
  get pressure => widget.data!.thisPressure;
  get seaLevelPressure => widget.data!.thisSeaLevelPressure;
  get groundLevelPressure => widget.data!.thisGroundLevelPressure;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.tealAccent, Colors.greenAccent],
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,
            stops: [0.3, 0.7],
          ),
        ),
        child: Column(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Weather API',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Card(
                    child: ListTile(
                      title: const Row(
                        children: [
                          Icon(
                            WeatherIcons.barometer,
                            size: 20,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text('Pressure'),
                          ),
                        ],
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PressurePage(
                              location: location,
                              pressure: pressure,
                              seaLevelPressure: seaLevelPressure,
                              groundLevelPressure: groundLevelPressure,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Row(
                        children: [
                          Icon(WeatherIcons.cloudy_windy, size: 20),
                          SizedBox(
                            width: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text('Wind'),
                          ),
                        ],
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WindPage(
                              location: location,
                              windSpeed: windSpeed,
                              windDeg: windDeg,
                              windGust: windGust,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Row(
                        children: [
                          Icon(WeatherIcons.thermometer, size: 20),
                          SizedBox(
                            width: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text('Feels Like'),
                          ),
                        ],
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FeelsLikePage(
                              location: location,
                              feelsLike: feelsLike,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Card(
                    child: ListTile(
                      title: const Row(
                        children: [
                          Icon(WeatherIcons.humidity, size: 20),
                          SizedBox(
                            width: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Text('Humidity'),
                          ),
                        ],
                      ),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HumidityPage(
                              location: location,
                              humidity: humidity,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const ListTile(
                    title: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Divider(),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
