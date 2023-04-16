ImagePicker 는 여러개 사진까지는 가능하지만 사진이랑 동영상을 동시에 선택하는 것은 불가능한 것 같다.

super.initState() 에서 build 가 실행되는 것인가?
-> 비동기 이기 때문에 동시에 실행되는 것으로 보인다.
-> build 에서는 비동기를 상정하고 condition 으로 처리하는 것이 좋다.

covariant 는 공변이라고 하는데, 이걸 쓰게되면 super class 를 상속받는 class 를 지정해서 parameter 로 받을 수 있게 된다.

  (Animal)
      /\
(Mouse)(Cat)

Animal 의 method 에 chase 라고 있을 때,
Cat 에 overrode 된 chase 의 매개변수에
Animal animalName 대신,
covariant Mouse mouseName 으로 특정지을 수 있다.

그렇다면

class Human {
  void hunt (Animal animalName) { ... }
}

class CatWoman extends Human {
  @override
  void hunt (covariant Mouse mouseName) { ... }
}

이렇게도 가능한걸까?
-> 직접 실행해보자