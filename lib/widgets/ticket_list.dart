import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_suporte/view/developer_view.dart';

import '../controller/ticket_controller.dart';
import '../model/ticket_model.dart';

class TicketList extends StatelessWidget{
  final TicketController ticketController = Get.find();

  @override   
  Widget build(BuildContext context){
    return Obx(
      ()=> ListView.builder(
        itemCount: ticketController.tickets.length,
        itemBuilder: (context, index) {
          var ticket = ticketController.tickets[index];
          return ListTile(
            title: Text(ticket.title),
            subtitle: Text('Solicitado por ${ticket.name} em ${ticket.requestDate}'),
            trailing: Icon(
              Icons.circle,
              color: ticket.status == "Cinza"
              ? Colors.grey
              :ticket.status == "Amarelo"
                ?Colors.yellow
                :ticket.status == "Vermelho"
                  ?Colors.red
                  :Colors.green,
            ),
            onTap: () {
              Get.to(TicketDetailView(ticket: ticket));
            },
          );
        },
      ),
      
    );
  }


}