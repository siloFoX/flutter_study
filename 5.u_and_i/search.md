callback 함수는 비동기로 작성되면 안된다고 했는데, 비동기로 어떻게 작성하지?

.of(context) 는 BuildContext 로 widget tree 에서 가장 가까운 값을 찾아낸다.
MediaQuery.of(context) 는 가장 가까운 MediaQuery 를 찾아내는 것이다.

DateTime 을 const 로 지정하는 방법은
DateTime(YYYY, MM, DD, ...) 이런식으로 매개변수로 주면 된다.