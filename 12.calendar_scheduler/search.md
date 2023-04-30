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
