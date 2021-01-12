# 클래스(Class)와 객체(Object)
## 목록
+ [객체지향 프로그래밍과 클래스](#객체지향-프로그래밍과-클래스)
+ [함수와 메서드](#함수와-메서드)
+ [인스턴스, 힙 메모리](#인스턴스,-힙-메모리)
+ [생성자, 생성자 오버로딩](#생성자,-생성자-오버로딩)
+ [참조 자료형](#참조-자료형---reference-data-type)
+ [접근 제어자 - access modifier](#접근-제어자---access-modifier)
+ [정보 은닉](#정보-은닉)
+ [this 키워드](#this-키워드)
+ [static 변수, 메서드](#static-변수,-메서드)
+ [싱글톤 패턴](#싱글톤-패턴)
+ [변수 정리](#변수-정리)


# 객체지향 프로그래밍과 클래스
## 객체(Object)
- 의사나 행위가 미치는 대상
- 구체적, 추상적 데이터의 단위
## 객체 지향 프로그래밍 (Object-Oriented Programming)
- 객체를 기반으로 하는 프로그래밍
- 객체를 정의 하고, 객체의 기능을 구현하며, 객체간의 협력을 구현
## 클래스 (Class)
- 객체를 코드로 구현한 것
## 멤버 변수
- 객체가 가지는 속성을 변수로 표현
- member variable, property, attribute
## 메서드
- 객체의 기능을 구현
- method, member function

```
public class Student {

	public int StudentID;              //멤버변수
	public String studentName;         //멤버변수
	public String address;             //멤버변수

	public void showStudentInfo() {    //메서드
		System.out.println(studentName + "," + address);
	}
}
```
# 함수와 메서드
## 함수(function)
- 하나의 기능을 수행하는 코드
- 함수는 호출하여 사용, 기능이 수행된 후 값을 반환 할 수 있다
- 함수는 여러 곳에서 호출하여 사용할 수 있다.
## 메서드(method)
- 객체의 기능을 구현하기 위해 클래스 내부에 구현되는 함수
- 메서드를 구현함으로써 객체의 기능이 구현 됨

```
public class FunctionTest {

    //매개변수와 반환값이 있는 메서드
	public static int addNum(int num1, int num2) {
		int result;
		result = num1 + num2;
		return result;
	}

    //매개변수는 있지만 반환값이 없는 메서드
	public static void sayHello(String hello) {
		System.out.println(hello);
	}

	public static void main(String[] args) {
		//함수의 호출
        System.out.println(addNum(1,2));
		sayHello("hello");
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
3 <br>
hello
</div>
</details>
<br>

# 인스턴스, 힙 메모리
## 인스턴스
- 클래스로 부터 생성된 객체
- `힙 메모리` 멤버 변수의 크기에 따라 메모리가 생성
## 참조 변수
- 메모리에 생성된 인스턴스를 가리키는 변수
## 참조 값
- 생성된 인스턴스의 메모리 주소 값 (16진수로 표현)

# 생성자, 생성자 오버로딩
## 생성자(constructor)
- 객체를 생성할 때 new 키워드와 함께 호출 (객체 생성 이외에는 호출할 수 없다.)
- 인스턴스를 초기화 하는 코드가 구현됨
- 생성자는 클래스 이름과 동일하다.
## 기본 생성자(default constructor)
- 하나의 클래스에는 반드시 하나 이상의 생성자가 있어야한다.
- 생성자를 구현하지 않으면 디폴트 생성자를 자동 구현해줌
- 기본 생성자는 매개 변수가 없고, 구현부가 없음
- 클래스에 다른 생성자가 있으면 기본 생성자는 제공되지 않는다.
## 생성자 오버로딩(constructor overloading)
```
public class Student {

	public int studentID;              //멤버변수
	public String studentName;         //멤버변수
	public String address;             //멤버변수

    //디폴트 생성자
	public Student() {
		
	}

    //생성자 오버로딩
	public Student(int studentID, String studentName, String address) {
		this.studentID = studentID;
		this.studentName = studentName;
		this.address = address;
	}
}
```
# 참조 자료형 - reference data type
```
public class Subject {

	String subjectName;
	int score;
	int subjectID;

}
```
```
public class Student {

	int studentID;      //기본 자료형
	String studentName; //참조 자료형
	
	Subject korea;      //참조 자료형
	Subject math;       //참조 자료형
}
```
# 접근 제어자 - access modifier
| `접근 제어자`  | `같은 클래스의 멤버`  | `같은 패키지의 멤버`  | `자식 클래스의 멤버`| `그 외의 영역`|
|  :---:  | :---: | :---: | :---: | :---: |
|  public |   O   |   O   |   O   |   O   |  
|protected|   O   |   O   |   O   |   X   | 
| default |   O   |   O   |   X   |   X   | 
| private |   O   |   X   |   X   |   X   | 

<br>

# 정보 은닉
### private를 사용하여 정보 은닉
### private으로 선언한 변수를 Getter와 Setter를 사용하여 접근할 수 있다.
```
public class MyDate {
	
	private int day;
	private int month;
	private int year;
	
	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public void showDate() {
		System.out.println(year + "년" + month + "월" + day + "일");
	}	
}
```
```
public class MyDateTest {

	public static void main(String[] args) {
		
		MyDate date = new MyDate();
		
		date.setDay(12);
		date.setMonth(1);
		date.setYear(2021);
		
		date.showDate();
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
2021년1월12일
</div>
</details>
<br>

# this 키워드
- 자신의 메모리를 가리킴
- 생성자에서 다른 생성자를 호출함
- 인스턴스 자신의 주소를 반환

```
public class Person {
	String name;
	int age;
	
	public Person() {
        //this 키워드
		this("이름 없음", 1);
	}

	public Person(String name, int age) {
        //this 키워드
		this.name = name;
		this.age = age;
	}
	
	public void showInfo() {
		System.out.println(name + "," + age);
	}
}
```
```
public class PersonTest {

	public static void main(String[] args) {
		
		Person personNoname = new Person();
		personNoname.showInfo();
		
		Person personLee = new Person("Lee", 20);
		personLee.showInfo();	
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
이름 없음,1 <br>
Lee,20
</div>
</details>
<br>

# static 변수, 메서드
## static 변수
- 여러 인스턴스가 하나의 값을 공유할 필요가 있을 때 사용
- 클래스 변수, 정적 변수라고도 말함
```
선언 Example
public static int a = 1000;
```
## static 메서드
- static 변수를 위한 기능을 제공하는 static 메서드
- static 메서드에서는 인스턴스 변수를 사용할 수 없다.
- 클래스 메서드, 정적 메서드라고도 말함
```
public class Student {

	private static int serialNum = 1000;

	public static void setSerialNum(int serialNum) {
		Student.serialNum = serialNum;
	}
}
```

# 싱글톤 패턴
## 단 하나만 존재하는 인스턴스 - singleton pattern
```
public class Company {

	private static Company instance = new Company();

	private Company() {}

	public static Company getInstance() {
		if (instance == null) {
			instance = new Company();
		}
		return instance;
	}
}
```
```
public class CompanyTest {

	public static void main(String[] args) {
		
		Company company1 = Company.getInstance();
		Company company2 = Company.getInstance();

		System.out.println(company1);
		System.out.println(company2);

	}
}
```
같은 주소값을 가져온다. <br><br>


# 변수 정리
| `변수 유형`  | `선언 위치`  | `사용 범위`  | `메모리`| `생성과 소멸`|
|  :---:  | :--- | :--- | :---: | :--- |
|  지역 변수 <br> (로컬 변수)   |   함수 내부에 선언          |   함수 내부에서만 사용   |   스택   |   함수가 호출될 때 생성되고 함수가 끝나면 소멸   |  
|멤버 변수 <br> (인스턴스 변수)  |  클래스 멤버 변수로 선언    |  클래스 내부에서 사용하고 private이 아니면 참조 변수로 다른 클래스에서 사용 가능  |   힙   |   인스턴스가 생성될 때 힙에 생성되고, 가비지 컬렉터가 메모리를 수거할 때 소멸됨   | 
| static 변수 <br> (클래스 변수)|   static 예약어를 사용하여 클래스 내부에 선언   |  클래스 내부에서 사용하고 pricate이 아니면 클래스 이름으로 다른 클래스에서 사용 가능   |  데이터 영역   |   프로그램이 처음 시작할 때 상수와 함께 데이터 영역에 생성 되고 프로그램이 끝나고 메모리를 해제할 때 소멸됨   | 




