# 예외와 예외 처리 (Exception Handling)
## 목록
+ [다양한 오류](#다양한-오류)
+ [오류와 예외](#오류와-예외)
+ [try - catch 문으로 예외처리 해보기 ](#try---catch-문으로-예외처리-해보기 )
+ [try - catch - finally 문으로 예외처리 해보기](#try---catch---finally-문으로-예외처리-해보기)
+ [try - with - resources 문](#try---with---resources-문)
+ [AutoCloseable 인터페이스 사용해보기](#autoCloseable-인터페이스-사용해보기)
+ [다양한 예외 처리](#다양한-예외-처리)
+ [사용자 정의 예외](#사용자-정의-예외)

## 다양한 오류
- 컴파일 오류 - 프로그램 코드 작성 중 발생하는 문법적 오류
- 실행 오류 - 실행 중인 프로그램이 의도 하지 않은 동작을 하거나 프로그램이 중지 되는 오류

## 오류와 예외
- 시스템 오류 - 가상 머신에서 발생, 프로그래머가 처리 할 수 없음, 동적 메모리를 다 사용한 경우, stack over flow 등등
- 예외 - 프로그램에서 제어 할 수 있는 오류, 읽으려는 파일이 없는 경우, 네트워크나 소켓 연결 오류 등등

## 예외 클래스 
- 모든 예외 클래스의 최상위 클래스는 Exception 클래스이다.

### try - catch 문으로 예외처리 해보기 
```java
try{

    예외가 발생 할 수 있는 코드

}catch{

    try블록 안에서 예외가 발생했을 때 수행되는 분

}
```
### try - catch - finally 문으로 예외처리 해보기 
```java
try{

    예외가 발생 할 수 있는 코드

}catch{

    try블록 안에서 예외가 발생했을 때 수행되는 부분

}finally{

    예외 발생 여부와 상관 없이 항상 수행되는 부분

}
```
```java
public class ArrayExceptionTest {

	public static void main(String[] args) {
		int[] arr = new int[5];
		
		try {
			for(int i=0; i<=5; i++) {
				System.out.println(arr[i]);
			}
		}catch(ArrayIndexOutOfBoundsException e) {
			System.out.println(e);
			System.out.println("예외처리");
		}
		System.out.println("프로그램 종료");
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
0<br>
0<br>
0<br>
0<br>
0<br>
java.lang.ArrayIndexOutOfBoundsException: Index 5 out of bounds for length 5 <br>
예외처리<br>
프로그램 종료
</div>
</details>
<br>

## try - with - resources 문
```java
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class ExceptionTest {

	public static void main(String[] args) {
		
		try(FileInputStream fis = new FileInputStream("a.txt")) {
			
		} catch (FileNotFoundException e) {
			System.out.println(e);
		} catch (IOException e) {
			System.out.println(e);
		}
	}
}
```

## AutoCloseable 인터페이스 사용해보기
```java
public class AutoCloseObj implements AutoCloseable{

	@Override
	public void close() throws Exception {
		System.out.println("close()가 호출되었습니다.");
	}
}
```
```java
public class AutoCloseTest {

	public static void main(String[] args) {
		 AutoCloseObj obj = new AutoCloseObj();
				 
		try( AutoCloseObj obj2 = obj){
			throw new Exception();
			
		}catch(Exception e) {
			System.out.println(e);
		}
	}
}
```

<details>
<summary>실행 결과</summary>
<div>
close()가 호출되었습니다. <br>
java.lang.Exception
</div>
</details>
<br>

## 다양한 예외 처리
### 예외처리 미루기
- throws를 사용하여 예외처리를 미룬다
- try 블록에서 예외를 처리 하지 않고, 메서드 선언부에 throws를 추가한다.
- main()에서 throws를 사용사면 가상머신에서 처리됨

```java
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class ThrowsException {

	public Class loadClass(String fileName, String className) throws FileNotFoundException, ClassNotFoundException {
		FileInputStream fis = new FileInputStream(fileName);
		Class c = Class.forName(className);
		return c;
	}
	
	public static void main(String[] args)  {

		ThrowsException test = new ThrowsException();
		
		try {
			test.loadClass("a.txt", "java.lang.String");
	
		
		} catch (FileNotFoundException e) {
			System.out.println(e);
		} catch (ClassNotFoundException e) {
			System.out.println(e);
		} catch (Exception e ) {
			
		} 
		System.out.println("end");
		
	}

}
```

<details>
<summary>실행 결과</summary>
<div>
end
</div>
</details>
<br>

## 사용자 정의 예외
- JDK에서 제공되는 예외 클래스 외에 사용자가 필요에 의해 예외클래스를 정의하여 사용한다
- throw 키워드로 예외를 발생 시킨다.

```java
public class IDFormatException extends Exception{
	
	public IDFormatException(String message) {
		super(message);
	}
}
```
```java
public class IDFormatTest {
	
	private String userID;

	public String getUserID() {
		return userID;
	}

	public void setUserID(String userID) throws IDFormatException {
	
		if (userID == null) {
			throw new IDFormatException("아이디는 null 일수 없습니다");
		}
		else if( userID.length() < 8 || userID.length() > 20) {
			throw new IDFormatException("아이디는 8자 이상 20자 이하로 쓰세요");
		}
				
		this.userID = userID;
	}

	public static void main(String[] args) {
		
		IDFormatTest idTest = new IDFormatTest();
		
		String myId = null;
		
		try {
			idTest.setUserID(myId);
		} catch (IDFormatException e) {
			System.out.println(e);
		}
		
		myId = "123456";
		try {
			idTest.setUserID(myId);
		} catch (IDFormatException e) {
			System.out.println(e);
		}
	}

}
```
<details>
<summary>실행 결과</summary>
<div>
exception.IDFormatException: 아이디는 null 일수 없습니다 <br>
exception.IDFormatException: 아이디는 8자 이상 20자 이하로 쓰세요

</div>
</details>
<br>



