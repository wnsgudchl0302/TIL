# 오브젝트클래스(ObjectClass)와 Class클래스
## 목록
+ [오브젝트클래스 - ObjectClass](#오브젝트클래스---ObjectClass)
+ [toString 메서드](#tostring-메서드)
+ [equals 메서드](#equals-메서드)
+ [hashCode 메서드](#hashCode-메서드)
+ [clone 메서드](#clone-메서드)
+ [Class 클래스](#Class-클래스)

## 오브젝트클래스 - ObjectClass
- 모든 클래스의 최상위 클래스
- java.lang.Object 클래스
- 모든 클래스는 Object 클래스에서 상속 받는다.
- 모든 클래스는 Object 클래스의 메서드를 사용할 수 있다.
- 모든 클래스는 Object 클래스의 일부 메서드를 재정의 하여 사용할 수 있다.

## toString 메서드
### toString() 메서드의 원형
```java
getClass().getName() + '@' + Integer.toHexString(hashCode( ))
```
객체의 정보를 String 으로 바꾸어 사용할 때 유용하다.
### toString() 메서드 재정의
```java
class Book {
	String title;
	String author;

	public Book(String title, String author) {
		this.title = title;
		this.author = author;
	}

	@Override
	public String toString() {
		return title + "의 저자는 " + author + "입니다.";
	}

}

public class ToStringTest {

	public static void main(String[] args) {

		Book book = new Book("토지", "박경리");
		System.out.println(book);

		String str = new String("토지");
		System.out.println(str.toString());
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
토지의 저자는 박경리입니다. <br>
토지
</div>
</details>
<br>

## equals 메서드
- 두 객체의 동일함을 논리적으로 재정의
- 물리적 동일함 - 같은 주소를 가지는 객체
- 논리적 동일함 - ex) 같은 학번, 같은 주문 번호
### equals() 메서드 재정의
```java
class Student {
	int studentNum;
	String studentName;

	public Student(int studentNum, String studentName) {
		this.studentNum = studentNum;
		this.studentName = studentName;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Student) {
			Student std = (Student) obj;
			if (this.studentNum == std.studentNum)
				return true;
			else
				return false;
		}
		return false;
	}

}

public class EqualsTest {
	public static void main(String[] args) {

		Student Lee = new Student(100, "이순신");
		Student Lee2 = Lee;
		Student Shin = new Student(100, "이순신");

		System.out.println(Lee == Shin);
		System.out.println(Lee.equals(Shin));
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

## hashCode 메서드
- hashCode() 메서드 반환 값 - 인스턴스가 저장된 가상머신의 주소를 10진수로 반환

```java
class Student {
	int studentNum;
	String studentName;

	public Student(int studentNum, String studentName) {
		this.studentNum = studentNum;
		this.studentName = studentName;
	}

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Student) {
			Student std = (Student) obj;
			if (this.studentNum == std.studentNum)
				return true;
			else
				return false;
		}
		return false;
	}

	@Override
	public int hashCode() {
		return studentNum;
	}
	
}

public class EqualsTest {
	public static void main(String[] args) {

		Student Lee = new Student(100, "이순신");
		Student Lee2 = Lee;
		Student Shin = new Student(100, "이순신");
		
		System.out.println(System.identityHashCode(Lee));
		System.out.println(System.identityHashCode(Lee2));
		System.out.println(System.identityHashCode(Shin));
	}
}
```

## clone 메서드
- 객체의 복사본을 만들수 있다.
- 객체지향 프로그래밍의 정보은닉에 위배되는 가능성이 있어 복제할 객체는 cloneable 인터페이스를 명시해야한다.

```java
class Book implements Cloneable{
	String title;
	String author;

	public Book(String title, String author) {
		this.title = title;
		this.author = author;
	}

	@Override
	public String toString() {
		return title + "의 저자는 " + author + "입니다.";
	}

	@Override
	protected Object clone() throws CloneNotSupportedException {
		return super.clone();
	}

}

public class ToStringTest {

	public static void main(String[] args) throws CloneNotSupportedException {

		Book book = new Book("토지", "박경리");
		System.out.println(book);

		Book book2 = (Book)book.clone();
		System.out.println(book2);
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
토지의 저자는 박경리입니다. <br>
토지의 저자는 박경리입니다.
</div>
</details>
<br>

## Class 클래스
- 자바의 모든 클래스와 인터페이스는 컴파일 후 class 파일로 생성됨
- class 파일에는 객체의 정보 (멤버변수, 메서드, 생성자등)가 포함되어있다.
- Class 클래스는 컴파일된 class 파일에서 객체의 정보를 가져올 수 있음 
### reflection 프로그래밍
Class 클래스로부터 객체의 정보를 가져와 프로그래밍 하는 방식

<br>

### 클래스를 가져오는 방법 3가지
```java
public class StringClassTest {

	public static void main(String[] args) throws ClassNotFoundException {

		Class c1 = String.class;

		String str = new String();
		Class c2 = str.getClass();

		Class c3 = Class.forName("java.lang.String");
		
	}

}
```

### forName()메서드와 동적 로딩
- 동적 로딩이란 - 컴파일 시에 ㅔ데이터 타입이 모두 bidding 되어 자료형이 로딩되는 것이 아니라 실행 중에 데이터 타입을 알고 binding 되는 방식
- 실행 시에 로딩되므로 경우에 따라 다른 클래스가 사용될 수 있어 유용하다.

