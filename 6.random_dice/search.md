TabController 를 초기화하려면 vsync 기능이 필요한데, TickerProviderMixin 에서 제공해준다.
-> vsync : 모니터에 출력과 프레임을 동기화 하는 것 (수직동기화 라고도 함)
프레임 당 한번씩만 rendering 되게 해주는 것이다.

listener 를 등록하면 widget 이 dispose 될 때 같이 삭제시켜줘야하는 이유는 뭘까?
-> 그냥 memory leak 때문인 듯 자세한건 나중에 찾아보자

추가
initState 에서는 BuildContext 를 사용할 수 없다고 한다.