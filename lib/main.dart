import 'package:flutter/material.dart';

void main() {
  runApp(BancoApp());
}

class BancoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransacaoScreen(),
    );
  }
}

class TransacaoScreen extends StatefulWidget {
  @override
  _TransacaoScreenState createState() => _TransacaoScreenState();
}

class _TransacaoScreenState extends State<TransacaoScreen> {
  final List<String> _transacoes = [];
  final TextEditingController _controller = TextEditingController();

  void _adicionarTransacao() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        _transacoes.add(_controller.text);
        _controller.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Aplicação Bancária',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.green,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Descrição da transação',
                labelStyle: TextStyle(color: Colors.green),
                hintText: 'Digite a descrição...',
                hintStyle: TextStyle(color: Colors.green),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _adicionarTransacao,
              child: Text(
                'Adicionar Transação',
                style: TextStyle(color: Colors.green),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _transacoes.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(
                        _transacoes[index],
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
