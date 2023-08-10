import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AvatarComponent extends StatefulWidget {
  final String url;
  final IconData? icon;
  final double size;
  final AlignmentGeometry positionIcon;
  final double positionIconV;
  final double positionIconH;
  final double radiusIcon;
  final double sizeIcon;
  final Color colorIconBg;
  final Function(File)? onGetImage;
  const AvatarComponent(this.url,
      {super.key,
      this.size = 60,
      this.icon,
      this.positionIcon = AlignmentDirectional.bottomEnd,
      this.positionIconV = 140,
      this.positionIconH = 120,
      this.radiusIcon = 16,
      this.sizeIcon = 50,
      this.colorIconBg = Colors.white,
      this.onGetImage});

  @override
  State<AvatarComponent> createState() => _AvatarComponentState();
}

class _AvatarComponentState extends State<AvatarComponent> {
  File? galleryFile;
  final picker = ImagePicker();

  void _showPicker({
    required BuildContext context,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Photo Library'),
                onTap: () {
                  getImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Camera'),
                onTap: () {
                  getImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
          widget.onGetImage!(galleryFile!);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.positionIconV,
      height: widget.positionIconH,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundImage: (galleryFile == null
                ? NetworkImage(widget.url)
                : FileImage(galleryFile!)) as ImageProvider,
            radius: widget.size,
          ),
          widget.icon != null
              ? Align(
                  alignment: widget.positionIcon,
                  child: Material(
                    color: widget.colorIconBg,
                    borderRadius: BorderRadius.circular(widget.radiusIcon),
                    child: InkWell(
                      onTap: () {
                        _showPicker(context: context);
                      },
                      borderRadius: BorderRadius.circular(widget.radiusIcon),
                      child: Container(
                        width: widget.sizeIcon,
                        height: widget.sizeIcon,
                        alignment: Alignment.center,
                        child: Icon(widget.icon),
                      ),
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
