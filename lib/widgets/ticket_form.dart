import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/ticket_controller.dart';
import '../model/ticket_model.dart';

class TicketForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final companyController = TextEditingController();
  final roleController = TextEditingController();
  final sectorController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final moduleController = TextEditingController();
  final platformAreaController = TextEditingController();
  final TicketController ticketController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            _buildTextField(
              controller: nameController,
              label: 'Nome e Sobrenome',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira seu nome';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: companyController,
              label: 'Empresa',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o nome da empresa';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: roleController,
              label: 'Cargo ou Função',
            ),
            _buildTextField(
              controller: sectorController,
              label: 'Setor',
            ),
            _buildTextField(
              controller: titleController,
              label: 'Título da Solicitação',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o título da solicitação';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: descriptionController,
              label: 'Descrição do Pedido',
              maxLines: 3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira a descrição do pedido';
                }
                return null;
              },
            ),
            _buildTextField(
              controller: moduleController,
              label: 'Módulo (Dentista ou Gestão)',
            ),
            _buildTextField(
              controller: platformAreaController,
              label: 'Área da Plataforma',
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var ticket = Ticket(
                    protocol: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: nameController.text,
                    company: companyController.text,
                    role: roleController.text,
                    sector: sectorController.text,
                    title: titleController.text,
                    description: descriptionController.text,
                    module: moduleController.text,
                    platformArea: platformAreaController.text,
                    requestDate: DateTime.now(),
                  );
                  ticketController.addTicket(ticket);
                  Get.snackbar('Sucesso', 'Ticket criado com sucesso!');
                }
              },
              child: Text('Abrir Ticket'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        validator: validator,
        maxLines: maxLines,
      ),
    );
  }
}