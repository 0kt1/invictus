import 'package:flutter/material.dart';

// class Market extends StatefulWidget {
//   const Market({super.key});

//   @override
//   State<Market> createState() => _MarketState();
// }

// class _MarketState extends State<Market> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

class Market extends StatefulWidget {
  @override
  _MarketState createState() => _MarketState();
}

class _MarketState extends State<Market> {
  String selectedDistrict = "Lucknow";
  String selectedMandi = "Lucknow";
  String selectedCommodity = "Pulses";
  String quoteDate = "14/02/2025";

  final List<Map<String, dynamic>> marketData = [
    {"name": "Moong (green)", "wholesale": 8730, "retail": 100},
    {"name": "Gram", "wholesale": 7490, "retail": 85},
    {"name": "Urad (black)", "wholesale": 8900, "retail": 102},
    {"name": "Urd Dal Kali (Shilkeed)", "wholesale": 10220, "retail": 125},
    {"name": "Gram lentils", "wholesale": 8430, "retail": 95},
    {"name": "Peas white", "wholesale": 4730, "retail": 54},
    {"name": "Pea lentils", "wholesale": 4980, "retail": 58},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Market Price Lookup")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(labelText: "District"),
                    value: selectedDistrict,
                    items: ["Lucknow"].map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedDistrict = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(labelText: "Mandi"),
                    value: selectedMandi,
                    items: ["Lucknow"].map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedMandi = newValue.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(labelText: "Commodity"),
                    value: selectedCommodity,
                    items: ["Pulses"].map((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCommodity = newValue.toString();
                      });
                    },
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(labelText: "Quote Date"),
                    controller: TextEditingController(text: quoteDate),
                    readOnly: true,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              child: Text("Search"),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 20,
                  columns: [
                    DataColumn(label: Text("#")),
                    DataColumn(label: Text("Name")),
                    DataColumn(label: Text("Wholesale ₹/Qtl")),
                    DataColumn(label: Text("Retail ₹/Kg")),
                  ],
                  rows: marketData
                      .asMap()
                      .entries
                      .map((entry) => DataRow(cells: [
                            DataCell(Text((entry.key + 1).toString())),
                            DataCell(Text(entry.value["name"])),
                            DataCell(Text(entry.value["wholesale"].toString())),
                            DataCell(Text(entry.value["retail"].toString())),
                          ]))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
