import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/ticket_controller.dart';

class CheckTicketView extends StatelessWidget{
  final protocolController = TextEditingController();
  final TicketController ticketController = Get.find();

  @override  
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: protocolController,
              decoration: InputDecoration(labelText: 'Número do Protocolo' ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                var protocol = protocolController.text;
                var ticket = ticketController.getTicketByProtocol(protocol);
                if (ticket != null){
                    Get.dialog(
                      AlertDialog(
                        title: Text('Detalhes do Ticket'),
                        content: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Nome: ${ticket.name}'),
                            Text('Empresa: ${ticket.company}'),
                            Text('Cargo: ${ticket.role}'),
                            Text('Setor: ${ticket.sector}'),
                            Text('Titulo: ${ticket.title}'),
                            Text('Descrição: ${ticket.description}'),
                            Text('Modulo: ${ticket.module}'),
                            Text('Área da plataforma: ${ticket.platformArea}'),
                            Text('Data da Solicitação: ${ticket.requestDate}'),
                            Text('Status: ${ticket.status}'),
                            if (ticket.status == 'Vermelho')
                                Text('Motivo da Pendência: ${ticket.pendingReason}'),
                            
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: ()=> Get.back(), 
                            child: Text('Fechar'),
                            ),
                        ],
                      ),
                    );
           
              } else {
                Get.snackbar('Erro', 'Protocolo não encontrado');
              }
            },
              child: Text('Consultar Ticket'),
              ),
          ],
        ),
        ),
    );
  }
  

}