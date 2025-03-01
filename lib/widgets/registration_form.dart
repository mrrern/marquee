import 'package:bodas/routes/linkspaper.dart';

class RegistrationForm extends ConsumerWidget {
  final _formKey = GlobalKey<FormState>();

  RegistrationForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Aquí empieza todo:", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              _buildTextField("Nombres y apellidos del novio"),
              _buildTextField("Nombres y apellidos de la novia"),
              _buildTextField("Teléfonos"),
              _buildTextField("Fecha de Nacimiento"),
              _buildTextField("Correo Electrónico"),
              _buildDropdownField("Tipo de ceremonia"),
              _buildTextField("Número de invitados"),
              _buildTextField("Lugar de la ceremonia"),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Guardar la información o enviar
                  }
                },
                child: Text("SOLICITAR COTIZACIÓN"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: ["Religiosa", "Civil", "Otro"].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (String? value) {},
      ),
    );
  }
}
