import 'package:flutter/material.dart';
import 'package:mnsolutions/src/common/components/Ink_well.component.dart';
import 'package:mnsolutions/src/common/components/border_wrapper.componet.dart';
import 'package:mnsolutions/src/common/components/card.component.dart';
import 'package:mnsolutions/src/common/components/fractionally_sized_box.component.dart';
import 'package:mnsolutions/src/common/components/video.dart';
import 'package:mnsolutions/src/common/constants/spacing.dart';

class ServiceRequestComponent extends StatelessWidget {
  final void Function() onTap;
  final String? video;
  final String title;
  final String description;
  final String state;

  const ServiceRequestComponent({
    super.key,
    this.video,
    required this.title,
    required this.description,
    required this.state,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CardComponent(
      child: InkWellComponent(
        onTap: onTap,
        child: Row(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: BorderWrapperComponent(
                  child: (video?.isNotEmpty == true)
                      ? VideoComponent(
                          url: video!,
                          aspectRatio: 1 / 1,
                        )
                      : const Center(
                          child: Icon(Icons.videocam_off_outlined),
                        ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: FractionallySizedBoxComponent(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: spacing[1]),
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[1]),
                        child: Text(
                          description,
                          maxLines: 3,
                          style: Theme.of(context).textTheme.bodySmall,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: spacing[1]),
                        child: TextButton.icon(
                          onPressed: () => {},
                          icon: const Icon(Icons.pending),
                          label: Text(state),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
