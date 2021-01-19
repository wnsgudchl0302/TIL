# 컬렉션 프레임워크 Collection Framework
## 목록
+ [컬렉션 프레임워크란](#컬렉션-프레임워크란)
+ [Collection 인터페이스](#collection-인터페이스)
+ [List 인터페이스](#list-인터페이스)
+ [Stack과 Queue](#stack과-queue)
+ [Set 인터페이스](#set-인터페이스)
	+ [HashSet을 이용한 멤버관리](#hashSet을-이용한-멤버관리)
	+ [TreeSet을 이용한 멤버관리](#treeSet을-이용한-멤버관리)
	+ [Comparable 인터페이스 활용](#comparable-인터페이스-활용)
+ [Map 인터페이스](#map-인터페이스)
	+ [HashMap 클래스](#hashMap-클래스)
	+ [TreeMap 클래스](#treeMap-클래스)




## 컬렉션 프레임워크란
- 프로그램 구현에 필요한 자료구조와 알고리즘을 구현해 좋은 라이브러리
- java.util 패키지에 구현되어 있다.
- 개발에 소요되는 시간을 절약하고 최적화된 라이브러리를 사용할 수 있다.
- `Collection 인터페이스`와 `Map 인터페이스`로 구성된다.

## Collection 인터페이스
- 하나의 객체의 관리를 위해 선언된 인터페이스로 필요한 기본 메서드가 선언되어 있음
- 하위에 List, Set 인터페이스가 있다.

## Map인터페이스
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
<details>
<summary>실행 결과</summary>
<div>
[A, B, C]<br>
[A, D, B, C]<br>
[A, D, B]<br>
A<br>
D<br>
B<br>
</div>
</details>
<br>

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
<details>
<summary>실행 결과</summary>
<div>
C<br>
B<br>
A<br>
스택이 비었습니다.<br>
null<br>
C<br>
B<br>
A
</div>
</details>
<br>

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
<details>
<summary>실행 결과</summary>
<div>
A<br>
B<br>
C<br>
큐가 비었습니다.<br>
null
</div>
</details>
<br>

## Set 인터페이스
- Collection 하위의 인터페이스
- 중복을 허용하지 않는다.
- List는 순서기반의 인터페이스지만, Set은 순서가 없다.
- `get(i) 메서드가 제공되지 않는다. (Itrator로 순회)`
- 저장된 순서와 출력 순서는 다를 수 있다.
- 아이디, 주민번호, 사번 등 유일한 값이나 객체를 관리할 때 사용
- `HashSet, TreeSet 클래스`
### Iterator로 순회하기
- iterator() 메서드 호출
```java
Iterator ir = memberArrayList.iterator();
```
```java
import java.util.HashSet;

public class HashSetTest {

	public static void main(String[] args) {
		//중복을 허용하지 않고, 순서도 랜덤이다.
		HashSet<String> set = new HashSet<String>();
		set.add("이순신");
		set.add("김유신");
		set.add("강감찬");
		set.add("이순신");
		
		System.out.println(set);
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
[김유신, 강감찬, 이순신]
</div>
</details>
<br>

### 전체 엘리먼트를 순회하는 코드
```java
import java.util.HashSet;
import java.util.Iterator;

public class HashSetTest {

	public static void main(String[] args) {
		
		HashSet<String> set = new HashSet<String>();
		set.add("이순신");
		set.add("김유신");
		set.add("강감찬");
		set.add("이순신");
		//전체 엘리먼트를 순회하는 코드
		Iterator<String> ir = set.iterator();
		while(ir.hasNext()) {
			String str = ir.next();
			System.out.println(str);
		}
	}
}
```
### HashSet을 이용한 멤버관리
```java
public class Member {
	
	private int memberId;
	private String mamberName;
	
	public Member() {}

	public Member(int mamberId, String mamberName) {
		
		this.memberId = mamberId;
		this.mamberName = mamberName;
	}

	public int getMamberId() {
		return memberId;
	}

	public void setMamberId(int mamberId) {
		this.memberId = mamberId;
	}

	public String getMamberName() {
		return mamberName;
	}

	public void setMamberName(String mamberName) {
		this.mamberName = mamberName;
	}

	@Override
	public String toString() {
		
		return mamberName + "회원님의 아이디는 " + memberId + "입니다.";
	}

	@Override
	public int hashCode() {
		
		return memberId;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member) {
			Member member = (Member)obj;
			return (this.memberId == member.memberId);
		}
		return false;
	}
}

```
```java
import java.util.HashSet;
import java.util.Iterator;

public class MemberHashSet {

	private HashSet<Member> hashSet;

	public MemberHashSet() {
		hashSet = new HashSet<Member>();
	}

	public void addMember(Member member) {
		hashSet.add(member);
	}

	public boolean removeMember(int memberId) {

		Iterator<Member> ir = hashSet.iterator();

		while (ir.hasNext()) {
			Member member = ir.next();
			if (member.getMamberId() == memberId) {
				hashSet.remove(member);
				return true;
			}
		}
		System.out.println(memberId + "번호가 존재하지 않습니다.");
		return false;
	}

	public void showAllMember() {
		for (Member member : hashSet) {
			System.out.println(member);
		}
		System.out.println();
	}
}

```
```java
public class MemberHashSetTest {

	public static void main(String[] args) {
		
		MemberHashSet manager = new MemberHashSet();
		Member memberLee = new Member(100, "Lee");
		Member memberKim = new Member(200, "Kim");
		Member memberPark = new Member(300, "Park");
		Member memberPark2 = new Member(300, "Park2");
		
		manager.addMember(memberLee);
		manager.addMember(memberKim);
		manager.addMember(memberPark);
		manager.addMember(memberPark2);
		
		manager.showAllMember();
		
		manager.removeMember(100);
		
		manager.showAllMember();
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
Lee회원님의 아이디는 100입니다. <br>
Kim회원님의 아이디는 200입니다.<br>
Park회원님의 아이디는 300입니다.<br>
<br>
Kim회원님의 아이디는 200입니다.<br>
Park회원님의 아이디는 300입니다.
</div>
</details>
<br>

`equlas() 와 hashCode()를 재정의 하여 중복을 방지한다. `

### TreeSet 클래스
- 객체의 정렬에 사용되는 클래스
- 중복을 허용하지 않으면서 오름차순이나 내림차순으로 객체를 정렬
- 이진 검색 트리로 구현되어있음
- 이진 검색 트리에 자료가 저장 될 때 비교하여 저장될 위치를 정함
- 객체 비교를 위해서 Comparable이나 Comparator 인터페이스를 구현 해야 한다.
```java
import java.util.TreeSet;

public class TreeSetTest {

	public static void main(String[] args) {
		
		TreeSet<String> treeSet = new TreeSet<String>();
		treeSet.add("홍길동");
		treeSet.add("강감찬");
		treeSet.add("이순신");
		
		for(String str : treeSet) {
			System.out.println(str);
		}
	}
}

```
<details>
<summary>실행 결과</summary>
<div>
강감찬<br>
이순신<br>
홍길동
</div>
</details>
<br>

`오름차순으로 자동 정렬`

### TreeSet을 이용한 멤버관리
- Comparable 인터페이스 활용
```java
public class Member implements Comparable<Member>{
	
	private int memberId;
	private String mamberName;
	
	public Member() {}

	public Member(int mamberId, String mamberName) {
		
		this.memberId = mamberId;
		this.mamberName = mamberName;
	}

	public int getMamberId() {
		return memberId;
	}

	public void setMamberId(int mamberId) {
		this.memberId = mamberId;
	}

	public String getMamberName() {
		return mamberName;
	}

	public void setMamberName(String mamberName) {
		this.mamberName = mamberName;
	}

	@Override
	public String toString() {
		
		return mamberName + "회원님의 아이디는 " + memberId + "입니다.";
	}

	@Override
	public int hashCode() {
		
		return memberId;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member) {
			Member member = (Member)obj;
			return (this.memberId == member.memberId);
		}
		return false;
	}
	//compareTo 재정의
	@Override
	public int compareTo(Member member) {
		
		return (this.memberId - member.memberId);
	}
}
```
```java
import java.util.TreeSet;
import java.util.Iterator;

public class MemberTreeSet {

	private TreeSet<Member> treeSet;

	public MemberTreeSet() {
		treeSet = new TreeSet<Member>();
	}

	public void addMember(Member member) {
		treeSet.add(member);
	}

	public boolean removeMember(int memberId) {

		Iterator<Member> ir = treeSet.iterator();

		while (ir.hasNext()) {
			Member member = ir.next();
			if (member.getMamberId() == memberId) {
				treeSet.remove(member);
				return true;
			}
		}
		System.out.println(memberId + "번호가 존재하지 않습니다.");
		return false;
	}

	public void showAllMember() {
		for (Member member : treeSet) {
			System.out.println(member);
		}
		System.out.println();
	}
}
```
```java
public class MemberTreeSetTest {

	public static void main(String[] args) {
		
		MemberTreeSet manager = new MemberTreeSet();
		Member memberLee = new Member(100, "Lee");
		Member memberKim = new Member(200, "Kim");
		Member memberPark = new Member(300, "Park");
		
		
		manager.addMember(memberLee);
		manager.addMember(memberKim);
		manager.addMember(memberPark);
			
		manager.showAllMember();	
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
Lee회원님의 아이디는 100입니다. <br>
Kim회원님의 아이디는 200입니다. <br>
Park회원님의 아이디는 300입니다.
</div>
</details>
<br>

- Comparable 인터페이스 활용
```java
import java.util.Comparator;

public class Member implements Comparator<Member>{
	
	private int memberId;
	private String mamberName;
	
	public Member() {}

	public Member(int mamberId, String mamberName) {
		
		this.memberId = mamberId;
		this.mamberName = mamberName;
	}

	public int getMamberId() {
		return memberId;
	}

	public void setMamberId(int mamberId) {
		this.memberId = mamberId;
	}

	public String getMamberName() {
		return mamberName;
	}

	public void setMamberName(String mamberName) {
		this.mamberName = mamberName;
	}

	@Override
	public String toString() {
		
		return mamberName + "회원님의 아이디는 " + memberId + "입니다.";
	}

	@Override
	public int hashCode() {
		
		return memberId;
	}

	@Override
	public boolean equals(Object obj) {
		if(obj instanceof Member) {
			Member member = (Member)obj;
			return (this.memberId == member.memberId);
		}
		return false;
	}

	@Override
	public int compare(Member member1, Member member2) {
		return (member1.memberId - member2.memberId);
	}
}
```
```java
import java.util.TreeSet;
import java.util.Iterator;

public class MemberTreeSet {

	private TreeSet<Member> treeSet;

	public MemberTreeSet() {
		treeSet = new TreeSet<Member>(new Member());
	}

	public void addMember(Member member) {
		treeSet.add(member);
	}

	public boolean removeMember(int memberId) {

		Iterator<Member> ir = treeSet.iterator();

		while (ir.hasNext()) {
			Member member = ir.next();
			if (member.getMamberId() == memberId) {
				treeSet.remove(member);
				return true;
			}
		}
		System.out.println(memberId + "번호가 존재하지 않습니다.");
		return false;
	}

	public void showAllMember() {
		for (Member member : treeSet) {
			System.out.println(member);
		}
		System.out.println();
	}
}
```
```java
public class MemberTreeSetTest {

	public static void main(String[] args) {
		
		MemberTreeSet manager = new MemberTreeSet();
		Member memberLee = new Member(100, "Lee");
		Member memberKim = new Member(200, "Kim");
		Member memberPark = new Member(300, "Park");
		
		
		manager.addMember(memberLee);
		manager.addMember(memberKim);
		manager.addMember(memberPark);
			
		manager.showAllMember();	
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
Lee회원님의 아이디는 100입니다. <br>
Kim회원님의 아이디는 200입니다. <br>
Park회원님의 아이디는 300입니다.
</div>
</details>
<br>

Comparable은 compareTo() 메서드를 구현하고 매개변수와 객체 자신을 비교한다. <br>
Comparator는 compare() 메서드를 구현하고 두 개의 매개 변수를 비교한다. <br>
TreeSet 생성자에 Comparator가 구현된 객체를 매개변수로 전달한다. <br>
일반적으로 Comparable을 더 많이 사용한다.

## Map 인터페이스
- key-value pair의 객체를 관리하는데 필요한 메서드가 정의 됨
- key는 중복 될 수 없다.
- 검색을 위한 자료구조이다.
- key를 이용하여 값을 저장하거나, 검색, 삭제 할 때 사용하면 편리하다
- key 가 되는 객체는 객체의 유일성함의 여부를 알기 위해 equals()와 hashCode()메서드를 재정의 해야한다.

### HashMap 클래스
- Map 인터페이스를 구현한 클래스 중 가장 일반적으로 사용하는 클래스
```java
public class Member {
	
	private int mamberId;
	private String mamberName;
	
	public Member() {}

	public Member(int mamberId, String mamberName) {
		
		this.mamberId = mamberId;
		this.mamberName = mamberName;
	}

	public int getMamberId() {
		return mamberId;
	}

	public void setMamberId(int mamberId) {
		this.mamberId = mamberId;
	}

	public String getMamberName() {
		return mamberName;
	}

	public void setMamberName(String mamberName) {
		this.mamberName = mamberName;
	}

	@Override
	public String toString() {
		
		return mamberName + "회원님의 아이디는 " + mamberId + "입니다.";
	}
	
}
```
```java
import java.util.HashMap;
import java.util.Iterator;

public class MemberHashMap {

	private HashMap<Integer, Member> hashMap;

	public MemberHashMap() {
		hashMap = new HashMap<Integer, Member>();
	}

	public void addMember(Member member) {
		hashMap.put(member.getMamberId(), member);
	}

	public boolean removeMember(int memberId) {
		if (hashMap.containsKey(memberId)) {
			hashMap.remove(memberId);
			return true;
		}
		System.out.println("회원 번호가 업습니다.");
		return false;
	}

	public void showAllMember() {
		Iterator<Integer> ir = hashMap.keySet().iterator();
		while (ir.hasNext()) {
			int key = ir.next();
			Member member = hashMap.get(key);
			System.out.println(member);
		}
		System.out.println();
	}

}
```
```java
public class MemberHashMapTest {

	public static void main(String[] args) {
		
		MemberHashMap manager = new MemberHashMap();
		Member memberLee = new Member(100, "Lee");
		Member memberKim = new Member(200, "Kim");
		Member memberPark = new Member(300, "Park");
		
		manager.addMember(memberLee);
		manager.addMember(memberKim);
		manager.addMember(memberPark);
		
		manager.showAllMember();
		
		manager.removeMember(100);
		
		manager.showAllMember();
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
Lee회원님의 아이디는 100입니다.<br>
Kim회원님의 아이디는 200입니다.<br>
Park회원님의 아이디는 300입니다.<br>
<br>
Kim회원님의 아이디는 200입니다.<br>
Park회원님의 아이디는 300입니다.
</div>
</details>
<br>

### TreeMap 클래스
```java
public class Member {
	
	private int mamberId;
	private String mamberName;
	
	public Member() {}

	public Member(int mamberId, String mamberName) {
		
		this.mamberId = mamberId;
		this.mamberName = mamberName;
	}

	public int getMamberId() {
		return mamberId;
	}

	public void setMamberId(int mamberId) {
		this.mamberId = mamberId;
	}

	public String getMamberName() {
		return mamberName;
	}

	public void setMamberName(String mamberName) {
		this.mamberName = mamberName;
	}

	@Override
	public String toString() {
		
		return mamberName + "회원님의 아이디는 " + mamberId + "입니다.";
	}
	
}
```
```java
import java.util.Iterator;
import java.util.TreeMap;

public class MemberTreeMap {

	private TreeMap<Integer, Member> treeMap;

	public MemberTreeMap() {
		treeMap = new TreeMap<Integer, Member>();
	}

	public void addMember(Member member) {
		treeMap.put(member.getMamberId(), member);
	}

	public boolean removeMember(int memberId) {
		if (treeMap.containsKey(memberId)) {
			treeMap.remove(memberId);
			return true;
		}
		System.out.println("회원 번호가 업습니다.");
		return false;
	}

	public void showAllMember() {
		Iterator<Integer> ir = treeMap.keySet().iterator();
		while (ir.hasNext()) {
			int key = ir.next();
			Member member = treeMap.get(key);
			System.out.println(member);
		}
		System.out.println();
	}

}
```
```java
public class MemberTreeMapTest {

	public static void main(String[] args) {
		
		MemberTreeMap manager = new MemberTreeMap();
		Member memberLee = new Member(100, "Lee");
		Member memberKim = new Member(200, "Kim");
		Member memberPark = new Member(300, "Park");
		
		manager.addMember(memberLee);
		manager.addMember(memberKim);
		manager.addMember(memberPark);
		
		manager.showAllMember();
		
		manager.removeMember(100);
		
		manager.showAllMember();
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
Lee회원님의 아이디는 100입니다.<br>
Kim회원님의 아이디는 200입니다.<br>
Park회원님의 아이디는 300입니다.<br>
<br>
Kim회원님의 아이디는 200입니다.<br>
Park회원님의 아이디는 300입니다.
</div>
</details>
<br>


