import 'package:flutter/material.dart';

class Ticket {
  final String protocol;
  final String name;
  final String company;
  final String role;
  final String sector;
  final String title;
  final String description;
  final String module;
  final String platformArea;
  final DateTime requestDate;
  String status;
  String? pendingReason;

  Ticket({
  required this.protocol,
  required this.name,
  required this.company,
  required this.role,
  required this.sector,
  required this.title,
  required this.description,
  required this.module,
  required this.platformArea,
  required this.requestDate,
  this.status = "Cinza",
  this.pendingReason,

});

Color get statusColor {
  switch (status){
    case 'Amarelo':
      return Colors.yellow;
    case 'Vermelho':
      return Colors.red;
    case 'Verde':
      return Colors.green;
    default:
      return Colors.grey;    
  }
}

}

