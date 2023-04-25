.. : cascade<br>
... : spread operator

is : 같은 타입이면 true, is! 는 반대
as : downcasting
class A
class B extends A
B b1;
A a = b1;
if (a is B) {
  B b2 = a as B;
}
