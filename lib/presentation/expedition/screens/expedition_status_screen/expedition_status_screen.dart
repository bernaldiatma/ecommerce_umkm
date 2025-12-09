import 'package:ecommerce_umkm/utility/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'components/radio_button_status_choice.dart';

class ExpeditionStatusScreen extends StatefulWidget {
  const ExpeditionStatusScreen({Key? key}) : super(key: key);

  @override
  State<ExpeditionStatusScreen> createState() => _ExpeditionStatusScreen();
}

class _ExpeditionStatusScreen extends State<ExpeditionStatusScreen> {
  int _selectedStatusMethod = 0;
  late int _initialStatus;

  @override
  void initState() {
    super.initState();
    _initialStatus = _selectedStatusMethod;
  }

  void _performSave() {
    print("Data disimpan: Status $_selectedStatusMethod");

    setState(() {
      _initialStatus = _selectedStatusMethod;
    });
  }

  void _handleSaveButton() {
    _performSave();

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Status berhasil diperbarui", style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _handleDialogSaveAndExit() {
    _performSave();
    Navigator.of(context).pop();
  }

  Future<void> _showUnsavedChangesDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Konfirmasi',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          content: const Text(
            'Data telah berubah, apakah ingin menyimpan perubahan sebelum keluar?',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Tidak', style: TextStyle(color: Colors.grey.shade700)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Ya',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _handleDialogSaveAndExit();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool hasChanges = _selectedStatusMethod != _initialStatus;

    return PopScope(
      canPop: !hasChanges,
      onPopInvoked: (didPop) async {
        if (didPop) return;
        _showUnsavedChangesDialog();
      },
      child: Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: const Text(
            "Status Pengiriman",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Builder(
          builder: (context) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioButtonStatusChoice(
                          grupValue: _selectedStatusMethod,
                          onChanged: (int? newValue) {
                            setState(() {
                              _selectedStatusMethod = newValue ?? 0;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        _handleSaveButton();
                      },
                      child: const Text(
                        "Simpan",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
