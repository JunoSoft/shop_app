import 'package:flutter/material.dart';

class EditProductsScreen extends StatefulWidget {
  static const nameRoute = '/edit-product ';
  const EditProductsScreen({super.key});

  @override
  State<EditProductsScreen> createState() => _EditProductsScreenState();
}

class _EditProductsScreenState extends State<EditProductsScreen> {
  
  
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  @override
  void dispose() {
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(label: Text('Title')),
              textInputAction: TextInputAction.next,
              onFieldSubmitted:(_){
                FocusScope.of(context).requestFocus(_priceFocusNode);
              } ,
            ),
            TextFormField(
              decoration: const InputDecoration(label: Text('Price')),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              focusNode: _descriptionFocusNode,
            ),
             TextFormField(
              decoration: const InputDecoration(label: Text('description')),
              textInputAction: TextInputAction.next,
              maxLines: 3,
              keyboardType: TextInputType.multiline,
             
            ),
          ],
        )),
      ),
    );
  }
}
