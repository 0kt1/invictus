import 'package:flutter/material.dart';
import 'package:invictus/components/post.dart';

class SchemeData {
  final String Scheme_Name; // e.g., "14-02-2025"
  final String Scheme_Category;
  final String State_Applicability;
  final String Launching_Authority;
  final String Eligibility_Cirteria;
  final String Key_Benefits;
  final String Application_Process;
  final String Documents_Required;

  SchemeData(
      this.Scheme_Name,
      this.Scheme_Category,
      this.State_Applicability,
      this.Launching_Authority,
      this.Eligibility_Cirteria,
      this.Key_Benefits,
      this.Application_Process,
      this.Documents_Required);
}

class SchemesPage extends StatefulWidget {
  const SchemesPage({super.key});

  @override
  State<SchemesPage> createState() => _SchemesPageState();
}

class _SchemesPageState extends State<SchemesPage> {
  List<SchemeData> data = [
    SchemeData(
        "Pradhan Mantri Fasal Bima Yojana (PMFBY) / प्रधानमंत्री फसल बीमा योजना",
        "Crop Insurance",
        "All India",
        "\"Ministry of Agriculture & Farmers Welfare, Government of India Implemented in collaboration with state governments and empanelled insurance companies.\"",
        "\"All farmers, including: -Loanee farmers (compulsory enrollment if taking crop loans). -Non-loanee farmers (voluntary enrollment). -Farmers growing notified crops in notified areas. Sharecroppers and tenant farmers (if state government recognizes them).\"",
        "Key_Benefits",
        "Application_Process",
        "Documents_Required"
    ),
    SchemeData(
        "Pradhan Mantri Fasal Bima Yojana (PMFBY) / प्रधानमंत्री फसल बीमा योजना",
        "Crop Insurance",
        "All India",
        "\"Ministry of Agriculture & Farmers Welfare, Government of India Implemented in collaboration with state governments and empanelled insurance companies.\"",
        "\"All farmers, including: -Loanee farmers (compulsory enrollment if taking crop loans). -Non-loanee farmers (voluntary enrollment). -Farmers growing notified crops in notified areas. Sharecroppers and tenant farmers (if state government recognizes them).\"",
        "Key_Benefits",
        "Application_Process",
        "Documents_Required"
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Schemes"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: data.map((e) => 
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 2.0,
              child: Container(
                child: Text(e.Scheme_Name),
              ),
            ),
          )
          
          ).toList()
        ),
      ),
    );
  }
}
