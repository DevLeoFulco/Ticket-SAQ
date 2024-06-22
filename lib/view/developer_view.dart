import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticket_suporte/model/ticket_model.dart';

import '../controller/ticket_controller.dart';

class DeveloperView extends StatelessWidget {
  final TicketController ticketController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desenvolvedor - Tickets Abertos'),
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: ticketController.tickets.length,
          itemBuilder: (context, index) {
            var ticket = ticketController.tickets[index];
            return ListTile(
              title: Text(ticket.title),
              subtitle: Text('Solicitado por ${ticket.name} em ${ticket.requestDate}'),
              trailing: Icon(
                Icons.circle,
                color: ticket.statusColor, // Usando a propriedade statusColor
              ),
              onTap: () {
                Get.to(TicketDetailView(ticket: ticket));
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
  final TextEditingController descriptionController = TextEditingController();

  TicketDetailView({required this.ticket});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Ticket'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow('Nome:', ticket.name),
            _buildDetailRow('Empresa:', ticket.company),
            _buildDetailRow('Cargo:', ticket.role),
            _buildDetailRow('Setor:', ticket.sector),
            _buildDetailRow('Título:', ticket.title),
            _buildDetailRow('Descrição:', ticket.description),
            _buildDetailRow('Módulo:', ticket.module),
            _buildDetailRow('Área da plataforma:', ticket.platformArea),
            _buildDetailRow('Data da solicitação:', ticket.requestDate.toString()),
            SizedBox(height: 20),
            Text(
              'Motivo da Pendência (se houver):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Descreva o motivo da pendência',
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.find<TicketController>().updateTicketStatus(ticket.protocol, "Amarelo");
                    Get.back();
                  },
                  child: Text('Aceito'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.find<TicketController>().updateTicketStatus(ticket.protocol, "Vermelho", reason: descriptionController.text);
                    Get.back();
                  },
                  child: Text('Pendente'),
                ),
                ElevatedButton(
                  onPressed: () {
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

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}