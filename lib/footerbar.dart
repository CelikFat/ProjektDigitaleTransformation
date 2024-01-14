import 'package:flutter/material.dart';

class FooterBar extends StatelessWidget {
  const FooterBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromRGBO(0xD4, 0xA3, 0x73, 100),
      height: 45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _FooterBarButton(
            label: 'Impressum',
            onPressed: () {
              // Aktion für Impressum
            },
          ),
          _FooterBarButton(
            label: 'AGB',
            onPressed: () {
              // Aktion für AGB
            },
          ),
          _FooterBarButton(
            label: 'Datenschutz',
            onPressed: () {
              // Aktion für Datenschutz
            },
          ),
          _FooterBarButton(
            label: 'Über uns',
            onPressed: () {
              // Aktion für Über uns
            },
          ),
        ],
      ),
    );
  }
}

class _FooterBarButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;

  const _FooterBarButton({
    required this.label,
    required this.onPressed,
  });

  @override
  _FooterBarButtonState createState() => _FooterBarButtonState();
}

class _FooterBarButtonState extends State<_FooterBarButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: TextButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isHovered ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }

  void _onHover(bool hover) {
    setState(() {
      isHovered = hover;
    });
  }
}
