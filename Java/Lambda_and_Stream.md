# 람다식과 스트림 (Lambda and Stream)
## 목록
+ [람다식](#람다식)
    + [람다식 문법](#람다식-문법)
+ [스트림](#스트림)
    + [중간연산](#중간연산)
    + [최종연산](#최종연산)
    + [배열을 사용](#배열을-사용)
    + [컬렉션을 사용](#컬렉션을-사용)
    + [reduce 연산](#reduce-연산)

## 람다식
- 자바에서 함수형 프로그래밍을 구현하는 방식
- 클래스를 생성하지 않고 함수의 호출만으로 기능을 수행
- 함수형 인터페이스를 선언함

## 람다식 문법
- 매개 변수 하나인 경우 괄호 생략가능
    ```java
    str -> {System.out.print(str);}
    ```
- 중괄호 안의 구현부가 한 문장인 경우 중괄호 생략 가능
    ```java
    str -> System.out.print(str);
    ```
- 중괄호 안의 구현부가 한 문장이라도 return문이라면 중괄호를 생략할 수 없음
    ```java
    str -> return str.length();
    ```
- 중괄호 안의 구현부가 반환문 하나라면 return과 중괄호를 모두 생략할 수 있다.
    ```java
    (x,y) -> x+y;
    str -> str.length();
    ```

## EXAMPLE
```java
@FunctionalInterface
public interface MyMaxNumber {
	int getMaxNumber(int x, int Y);
	
}
```
```java
public class TestMyNumber {

	public static void main(String[] args) {

		MyMaxNumber max = (x, y)-> (x >= y)?x : y;
		System.out.println(max.getMaxNumber(10, 20));
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
20
</div>
</details>
<br>

## 스트림
- 자료의 대상과 관계없이 동일한 연산을 수행할 수 있는 기능
- 배열, 컬렉션에 동일한 연산이 수행되어 일관성 있는 처리 가능
- 한번 생성하고 사용한 스트림은 재사용할 수 없다.
- 중간 연산과 최종 연산으로 구분 됨
- 최종 연산이 수행되어야 모든 연산이 적용되는 지연 연산이다.

## 중간연산
- filter(), map()
- 조건에 맞는 요소를 추출 filter()하거나 요소를 변환 함 map()

### 최종연산
- 스트림의 자료를 소모 하면서 연산을 수행
- 최종연산 후에 스트림은 더 이상 다른 연산을 적용할 수 없다.
- forEach() - 요소를 하나씩 꺼내옴
- count() - 요소의 개수
- sum() - 요소의 합

### 배열을 사용
```java
import java.util.Arrays;

public class IntArrayTest {

	public static void main(String[] args) {

		int[] arr = {1,2,3,4,5};
		
		int sum = Arrays.stream(arr).sum();
		int count = (int)Arrays.stream(arr).count();
		
		System.out.println(sum);
		System.out.println(count);
		
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
15<br>
5
</div>
</details>
<br>

### 컬렉션을 사용
```java
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

public class ArrayListStreamTest {

	public static void main(String[] args) {

		List<String> sList = new ArrayList<String>();
		sList.add("Tomas");
		sList.add("Edward");
		sList.add("Jack");
		
		Stream<String> stream = sList.stream();
		stream.forEach(s->System.out.print(s + " "));
		System.out.println();
		
		sList.stream().sorted().forEach(s->System.out.print(s + " "));
		System.out.println();
		sList.stream().map(s->s.length()).forEach(n->System.out.println(n));
		
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
Tomas Edward Jack <br>
Edward Jack Tomas <br>
5<br>
6<br>
4
</div>
</details>
<br>

## reduce 연산
- 정의된 연산이 아닌 프로그래머가 직접 지정하는 연산을 적용
- 최종 연산으로 스트림의 요소를 소모하며 연산을 수행
```java
import java.util.Arrays;
import java.util.function.BinaryOperator;

class CompareString implements BinaryOperator<String>{

	@Override
	public String apply(String s1, String s2) {
		if(s1.getBytes().length >= s2.getBytes().length)
			return s1;
		else return s2;
	}
	
}

public class ReduceTest {

	public static void main(String[] args) {

		String[] greetings = {"안녕하세요~~~", "hello", "Good morning", "반갑습니다"};
		
		System.out.println(Arrays.stream(greetings).reduce("", (s1, s2)->
			{ if(s1.getBytes().length >= s2.getBytes().length)
				return s1;
			else return s2;
			
			}));
		
		System.out.println(Arrays.stream(greetings).reduce(new CompareString()).get());
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
안녕하세요~~~<br>
안녕하세요~~~
</div>
</details>
<br>
