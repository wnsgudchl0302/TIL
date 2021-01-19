# String Class and Wrapper Class
## 목록
+ [String 클래스](#string-클래스)
+ [Wrapper 클래스](#wrapper-클래스)

## String 클래스
### String 선언하기
```java
String str1 = new String("abc"); //인스턴스로 생성됨
String str2 = "abc"; //상수풀에 있는 문자열을 가리킴
```
```java
public class StringTest {
	
	public static void main(String[] args) {
		
		String str1 = new String("abc");
		String str2 = new String("abc");

		System.out.println(str1 == str2);
		
		String str3 = "abc";
		String str4 = "abc";
		
		System.out.println(str3 == str4);
	} 
}
```
<details>
<summary>실행 결과</summary>
<div>
false <br>
true
</div>
</details>
<br>

### String은 immutable
- 한선 선언되거나 생성된 문자열을 변경할 수 없음
- String 클래스의 concat() 메서드 혹은 "+"를 이용하여 String을 연결하는 경우 문자열은 새로 생성 된다.
```java
public class StringTest2 {

	public static void main(String[] args) {

		String java = new String("java");
		String android = new String("android");
		System.out.println(System.identityHashCode(java));
		
		java = java.concat(android);
		
		System.out.println(java);
		System.out.println(System.identityHashCode(java));
		
	}
}
```
`메모리 주소 값이 다르다.`

### StringBuilder 와 StringBuffer
- 가변적인 char[] 배열을 멤버변수라 가지고 있는 클래스
- 문자열을 변경하거나 연결하는 경우 사용하면 편리한 클래스
-StringBuffer는 멀티 쓰레드프로그래밍에서 동기화가 보장되기 때문에 단일 쓰레드 프로그래밍에서는 StringBuilder를 사용하는 것이 더 좋다.
-toString() 메서드로 String 반환

```java
public class StringBuilderTest {

	public static void main(String[] args) {
		String java = new String("java");
		String android = new String("android");
		
		StringBuilder buffer = new StringBuilder(java);
		
		System.out.println(System.identityHashCode(buffer));
		buffer.append("android");
		
		System.out.println(System.identityHashCode(buffer));
		java = buffer.toString();
	}
}
```
`메모리 주소 값이 같다.`

## Wrapper 클래스
### 기본 자료형에 대한 클래스

|`기본형`|`Wrapper 클래스`|
|:---:| :---: | 
| `boolean` | Boolean | 
| `byte` | Byte | 
| `char` | Character | 
| `short` | Short | 
| `int` | Integer | 
| `long` | Long | 
| `float` | Float | 
| `double` | Double | 
