enum BottomNaviType { Home, Map, Register }

enum RegisterTabType { Main, Stan, Restaurant, BroadCast, Mukbang }

enum ChannelType { TV, Youtube, SNS, Blog }

extension ActiveChannelExtension on ChannelType {
  String description() {
    switch (this) {
      case ChannelType.TV:
        return 'TV';
      case ChannelType.Youtube:
        return '유튜브';
      case ChannelType.SNS:
        return 'SNS';
      case ChannelType.Blog:
        return '블로그';
      default:
        return '';
    }
  }
}
