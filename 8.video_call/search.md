Navigator.of(context) 의 push method 를 사용하면 새로운 화면으로 이동할 수 있다

cam_screen.dart 에서 snapShot.hasData 를 쓰고 ConnectionState.waiting 같은걸 안 쓰는 이유는 ConnectionState 로 감시하고 있으면 ConnectionState 가 waiting 일 때 계속 rendering 이 되기 때문이라는데 기억해두자.