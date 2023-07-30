import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mnsolutions/src/common/components/Ink_Well.component.dart';
import 'package:mnsolutions/src/common/components/border_wrapper.componet.dart';
import 'package:mnsolutions/src/common/models/banner_model.dart';
import 'package:mnsolutions/src/features/core/redux/core_state.dart';
import 'package:mnsolutions/src/redux/app_state.dart';
import 'package:redux/redux.dart';

class CarouselComponent extends StatelessWidget {
  const CarouselComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CoreState>(
      converter: (Store<AppState> store) => store.state.core!,
      builder: (BuildContext context, CoreState coreState) {
        if (coreState.bannersLoading == true) return Container();
        if (coreState.bannersFailure == true) {
          return Text(coreState.bannersError ?? 'Error getting banners');
        }
        if (coreState.banners?.isNotEmpty == true) {
          List<BannerModel> banners = coreState.banners!;
          return CarouselSlider.builder(
            itemCount: banners.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    BorderWrapperComponent(
              child: InkWellComponent(
                onTap: () {},
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    banners[itemIndex].url ?? '',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            options: CarouselOptions(
              autoPlay: true,
              clipBehavior: Clip.antiAlias,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              enlargeFactor: 0.15,
            ),
          );
        }
        return Container();
      },
    );
  }
}
