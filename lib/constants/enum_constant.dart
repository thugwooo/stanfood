enum BottomNaviType { Home, Map, Register }

enum RegisterTabType { Main, Stan, Restaurant, BroadCast, Mukbang }

enum JobType { Youtuber, Entertainer, Blogger, Influencer }

extension JobTypeExtension on JobType {
  String description() {
    switch (this) {
      case JobType.Youtuber:
        return '유튜버';
      case JobType.Entertainer:
        return '연예인';
      case JobType.Blogger:
        return '블로거';
      case JobType.Influencer:
        return '인플루언서';
      default:
        return '알 수 없음';
    }
  }
}
