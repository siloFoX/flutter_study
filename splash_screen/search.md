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
->