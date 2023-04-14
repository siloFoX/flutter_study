각 os 별로 접근권한을 설정하는 native 설정을 해줘야한다.

android/build.gradle 은 프로젝트 파일이다.
classpath 나 repository 정보 가 있다.

android/app/build.gradle 은 모듈 파일이다.
의존성이나 version 정보를 관리한다.

변수에 ? 를 넣으면 null 값이 들어갈 수 있는데 그 변수에 method 를 호출할 때 !를 넣으면 null 값이 아니라는 것을 확신하는 행위이다.

Controller? controller;

if (controller != null) {
  controller!.methodExample();
}

이런 식으로 말이다.