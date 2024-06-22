import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ticket_controller.dart';
import '../widgets/ticket_form.dart';

class UserView extends StatelessWidget{
  final TicketController ticketController = Get.find();

  @override  
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuário - Novo Ticket'),
      ),
      body: TicketForm(),
    );

  }
}