# 내부클래스 (InnerClass)
## 목록
+ [내부 클래스 유형](#내부-클래스-유형)
+ [인스턴스 내부 클래스와 정적 내부 클래스](#인스턴스-내부-클래스와-정적-내부-클래스)
+ [정적 내부 클래스](#정적-내부-클래스)
+ [익명 내부 클래스](#익명-내부-클래스)


## 내부 클래스란
- 클래스 내부에 구현한 클래스 (중첩된 클래스)
- 클래스 내부에서 사용하기 위해 선언하고 구현하는 클래스
- 주로 외부 클래스 생성자에서 내부 클래스르르 생성 

## 내부 클래스 유형
| `종류`  | `구현 위치`  | `사용할 수 있는 외부 클래스 변수`  | `생성 방법` |
|  ------------ |----- |  -------   |  -------------------   |
| 인스턴스 내부 클래스  | 외부 클래스 멤버 변수와 동일 | 외부 인스턴스 변수 <br> 외부 전역 변수  | 외부 클래스를 먼저 만든 후 내부 클래스 생성  |
| 정적 내부 클래스  | 외부 클래스 멤버 변수와 동일  | 외부 전역 변수  | 외부 클래스와 무관하게 생성  |
| 지역 내부 클래스  | 메서드 내부에 구현  | 외부 인스턴스 변수 <br> 외부 전역 변수  | 메서드를 호출할 때 생성  |
| 익명 내부 클래스  | 메서드 내부에 구현 <br> 변수에 대입하여 직접 구현  | 외부 인스턴스 변수 <br> 외부 전역 변수  | 메서드를 호출할 때 생성되거나, 인터페이스 타입 변수에 대입할 때 new 예약어를 사용하여 생성  
|

## 인스턴스 내부 클래스와 정적 내부 클래스
```java
class OutClass{
	private int num = 10;
	private static int sNum = 20;
	private InClass inClass;
	
	public OutClass(){
		inClass = new InClass();
	}
	
	class InClass{
		int iNum  = 100;
		
		void inTest() {
			System.out.println(num);
			System.out.println(sNum);
		}
	}
	
	public void usingInner() {
		inClass.inTest();
	}
	
	static class InStaticClass{
		int inNum = 100;
		static int sInNum = 200;
		
		void inTest() {
			System.out.println(inNum);
			System.out.println(sInNum);
			System.out.println(sNum);
			
		}
		
		static void sTest() {
			System.out.println(sInNum);
			System.out.println(sNum);
			
		}
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
10<br>
20<br>
10<br>
20<br>
<br>
100<br>
200<br>
20<br>
200<br>
20
</div>
</details>
<br>

## 지역 내부 클래스
```java
class Outer{
	
	int outNum = 100;
	static int sNum = 200;
	
	Runnable getRunnable(int i) {
		
		int num = 100;
		class MyRunnable implements Runnable{

			@Override
			public void run() {
				
				System.out.println(num);
				System.out.println(i);
				System.out.println(outNum);
				System.out.println(Outer.sNum);
		
			}
		}
		
		return new MyRunnable();
	}
}

public class LocalInnerClassTest {

	public static void main(String[] args) {
		Outer outer = new Outer();
		Runnable runnable = outer.getRunnable(50);
		
		runnable.run();
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
100<br>
50<br>
100<br>
200
</div>
</details>
<br>

## 익명 내부 클래스
```java
class Outer2{
	
	int outNum = 100;
	static int sNum = 200;
	
	Runnable getRunnable(int i) {
		
		int num = 100;
		
		return new Runnable() {
			
			@Override
			public void run() {
				
				System.out.println(num);
				System.out.println(i);
				System.out.println(outNum);
				System.out.println(Outer.sNum);
						
			}
		};
	}
	
	Runnable runner = new Runnable() {
		
		@Override
		public void run() {
			System.out.println("test");
			
		}
	};
	
}

public class AnonymousInnerClassTest {

	public static void main(String[] args) {
		Outer2 outer = new Outer2();
		outer.runner.run();
		
		Runnable runnable = outer.getRunnable(50);
		
		runnable.run();
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
test<br>
100<br>
50<br>
100<br>
200
</div>
</details>
<br>