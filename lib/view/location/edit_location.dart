import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:travel_smart/provider/city_names_provider.dart';

class EditLocation extends ConsumerStatefulWidget {
  const EditLocation({super.key});

  @override
  ConsumerState<EditLocation> createState() => _AddLocationState();
}

class _AddLocationState extends ConsumerState<EditLocation> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _hiveBox = Hive.box("myBox");

  String _city = "";

  void _addSubmit(List<String> cityNames) {
    if (cityNames.contains(_city)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Already Added")),
      );
    } else {
      ref.read(cityNamesProvider.notifier).update((state) => [...state, _city]);
      _hiveBox.put("cities", ref.read(cityNamesProvider));
      _controller.clear();
    }
  }

  void _removeLocation(String city) {
    ref.read(cityNamesProvider.notifier).update((state) {
      return state.where((element) => element != city).toList();
    });

    _hiveBox.put("cities", ref.read(cityNamesProvider));
  }

  @override
  Widget build(BuildContext context) {
    final res = ref.watch(cityNamesProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _controller,
                onChanged: (e) => _city = e,
                decoration: InputDecoration(
                  hintText: "City Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Enter City Name";
                  }

                  return null;
                },
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _addSubmit(res);
                    }
                  },
                  child: const Text("Add City"),
                ),
              ),
              const SizedBox(height: 25),
              const Divider(),
              const SizedBox(height: 25),
              const Text(
                "Added Cities",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: res.length,
                  itemBuilder: (e, index) {
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 30),
                          const SizedBox(width: 10),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              res[index],
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => _removeLocation(res[index]),
                            icon: const Icon(Icons.highlight_remove_sharp),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
