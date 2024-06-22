import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_suporte/model/ticket_model.dart';

import '../controller/ticket_controller.dart';

class DeveloperView extends StatelessWidget{
  final TicketController ticketController= Get.find();

  @override  
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Desenvolvedor - Tickets Abertos'),
      ),
      body: Obx(
        ()=> ListView.builder(
          itemCount: ticketController.tickets.length,
          itemBuilder: (context, index){
            var ticket = ticketController.tickets[index];
            return ListTile(
              title: Text(ticket.title),
              subtitle: Text('Solicitado por ${ticket.name} em ${ticket.requestDate}'),
              trailing: Icon(
                Icons.circle,
                color: ticket.status == "Cinza"
                ?Colors.grey
                :ticket.status == "Amarelo"
                ?Colors.yellow
                :ticket.status == "Vermelho"
                ?Colors.red
                :Colors.green,
              ),
              onTap: () {
                Get.to(TicketDetailView(ticket:ticket));
              },
            );
          },
        ),
      ),
    );
  }

}

class TicketDetailView extends StatelessWidget {
  final Ticket ticket;
  final descriptionController = TextEditingController();

  TicketDetailView({required this.ticket});

  @override   
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text('Nome: ${ticket.name}'),
            Text('Emrpresa: ${ticket.company}'),
            Text('Cargo: ${ticket.role}'),
            Text('Setor: ${ticket.sector}'),
            Text('Titulo: ${ticket.title}'),
            Text('Descrição: ${ticket.description}'),
            Text('Modulo: ${ticket.module}'),
            Text('Área da plataforma: ${ticket.platformArea}'),
            Text('Data da solicitação: ${ticket.requestDate}'),
            TextFormField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: 'Motivo da pendência (se houver)'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: (){
                    Get.find<TicketController>().updateTicketStatus(ticket.protocol, "Amarelo");
                    Get.back();  
                  }, 
                  child: Text('Aceito'),
                  ),
                  ElevatedButton(
                  onPressed: (){
                    Get.find<TicketController>().updateTicketStatus(ticket.protocol, "Vermelho", reason: descriptionController.text);
                    Get.back();  
                  }, 
                  child: Text('Pendente'),
                  ),
                  ElevatedButton(
                  onPressed: (){
                    Get.find<TicketController>().updateTicketStatus(ticket.protocol, "Verde");
                    Get.back();  
                  }, 
                  child: Text('Concluído'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}