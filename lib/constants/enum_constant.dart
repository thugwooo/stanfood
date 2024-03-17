enum BottomNaviType { Home, Map, Register }

enum RegisterTabType { Main, Stan, Restaurant, BroadCast, Mukbang }

enum JobType { Youtuber, Entertainer, Influencer }

extension JobTypeExtension on JobType {
  String description() {
    switch (this) {
      case JobType.Youtuber:
        return '유튜버';
      case JobType.Entertainer:
        return '연예인';
      case JobType.Influencer:
        return '인플루언서';
      default:
        return '알 수 없음';
    }
  }
}

enum BroadcastType { TV, Youtube }

extension BroadcastTypeExtension on BroadcastType {
  String description() {
    switch (this) {
      case BroadcastType.TV:
        return 'TV';
      case BroadcastType.Youtube:
        return '유튜브';
    }
  }
}
