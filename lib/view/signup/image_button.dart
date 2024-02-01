import 'package:aureus_jobbox/constants.dart' as constants;
import 'package:aureus_jobbox/provider/image_change_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ImageChangeProvider>(
        builder: (context, imageChangeProvider, child) {
      return ClipRRect(
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(75),
              border: Border.all(
                  color: imageChangeProvider.imageString.compareTo("") == 0
                      ? constants.COLORS.black
                      : Colors.transparent),
            ),
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),

                // Utilised Provider to retrieve the state for the image
                image: DecorationImage(
                  image: NetworkImage(imageChangeProvider.imageString),
                  fit: BoxFit.fill,
                ),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(75),

                // Just an example of setting a placeholder image URI, storing the state using Provider
                onTap: () {
                  imageChangeProvider.setImageString(
                      "https://cdn.pixabay.com/photo/2022/12/02/14/13/desert-7630943_1280.jpg");
                },
                child: Align(
                  child: Container(
                      // Setting a default display if no images are uploaded
                      child: imageChangeProvider.imageString.compareTo("") == 0
                          ? const Text(
                              constants.ADD_PHOTO_LABEL,
                              softWrap: true,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: constants.STYLES.labelStyle,
                            )
                          : const Text("")),
                ),
              ),
            ),
          )
        ]),
      );
    });
  }
}
