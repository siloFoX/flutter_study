## 코드팩토리의 플러터 프로그래밍 책 내용을 clone coding 하면서 각 장 별로 검색한 것들을 정리했습니다.

<br>

### 1. default widget
---
아이콘은 glyph 기반을 사용할 수 있다.
-> glyph 란 형태를 말한다. 주로 문자의 모양이나 형태를 말한다. 문자 자체의 추상화로 이해하면 될 것 같다. 뜻을 분리한 형태라고도 생각한다. 추가적으로 symbol 도 포함되는 것 같다. 표현이 생각보다 큰 범위를 나타내는 것 같다.

<br>

### 2. splash screen
---
prototype 용 program :
  - figma
  - adobe xd
  - flutter flow : no code solution

dir structure 예시
  - screen : screen 전체에 해당되는 widget
  - component : 공통 widget
  - model
  - const

Column widget 은 
세로로 최대를 차지, 가로로 최소를 차지
Row 는 반대

CircularProgressIndicator 는 backgroundColor 와 valueColor 를 제공하는데 valueColor 가 애니메이션 색상이다. 그러나 valueColor 는 색상이 애니메이션이 되어야 해서 정적인 Colors.white 이런 것을 입힐 수 없다.
그래서 AlwaysStoppedAnimation 이라는 class 에 감싸서 색을 넣어줘야 한다.

<br>

### 3. blog web app
---
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

<br>

### 4. image carousel
---

<br>

### 5. u and i
---
callback 함수는 비동기로 작성되면 안된다고 했는데, 비동기로 어떻게 작성하지?

.of(context) 는 BuildContext 로 widget tree 에서 가장 가까운 값을 찾아낸다.
MediaQuery.of(context) 는 가장 가까운 MediaQuery 를 찾아내는 것이다.

DateTime 을 const 로 지정하는 방법은
DateTime(YYYY, MM, DD, ...) 이런식으로 매개변수로 주면 된다.

<br>

### 6. random dice
---
TabController 를 초기화하려면 vsync 기능이 필요한데, TickerProviderMixin 에서 제공해준다.
-> vsync : 모니터에 출력과 프레임을 동기화 하는 것 (수직동기화 라고도 함)
프레임 당 한번씩만 rendering 되게 해주는 것이다.

listener 를 등록하면 widget 이 dispose 될 때 같이 삭제시켜줘야하는 이유는 뭘까?
-> 그냥 memory leak 때문인 듯 자세한건 나중에 찾아보자

추가
initState 에서는 BuildContext 를 사용할 수 없다고 한다.
-> 다른 곳에서는 사용할 수 있다고 한다. 뭐지
-> 비동기성 때문에 가능한 것 같다.

<br>

### 7. vid player
---
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

<br>

### 8. video call
---
Navigator.of(context) 의 push method 를 사용하면 새로운 화면으로 이동할 수 있다

cam_screen.dart 에서 snapShot.hasData 를 쓰고 ConnectionState.waiting 같은걸 안 쓰는 이유는 ConnectionState 로 감시하고 있으면 ConnectionState 가 waiting 일 때 계속 rendering 이 되기 때문이라는데 기억해두자.

<br>

### 9. chool check
---

<br>

### 10. image editor
---
.. : cascade<br>
... : spread operator

is : 같은 타입이면 true, i 는 반대<br>
as : downcasting<br>
_example code_<br>
class A<br>
class B extends A<br>
B b1;<br>
A a = b1;<br>
if (a is B) {<br>
&nbsp;&nbsp;B b2 = a as B;<br>
}

<br>

### 11. cf tube
---

<br>

### 12. calendar scheduler
---
drift 에 관련된 table 을 등록하면 자동으로 code 를 생성하는데 그것들을 사용하려면 part 파일로 지정해줘야 한다.<br>
part file 으로는 private 값들도 사용할 수 있다. 방법은 file_name.dart 라고 되어있으면, file_name.g.dart 로 import 하면 된다.<br>
drift 에서 code generation 된 class 는 _$ClassName 형태이다.

table 에 insert 하기 위해서는 companion class 를 통해서 해야하는데, drift의 특성인건지 flutter 에서 권장사항으로 규정해놓은 내용인지 확인해봐야겠다. <br>
-> drift 는 SQLite 를 dart 기반으로 사용하게 하는 plugin 이어서 그렇다.

drift 의 database 는 schemaVersion 값으로 table 의 변화를 감지하는 것 같다.

get_it 으로는 dependency injection 을 구현하는데 전역으로 Singleton 값을 선언해준다.

?? : null operator, null 값 일 경우에는 좌측 아닐 때는 우측 값을 return<br>
??= : null-aware assignment, null 일 때만 assign

android 에서는 10.0.2.2 가 localhost ip

Map object 에 update method 가 있는데, <br>
update(key, (value) => something, ifAbsent : () => default value);<br>
이런 식으로 쓰고 key 에 해당되는 값이 없으면 default value 값이 key 에 들어간다. 

notifyListeners() 를 실행하면 watch() 하는 모든 widget 의 build() 가 다시 실행된다.<br>
그래서 cache 를 watch 하게 해야한다.

drift 를 사용할 때는 StreamBuilder 로 listening 해서 build 했지만 provider 는 그냥 StatelessWidget 자체를 build 해버리기 때문에 쓸 필요가 없다.

provider 는 notifyListeners 가 실행될 때 build 해버리는 watch 와 FutureBuilder 같이 값을 가져오는 read 함수를 사용한다.

late 는 initialize 를 지연할 수 있다.

<br>

### 13. hive db practice
---
