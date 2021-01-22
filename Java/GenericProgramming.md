# Generic-Programming
## 목록
+ [제네릭 프로그래밍이란](#제네릭-프로그래밍이란)
+ [<T extends 클래스>](#<T-extends-클래스>)
+ [제네릭 메서드](#제네릭-메서드)

## 제네릭 프로그래밍이란
- 변수의 선언이나 메서드의 매개변수를 하나의 참조 자료형이 아닌 여러 자료형을 변환 될 수 있도록 프로그래밍 하는 방식
- 실제 사용되는 참조 자료형으로의 변환은 컴파일러가 검증하므로 안정적인 프로그래밍 방식

```java
public class Powder {
	public String toString() {
		return "재료는 파우더입니다.";
	}
}
```
```java
public class Plastic {
	public String toString() {
		return "재료는 플라스틱 입니다.";
	}
}
```
```java
public class GenericPrinter<T> {
	
	private T material;

	public T getMaterial() {
		return material;
	}

	public void setMaterial(T material) {
		this.material = material;
	}

	public String toString() {
		return material.toString();
	}
}
```
```java
public class GenericPrinterTest {

	public static void main(String[] args) {
		GenericPrinter<Powder> powderPrinter = new GenericPrinter<Powder>();
		Powder powder = new Powder();
		powderPrinter.setMaterial(powder);
		
		System.out.println(powderPrinter);
		
		GenericPrinter<Plastic> plasticPrinter = new GenericPrinter<Plastic>();
		Plastic plastic = new Plastic();
		plasticPrinter.setMaterial(plastic);
		System.out.println(plasticPrinter);
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
재료는 파우더입니다. <br>
재료는 플라스틱입니다.
</div>
</details>
<br>

## <T extends 클래스>
- T 대신에 사용될 자료형을 제한하기 위해 사용

## 제네릭 메서드
- 메서드의 매개 변수를 자료형 매개 변수로 사용하는 메서드
- 메서드 내에서의 자료형 매개 변수는 메서드 내에서만 유효 함(지역 변수와 같은 개념)


