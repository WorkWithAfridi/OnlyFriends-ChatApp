import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageServices {
  pickImage(ImageSource imageSource) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? selectedImageFile = await imagePicker.pickImage(source: imageSource);
    if (selectedImageFile != null) {
      CroppedFile croppedImageFile = await _cropImage(selectedImageFile);
      Uint8List croppedAndCompressedImage =
          await _compressImage(croppedImageFile);
      return croppedAndCompressedImage;
    }
  }

  _cropImage(XFile selectedImageFile) async {
    return await ImageCropper().cropImage(
      sourcePath: selectedImageFile.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
    );
  }

  _compressImage(CroppedFile croppedImageFile) async {
    return await FlutterImageCompress.compressWithFile(
      croppedImageFile.path,
      quality: 30,
    );
  }
}
