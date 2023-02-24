import 'package:flutter/material.dart';
import 'package:flutter_5id/models/ip_location.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _ipLocationController = TextEditingController();
  final IpLocation _ipLocation = IpLocation(
      query: "",
      status: "",
      country: "",
      countryCode: "",
      region: "",
      regionName: "",
      city: "",
      zip: "",
      lat: 0.0,
      lon: 0.0,
      timezone: "",
      isp: "",
      org: "",
      as: "");

  Future<void> _loadInfoIpLocation() async {
    try {
      // final http.Response response = await http.get(
      //   Uri.parse(
      //     "http://ip-api.com/json/${_ipLocationController.text}",
      //   ),
      // );
      // setState(() {
      //   _ipLocation = IpLocation.fromJson(
      //     json.decode(response.body),
      //   );
      // });
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
                  child: TextFormField(
                    controller: _ipLocationController,
                    maxLines: 1,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "lat e long sepatarati da un -"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ElevatedButton(
                    onPressed: () => _loadInfoIpLocation(),
                    child: const Text("Check IP")),
              )
            ],
          ),
          Expanded(child: IpLocationInfo(ipLocation: _ipLocation))
        ],
      ),
    );
  }
}

class IpLocationInfo extends StatelessWidget {
  const IpLocationInfo({super.key, required this.ipLocation});

  final IpLocation ipLocation;

  @override
  Widget build(BuildContext context) {
    return ipLocation.city.isEmpty ? Container() : Container();
  }
}
