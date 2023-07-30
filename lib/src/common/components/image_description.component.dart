import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/components/Ink_well.component.dart';
import 'package:mnsolutions/src/common/components/border_wrapper.componet.dart';
import 'package:mnsolutions/src/common/components/card.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';

class ImageDescriptionComponent extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final void Function() onTap;

  const ImageDescriptionComponent({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: InkWellComponent(
        onTap: onTap,
        child: Stack(
          children: [
            Column(
              children: [
                BorderWrapperComponent(
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      scale: 2,
                    ),
                  ),
                ),
                FractionallySizedBoxComponent(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: spacing[2]),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[1]),
                        child: Text(
                          description,
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              right: 0,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.info_outline),
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
