import 'package:flutter/material.dart';

import '../constants.dart';
import '../modals/countrymodel.dart';

class CountryCode extends StatefulWidget {
  CountryCode({Key? key, required this.setCountryData}) : super(key: key);
  final Function setCountryData;

  @override
  State<CountryCode> createState() => _CountryCodeState();
}

class _CountryCodeState extends State<CountryCode> {
  var code = "+91";
  var name = "India";
  List<CountryModel> country = [
    CountryModel(code: "+91", flag: "🇮🇳", name: "India"),
    CountryModel(code: "+92", flag: "🇵🇰", name: "Pakistan"),
    CountryModel(code: "+1", flag: "🇺🇸", name: "United states"),
    CountryModel(code: "+27", flag: "🇿🇦", name: "South Africa"),
    CountryModel(code: "+93", flag: "🇦🇫", name: "Afghanistan"),
    CountryModel(code: "+44", flag: "🇬🇧", name: "United Kingdom"),
    CountryModel(code: "+39", flag: "🇮🇹", name: "Italy"),
    CountryModel(code: "+94", flag: "🇱🇰", name: "Sri lanka"),
    CountryModel(code: "+2", flag: "🇨🇦", name: "Canada"),
    CountryModel(code: "+55", flag: "🇲🇾", name: "Malaysia"),
    CountryModel(code: "+91", flag: "🇮🇳", name: "India"),
    CountryModel(code: "+92", flag: "🇵🇰", name: "Pakistan"),
    CountryModel(code: "+1", flag: "🇺🇸", name: "United states"),
    CountryModel(code: "+27", flag: "🇿🇦", name: "South Africa"),
    CountryModel(code: "+93", flag: "🇦🇫", name: "Afghanistan"),
    CountryModel(code: "+44", flag: "🇬🇧", name: "United Kingdom"),
    CountryModel(code: "+39", flag: "🇮🇹", name: "Italy"),
    CountryModel(code: "+94", flag: "🇱🇰", name: "Sri lanka"),
    CountryModel(code: "+2", flag: "🇨🇦", name: "Canada"),
    CountryModel(code: "+55", flag: "🇲🇾", name: "Malaysia"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: primary_color),
        ),
        title: Text(
          "Choose a country",
          style: TextStyle(color: primary_color),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: primary_color,
            ),
          )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: country.length,
          itemBuilder: (context, index) {
            return customTile(
              country[index],
            );
          },
        ),
      ),
    );
  }

  Widget customTile(CountryModel country) {
    return GestureDetector(
      onTap: () {
        widget.setCountryData(country);
      },
      child: Card(
        child: ListTile(
          leading: Text(
            country.flag,
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          title: Text(
            country.name,
            style: TextStyle(fontSize: 18),
          ),
          trailing: Text(
            country.code,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
