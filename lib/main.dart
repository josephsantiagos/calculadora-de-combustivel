import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraCombustivelApp());
}

class CalculadoraCombustivelApp extends StatelessWidget {
  const CalculadoraCombustivelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calc Combustivel',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final _formKey = GlobalKey<FormState>();
  final _distanciaController = TextEditingController();
  final _litrosController = TextEditingController();
  final _precoController = TextEditingController();

  double? _consumoKmL;
  double? _consumoL100Km;
  double? _custoPorKm;
  double? _custoTotal;

  @override
  void dispose() {
    _distanciaController.dispose();
    _litrosController.dispose();
    _precoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de Combustivel')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Calcule o consumo e o custo da viagem em segundos.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 6),
                Text(
                  'O app funciona offline e nao coleta dados pessoais.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _distanciaController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Distancia percorrida (km)',
                    hintText: 'Ex.: 120',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      _validarNumeroPositivo(value, 'a distancia'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _litrosController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Combustivel gasto (litros)',
                    hintText: 'Ex.: 8.5',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      _validarNumeroPositivo(value, 'a quantidade de litros'),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _precoController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  decoration: const InputDecoration(
                    labelText: 'Preco por litro (R\$)',
                    hintText: 'Ex.: 6.19',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      _validarNumeroPositivo(value, 'o preco por litro'),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _calcular,
                        child: const Text('Calcular'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _limpar,
                        child: const Text('Limpar'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (_consumoKmL != null &&
                    _consumoL100Km != null &&
                    _custoPorKm != null &&
                    _custoTotal != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Resultado',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Consumo medio: ${_consumoKmL!.toStringAsFixed(2)} km/L',
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Equivalente: ${_consumoL100Km!.toStringAsFixed(2)} L/100 km',
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Custo por km: R\$ ${_custoPorKm!.toStringAsFixed(2)}',
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Custo total da viagem: R\$ ${_custoTotal!.toStringAsFixed(2)}',
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? _validarNumeroPositivo(String? value, String nomeCampo) {
    if (value == null || value.trim().isEmpty) {
      return 'Informe $nomeCampo.';
    }

    final numero = _parseNumero(value);
    if (numero == null || numero <= 0) {
      return 'Digite um valor numerico maior que zero.';
    }

    return null;
  }

  double? _parseNumero(String value) {
    return double.tryParse(value.replaceAll(',', '.').trim());
  }

  void _calcular() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    final distancia = _parseNumero(_distanciaController.text)!;
    final litros = _parseNumero(_litrosController.text)!;
    final preco = _parseNumero(_precoController.text)!;

    final consumoKmL = distancia / litros;
    final consumoL100Km = (litros / distancia) * 100;
    final custoTotal = litros * preco;
    final custoPorKm = custoTotal / distancia;

    setState(() {
      _consumoKmL = consumoKmL;
      _consumoL100Km = consumoL100Km;
      _custoTotal = custoTotal;
      _custoPorKm = custoPorKm;
    });
  }

  void _limpar() {
    _formKey.currentState?.reset();
    _distanciaController.clear();
    _litrosController.clear();
    _precoController.clear();

    setState(() {
      _consumoKmL = null;
      _consumoL100Km = null;
      _custoTotal = null;
      _custoPorKm = null;
    });
  }
}
