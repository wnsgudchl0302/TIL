# 인터페이스 (Interface)
## 목록
+ [인터페이스의 요소](#인터페이스의-요소)
+ [인터페이스를 활용한 다형성 구현](#인터페이스를-활용한-다형성-구현)
+ [인터페이스와 상속을 활용하여 간단한 예제 만들어보기](#인터페이스와-상속을-활용하여-간단한-예제-만들어보기)

## 인터페이스의 요소
- 추상 메서드
- 상수
- 디폴트 메서드
- 정적 메서드
- private 메서드

인터페이스를 구현한 클래스는 인터페이스  타입으로 변수를 선언하여 인스턴스를 생성 할 수 있다.

## 인터페이스를 활용한 다형성 구현
### 인터페이스의 역할
- 인터페이스는 클라이언트 프로그램에 어떤 메서드를 제공하는지 알려주는 명세 또는 약속이다.
- 한 객체가 어떤 이니터페이스의 타입이라 함은 그 인터페이스의 메서드를 구현했다는 것이다.

## 인터페이스 상속
- 인터페이스 간에도 상속이 가능하다
- 구현이 없으므로 `extends` 키워드를 사용하여 여러개의 인터페이스를 상속받을 수 있따.

## 인터페이스와 상속을 활용하여 간단한 예제 만들어보기
```java
public interface Queue {
	
	void enQueue(String title);
	String deQueue();

	int getSize();
}
```
```java
import java.util.ArrayList;

public class Shelf {

	protected ArrayList<String> shelf;
	
	public Shelf() {
		shelf = new ArrayList<String>();
	}

	public ArrayList<String> getShelf() {
		return shelf;
	}
	
	public int getCount() {
		return shelf.size();
	}
}
```
```java
public class BookShelf extends Shelf implements Queue{

	@Override
	public void enQueue(String title) {
		shelf.add(title);
	}

	@Override
	public String deQueue() {
		return shelf.remove(0);
	}

	@Override
	public int getSize() {
		return getCount();
	}

}

```
```java
public class BookShelfTest {

	public static void main(String[] args) {
		
		Queue bookQueue = new BookShelf();
		bookQueue.enQueue("태백산맥1");
		bookQueue.enQueue("태백산맥2");
		bookQueue.enQueue("태백산맥3");
		
		System.out.println(bookQueue.deQueue());
		System.out.println(bookQueue.deQueue());
		System.out.println(bookQueue.deQueue());
	}
}
```

