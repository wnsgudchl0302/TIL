# 추상클래스 (AbstractClass)
## 목록
+ [추상 클래스](#추상-클래스)
+ [추상 클래스 응용 - 템플릿 메서드](#추상-클래스-응용---템플릿-메서드)
## 추상클래스
- 구현 코드가 없이 선언부만 있는 메서드
- abstract 예약어 사용
- 추상클래스는 new (인스턴스화) 할 수 없다.
- 주로 상위 클래스로 사용되며 하위 클래스에서 구현한다.
```java
//추상 클래스
public abstract class Computer {
	//추상메서드
	public abstract void display();
	//추상메서드
	public abstract void typing();
	
	public void turnOn() {
		System.out.println("전원을 킵니다.");
	}
	public void turnOff() {
		System.out.println("전원을 끕니다.");
	}

}
```
```java
public class DeskTop extends Computer{
//추상 메소드 구현
	@Override
	public void display() {
		System.out.println("DeskTop display");
	}

	@Override
	public void typing() {
		System.out.println("DeskTop typing");
	}

}
```
## 추상 클래스 응용 - 템플릿 메서드
- 템플릿 : 틀이나 견본을 의미
- 템플릿 메서드 : 추상 메서드나 구현된 메서드를 활용하여 전체의 흐름을 정의 해 놓은 메서드 (`FINAL로 선언하여 재정의 할 수 없게 함`)
- final 메서드는 하위 클래스에서 오버라이딩 할 수 없다
- final 클래스는 더 이상 상속되지 않는다.
```java
public abstract class Car {
	
	public abstract void drive();

	public abstract void stop();

	public void startCar() {
		System.out.println("시동을 켭니다.");
	}

	public void turnOff() {
		System.out.println("시동을 끕니다.");
	}
    //템플릿 메서드 구현
	final public void run() {
		startCar();
		drive();
		stop();
		turnOff();
	}
}

```