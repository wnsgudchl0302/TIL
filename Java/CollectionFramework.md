# 컬렉션 프레임워크 Collection Framework
## 목록
+ [컬렉션 프레임워크란](#컬렉션-프레임워크란)
+ [Collection 인터페이스](#collection-인터페이스)
+ [Map 인터페이스](#map-인터페이스)
+ [List 인터페이스](#list-인터페이스)
+ [Stack과 Queue](#stack과-Queue)
+ [Set 인터페이스](#set-인터페이스)


## 컬렉션 프레임워크란
- 프로그램 구현에 필요한 자료구조와 알고리즘을 구현해 좋은 라이브러리
- java.util 패키지에 구현되어 있다.
- 개발에 소요되는 시간을 절약하고 최적화된 라이브러리를 사용할 수 있다.
- `Collection 인터페이스`와 `Map 인터페이스`로 구성된다.

## Collection 인터페이스
- 하나의 객체의 관리를 위해 선언된 인터페이스로 필요한 기본 메서드가 선언되어 있음
- 하위에 List, Set 인터페이스가 있다.

## Map 인터페이스
- 쌍으로 이루어진 객체를 관리하는데 필요한 여러 메서드가 선언되어 있다.
- Map을 사요하는 객체는 key-value 쌍으로 되어 있고 key는 중복될 수 없다.

## List 인터페이스
- Collection 하위 인터페이스
- 객체를 순서에 따라 저장하고 관리하는데 필요한 메서드가 선언된 인터페이스
- 배열의 기능을 구현하기 위한 메서드가 선언됨
- ArrayList, Vector, LinkedList
```java
import java.util.LinkedList;

public class LinkedListTest {

	public static void main(String[] args) {
		
		LinkedList<String> myList = new LinkedList<String>();
		myList.add("A");
		myList.add("B");
		myList.add("C");
		System.out.println(myList);
		myList.add(1, "D"); //1번에다가 D인덱스를 넣고 싶다
		System.out.println(myList);
		myList.removeLast(); //마지막 리스트 삭제
		System.out.println(myList);
		
		for(int i=0; i<myList.size(); i++) {
			String s = myList.get(i);
			System.out.println(s);
		}
	}

}
```
## Stack과 Queue
### Stack 구현해보기
- Last In First Out(LIFO) - 맨 마지막에 추가 된 요소가 가장 먼저 꺼내지는 자료구조
```java
class MyStack {

	private ArrayList<String> arrayStack = new ArrayList<String>();
	
	public void push(String data) {
		arrayStack.add(data);
	}
	
	public String pop() {
		int len = arrayStack.size();
		if(len == 0) {
			System.out.println("스택이 비었습니다.");
			return null;
		}
		return arrayStack.remove(len-1);
	}
	
	
}

public class StackTest {
	
	public static void main(String[] args) {
		MyStack stack = new MyStack();
		stack.push("A");
		stack.push("B");
		stack.push("C");
		
		System.out.println(stack.pop());
		System.out.println(stack.pop());
		System.out.println(stack.pop());
		System.out.println(stack.pop());
 		
		Stack<String> s = new Stack<String>();
		s.push("A");
		s.push("B");
		s.push("C");
		System.out.println(s.pop());
		System.out.println(s.pop());
		System.out.println(s.pop());
	}	
}
```
### Queue 구현해보기
- First In First Out(FIFO) - 먼저 저장된 자료가 먼저 꺼내지는 구조
```java
import java.util.ArrayList;

class MyQueue {

	private ArrayList<String> arrayQueue = new ArrayList<String>();
	
	public void Enqueue(String data) {
		arrayQueue.add(data);
	}
	
	public String Dequeue() {
		int len = arrayQueue.size();
		if(len == 0) {
			System.out.println("큐가 비었습니다.");
			return null;
		}
		return arrayQueue.remove(0);
	}
}
public class QueueTest {

	public static void main(String[] args) {
		MyQueue queue = new MyQueue();
		queue.Enqueue("A");
		queue.Enqueue("B");
		queue.Enqueue("C");
		
		System.out.println(queue.Dequeue());
		System.out.println(queue.Dequeue());
		System.out.println(queue.Dequeue());
		System.out.println(queue.Dequeue());	
	}
}
```
## Set 인터페이스


