import 'package:flutter/material.dart';
import '../api_calling/weather_api.dart';
import '../model/weather_model.dart';
import '../widgets/additional_info.dart';
import '../widgets/current_weather.dart';
import '../widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherApiClient client = WeatherApiClient();

  Weather? data;
  final TextEditingController _searchCtrlr = TextEditingController();

  String selectedCity = "Colombo";

  bool isSearchBarVisible = false;

  void _searchCity(String city) {
    if (city.isEmpty) {
      return;
    }

    // Delay the state update until the next frame to avoid blocking the UI thread
    Future.delayed(Duration.zero, () {
      setState(() {
        selectedCity = city;
      });
    });
  }

  Future<void> getData() async {
    data = await client.getCurrentWeather(selectedCity);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather API',
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isSearchBarVisible = !isSearchBarVisible;
              });
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      drawer: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          return DrawerWidget(selectedCity: selectedCity, data: data);
        },
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.green.shade100],
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,
            stops: const [0.3, 0.7],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(0),
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(139, 255, 255, 255),
                    Color.fromARGB(0, 255, 255, 255),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              duration: const Duration(milliseconds: 300),
              height: isSearchBarVisible ? 100 : 0,
              child: TextField(
                controller: _searchCtrlr,
                decoration: const InputDecoration(
                  hintText: 'Search City..',
                  hintStyle: TextStyle(),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
                onSubmitted: _searchCity,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: FutureBuilder(
                  future: getData(),
                  builder: ((context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: currentWeather(
                              '${data!.thisWeatherIcon}',
                              '${data!.thisWeatherDesc}',
                              '${data!.thisTemp}',
                              '${data!.thisCityName}',
                              '${data!.thisCountryName}',
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          const Text(
                            "Additional Details",
                            style: TextStyle(
                              fontSize: 24,
                              color: Color(0xdd212121),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 20.0,
                          ),
                          additionalInformation(
                            '${data!.thisWindSpeed}',
                            '${data!.thisHumidity}',
                            '${data!.thisPressure}',
                            '${data!.thisFeelsLike}',
                          ),
                        ],
                      );
                    }
                    return Container();
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
