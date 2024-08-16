import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class ShowIcon extends StatelessWidget {
  final String icon;
  const ShowIcon({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      //네트워크 이미지를 불러올때 사용하는 FadeInImage 위젯, 로드하는 동안에는 로딩애니메이션을 보여주고, 로드 실패했을 경우에는 대체이미지를 표시한다.
      placeholder: 'assets/images/loading.gif',
      image: 'https://$kIconHost/img/wn/$icon@4x.png',
      width: 96,
      height: 96,
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/no_image_icon.png',
          width: 96,
          height: 96,
        );
      },
    );
  }
}
