# Thread
## 목록
+ [Thread 구현하기](#thread-구현하기)
    +[extexds 사용](#extexds-사용)
    +[Runnable사용](#runnable사용)
+[interrupt 메서드](#interrupt-메서드)
+[Multi Thread 프로그래밍](#multi-thread-프로그래밍)
    +[synchronized 메서드 방식 동기화](#synchronized-메서드-방식-동기화)
    +[synchronized 블록 방식 동기화](#synchronized-블록-방식-동기화)
+[wait and notify](#wait-and-notify)
## Thread
- Process
    - 실행중인 프로그램
    - OS로부터 메모리를 할당 받음
- Thread
    - 실제 프로그램이 수행되는 작업의 최소 단위
    - 하나의 프로세스는 하나 이상의 Thread를 가지게 됨

## Thread 구현하기
- extends를 사용하여 구현
- Runnable 인터페이스를 사용하여 구현

extends 사용
```java
class MyThread extends Thread {

	public void run() {
		int i;
		for (i = 0; i <= 200; i++) {
			System.out.print(i + "\t");
			try {
				sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}

public class ThreadTest {

	public static void main(String[] args) {
		
		System.out.println("start");
		MyThread th1 = new MyThread();
		MyThread th2 = new MyThread();
		
		th1.start();
		th2.start();
		System.out.println("end");
		
	}

}
```
Runnable사용
```java
class MyThread implements Runnable {

	public void run() {
		int i;
		for (i = 0; i <= 200; i++) {
			System.out.print(i + "\t");
			try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
	}
}

public class ThreadTest {

	public static void main(String[] args) {
		
		System.out.println("start");
		MyThread runner1 = new MyThread();
		Thread th1 = new Thread(runner1);	
		th1.start();
		System.out.println("end");
		
	}

}
```
## Multi-thread 프로그래밍
- 동시에 여러개의 Thread가 수행되는 프로그래밍
- Thread는 각각의 작업공간을 가짐
- 공유 자원이 있는 경우 race condition이 발생
- critical section에 대한 동기화의 구현이 필요

## Thread가 제공하는 여러가지 메서드
- join() 메서드 : 다른 thread의 결과를 보고 진행해야 하는 일이 있는 경우 join() 메서드를 활용 join() 메서드를 호출한 thread가 non-runnalbe 상태가 됨
```java
public class JoinTest extends Thread {

	int start;
	int end;
	int total;

	public JoinTest(int start, int end) {
		this.start = start;
		this.end = end;

	}

	public void run() {
		int i;
		for (i = start; i <= end; i++) {
			total += i;
		}
	}

	public static void main(String[] args) {

		JoinTest jt1 = new JoinTest(1, 50);
		JoinTest jt2 = new JoinTest(51, 100);

		jt1.start();
		jt2.start();
		try {
			jt1.join();
			jt2.join();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}

		int total = jt1.total + jt2.total;

		System.out.println("jt1.total = " + jt1.total);

		System.out.println("jt2.total = " + jt2.total);

		System.out.println(total);
	}
}
```
## interrupt 메서드
- 다른 thread에 예외를 발생시키는 interrupt를 보냄
- thread가 join(), sleep(), wait() 메서드에 의해 블럭킹 되었다면 interrupt에 의해 다시 runnable상태가 될 수 있음

```java
public class InterruptTest extends Thread {

	public void run() {
		int i;
		for (i = 0; i < 100; i++) {
			System.out.println(i);
		}

		try {
			sleep(5000);
		} catch (InterruptedException e) {
			System.out.println(e);
			System.out.println("Wake!!!");
		}
	}

	public static void main(String[] args) {
		
		InterruptTest test = new InterruptTest();

		test.start();
		test.interrupt();
		System.out.println("end");
	}
}
```
## Multi Thread 프로그래밍

## synchronized 메서드 방식 동기화
```java
class Bank {
	private int money = 10000;

	public synchronized void saveMoney(int save) {
		int m = this.getMoney();

		try {
			Thread.sleep(3000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		setMoney(m + save);
	}

	public synchronized void minusMoney(int minus) {
		int m = this.getMoney();

		try {
			Thread.sleep(200);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		setMoney(m - minus);
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
}

class Pack extends Thread {
	public void run() {
		System.out.println("Pack저금시작");
		SyncTest.myBank.saveMoney(3000);
		System.out.println("Pack저금완료" + SyncTest.myBank.getMoney());
	}
}

class PackWife extends Thread {
	public void run() {
		System.out.println("PackWife출금시작");
		SyncTest.myBank.minusMoney(2000);
		System.out.println("PackWife출금완료" + SyncTest.myBank.getMoney());

	}
}

public class SyncTest {

	public static Bank myBank = new Bank();

	public static void main(String[] args) throws InterruptedException {
		Pack p = new Pack();
		p.start();
		Thread.sleep(200);
		PackWife pw = new PackWife();
		pw.start();
	}

}
```
## synchronized 블록 방식 동기화
```java
class Bank {
	private int money = 10000;

	public void saveMoney(int save) {
		synchronized (this) {

			int m = this.getMoney();

			try {
				Thread.sleep(3000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			setMoney(m + save);
		}
	}

	public void minusMoney(int minus) {
		int m = this.getMoney();

		try {
			Thread.sleep(200);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		setMoney(m - minus);
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}
}

class Pack extends Thread {
	public void run() {
		System.out.println("Pack저금시작");
		SyncTest.myBank.saveMoney(3000);
		System.out.println("Pack저금완료" + SyncTest.myBank.getMoney());
	}
}

class PackWife extends Thread {
	public void run() {
		System.out.println("PackWife출금시작");
		SyncTest.myBank.minusMoney(2000);
		System.out.println("PackWife출금완료" + SyncTest.myBank.getMoney());

	}
}

public class SyncTest {

	public static Bank myBank = new Bank();

	public static void main(String[] args) throws InterruptedException {
		Pack p = new Pack();
		p.start();
		Thread.sleep(200);
		PackWife pw = new PackWife();
		pw.start();
	}

}
```
## wait and notify
- wait() : 리소스가 더 이상 유효하지 않은 경우 리소스가 사용 가능할 때 까지 위해 thread를 non-runnable상태로 전환 wait() 상태가 된 thread는 notify() 가 호출 될 때까지 기다린다.
- notify() : wait() 하고 있는 thread 중 한 thread를 runnable 한 상태로 깨움
- notifyAll() : wait() 하고 있는 모든 thread가 runnable 한 상태가 되도록함
```java
import java.util.ArrayList;

class FastLibrary {

	public ArrayList<String> books = new ArrayList<String>();

	public FastLibrary() {
		books.add("태백산맥 1");
		books.add("태백산맥 2");
		books.add("태백산맥 3");

	}

	public synchronized String lendBook() throws InterruptedException {
		Thread t = Thread.currentThread();
		while (books.size() == 0) {
			System.out.println(t.getName() + "waiting start");
			wait();
			System.out.println(t.getName() + "waiting end");
		}
		String title = books.remove(0);
		System.out.println(t.getName() + ":" + title + " lend");
		return title;
	}

	public synchronized void returnBook(String title) {

		Thread t = Thread.currentThread();
		books.add(title);
		notifyAll();
		System.out.println(t.getName() + ":" + title + " return");
	}
}

class Student extends Thread {
	public void run() {
		try {
			String title = LibraryMain.library.lendBook();
			if (title == null)
				return;
			sleep(5000);
			LibraryMain.library.returnBook(title);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}
}

public class LibraryMain {

	public static FastLibrary library = new FastLibrary();

	public static void main(String[] args) {

		Student std1 = new Student();
		Student std2 = new Student();
		Student std3 = new Student();
		Student std4 = new Student();
		Student std5 = new Student();
		Student std6 = new Student();

		std1.start();
		std2.start();
		std3.start();
		std4.start();
		std5.start();
		std6.start();

	}

}

```