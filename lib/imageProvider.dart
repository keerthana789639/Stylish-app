

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepro extends ChangeNotifier{


File? _image;

File? get image=>_image;

 
Future<void> imagepicking()async{

ImagePicker picker = ImagePicker();

final pick = await picker.pickImage(source: ImageSource.gallery);

if(pick!=null){

  _image =File(pick.path);


}

notifyListeners();

}

}