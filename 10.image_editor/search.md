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
