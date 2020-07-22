
import 'package:flutter/material.dart';

class ChatMensaje {
  final String mensaje;
  final bool enviadoPorMi;
  final String date;
  final Image imagen;
  final bool envioImagen;

  ChatMensaje({
    this.mensaje,
    this.enviadoPorMi,
    this.date,
    this.imagen,
    this.envioImagen,
  });
}