# 배열 (Array)
## 목록
+ [배열(Array)](#배열---Array)
+ [객체 배열](#객체-배열)
+ [다차원 배열](#다차원-배열)
+ [ArrayList](#ArrayList)

# 배열 - Array
## 배열 선언하기
- 동일한 자료형의 순차적 자료 구조
```java
// 배열 선언하기
int[] arr = new int[10];
int arr[] = new int[10];
// 4바이트 크기의 메모리가 10개 생긴다.
```
## `배열 복사하기`
- 밑에의 과정은 얕은 복사이다. 얕은 복사는 주소만 복사되기 때문에 원본데이터를 바꾸면 복사데이터도 함께 변경된다.
- 깊은 복사를 하기 위해서는 객체를 새로 생성해주고 복사하여야 한다.
```java
int[] arr1 = { 10, 20, 30, 40, 50 };
int[] arr2 = { 1, 2, 3, 4, 5 };

System.arraycopy(arr1, 0, arr2, 1, 4); //arr1의 0번재부터 복사하여 arr2의 1번째에 4의 길이만큼 복사한다.

for (int i = 0; i < arr2.length; i++) {
	System.out.println(arr2[i]);
}
```
<details>
<summary>실행 결과</summary>
<div>
1<br>
10<br>
20<br>
30<br>
40
</div>
</details>
<br>


# 객체 배열 (Object Array)
```java
public class Book {
	public String title;
	public String author;

	public Book() {
	}

	public Book(String title, String author) {
		this.title = title;
		this.author = author;
	}
}
```
```java
public class BookArrayTest {

	public static void main(String[] args) {

		Book[] library = new Book[5];

	}
}
```
<br>

# 다차원 배열
```java
//다차원 배열 선언 방법
int[][] arr1 = new int[2][3];
int[][][] arr2 = new int[2][3][5];
```
<br>

# ArrayList
### 자바에서 제공되는 객체 배열이 구현된 클래스
```java
import java.util.ArrayList;

public class ArrayListTest {

	public static void main(String[] args) {
        //ArrayList 생성
		ArrayList<String> list = new ArrayList<String>();
		list.add("a");     //add() 배열에 값 추가하기
		list.add("b");     //add() 배열에 값 추가하기
		list.add("c");     //add() 배열에 값 추가하기
		
		for(String list : list) {
			System.out.println(list); 
		}

        System.out.println(list.get(0));    //get(i) i번째 값을 가져와라
        System.out.println(list.size());    //size() 배열의 크기 가져오기
	}
}
```
    