import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_smart/components/home_city_cards.dart';
import 'package:travel_smart/controller/weather_data_controller.dart';
import 'package:travel_smart/provider/city_names_provider.dart';
import 'package:travel_smart/utils/btn_style.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedCity = 0;

  @override
  Widget build(BuildContext context) {
    final cityNames = ref.watch(cityNamesProvider);
    final res = ref.watch(weatherDataProvider(cityNames));

    if (res.value == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      floatingActionButton: IconButton(
        style: actionButtonStyle,
        icon: const Icon(Icons.add_location),
        onPressed: () => Navigator.pushNamed(context, "/add"),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 50,
                  spreadRadius: 5,
                  color: Colors.black.withOpacity(0.25),
                ),
              ],
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                Image.network(res.value![_selectedCity].icon),
                Text(
                  res.value![_selectedCity].weather,
                  style: const TextStyle(fontSize: 25),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              "${res.value![_selectedCity].temperature}°C",
              style: const TextStyle(fontSize: 50, height: 1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  res.value![_selectedCity].weather,
                  style: const TextStyle(fontSize: 20),
                ),
                Text(
                  res.value![_selectedCity].city,
                  style: const TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: ListView.builder(
              itemCount: res.value!.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (e, index) {
                return GestureDetector(
                  onTap: () => setState(() => _selectedCity = index),
                  child: HomeCityCards(
                    city: res.value![index].city,
                    isSelected: _selectedCity == index,
                    weather: res.value![index].weather,
                    temperature: res.value![index].temperature,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
