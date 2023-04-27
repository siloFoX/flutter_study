drift 에 관련된 table 을 등록하면 자동으로 code 를 생성하는데 그것들을 사용하려면 part 파일로 지정해줘야 한다.<br>
part file 으로는 private 값들도 사용할 수 있다. 방법은 file_name.dart 라고 되어있으면, file_name.g.dart 로 import 하면 된다.<br>
drift 에서 code generation 된 class 는 _$ClassName 형태이다.

table 에 insert 하기 위해서는 companion class 를 통해서 해야하는데, drift의 특성인건지 flutter 에서 권장사항으로 규정해놓은 내용인지 확인해봐야겠다.

drift 의 database 는 schemaVersion 값으로 table 의 변화를 감지하는 것 같다.
