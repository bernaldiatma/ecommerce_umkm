import 'package:flutter/material.dart';

class OldCustomSearchBar extends StatefulWidget{
  final TextEditingController controller;
  final void Function(String)? onChanged;

  const OldCustomSearchBar({super.key, required this.controller, this.onChanged});

  @override
  State<OldCustomSearchBar> createState() => _OldCustomSearchBarState();
}

class _OldCustomSearchBarState extends State<OldCustomSearchBar> {
  bool isExpanded = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build (BuildContext context){
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          if (!isExpanded) {
            _focusNode.unfocus();
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isExpanded ? Colors.grey.shade300 : Colors.white,
        ),
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: FocusScope(
          node: FocusScopeNode(),
          child: Row(
            children: [
              const Icon(Icons.search),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  focusNode: _focusNode,
                  controller: widget.controller,
                  decoration: const InputDecoration(
                    hintText: 'Search...',
                    border: InputBorder.none,
                  ),
                  autofocus: false,
                  onChanged: widget.onChanged,
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.controller.clear();
                  _focusNode.unfocus();
                },
                child: const Icon(Icons.close),
              ),
            ],
          ),
        ),
      ),
    );
  }
}