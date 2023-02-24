import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_5id/models/ip_location.dart';
import 'package:http/http.dart' as http;

class IpLocationPage extends StatefulWidget {
  const IpLocationPage({super.key});

  @override
  State<IpLocationPage> createState() => _IpLocationPageState();
}

class _IpLocationPageState extends State<IpLocationPage> {
  final TextEditingController _ipLocationController = TextEditingController();
  IpLocation _ipLocation = IpLocation(
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
      final http.Response response = await http.get(
        Uri.parse(
          "http://ip-api.com/json/${_ipLocationController.text}",
        ),
      );
      setState(() {
        _ipLocation = IpLocation.fromJson(
          json.decode(response.body),
        );
      });
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
                        hintText: "Inserisci un indirizzo IP"),
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
    return ipLocation.city.isEmpty
        ? Container()
        : ListView(
            shrinkWrap: true,
            children: [
              IpLocationInfoRow(
                title: ipLocation.query,
                subtitle: "Ip Address",
              ),
              IpLocationInfoRow(
                title: ipLocation.status,
                subtitle: "Status",
              ),
              IpLocationInfoRow(
                title: "${ipLocation.country} (${ipLocation.countryCode})",
                subtitle: "Country",
              ),
              IpLocationInfoRow(
                title: "${ipLocation.regionName} (${ipLocation.region})",
                subtitle: "Region",
              ),
              IpLocationInfoRow(
                title: ipLocation.city,
                subtitle: "City",
              ),
              IpLocationInfoRow(
                title: "(${ipLocation.lat},${ipLocation.lon})",
                subtitle: "(Latitude, Longitude)",
              ),
              IpLocationInfoRow(
                title: ipLocation.timezone,
                subtitle: "Timezone",
              ),
              IpLocationInfoRow(
                title: ipLocation.isp,
                subtitle: "ISP name	",
              ),
              IpLocationInfoRow(
                title: ipLocation.org,
                subtitle: "Organization name",
              ),
              IpLocationInfoRow(
                title: ipLocation.as,
                subtitle: "AS number and organization",
              ),
            ],
          );
  }
}

class IpLocationInfoRow extends StatelessWidget {
  const IpLocationInfoRow(
      {super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 2,
      ),
      child: Card(
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
