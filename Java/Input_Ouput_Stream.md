# 입출력 스트립Input_Ouput_Stream
## 목록
+ [입출력 스트림](#입출력-스트림)
+ [표준 입출력](#표준-입출력)
+ [바이트 단위 스트림](#바이트-단위-스트림)
+ [문자 단위 스트림](#문자-단위-스트림)
+ [보조 스트림](#보조-스트림)
+ [직렬화](#직렬화)
+ [그 외 입출력 클래스](#그-외-입출력-클래스)
+ [데코레이터 패턴](#데코레이터-패턴)

## 입출력 스트림
- 네트워크에서 자료의 흐름이 물과 같다는 의미에서 유래
- 다양한 입출력 장치에 독립적으로 일관성 있는 입출력 방식 제공
- 입출력이 구현 되는 곳에서는 모두 I/O 스트림을 사용 - 키보드, 파일 디스크, 메모리 등등

## 입출력 스트림 구분
- I/O 대상 기준 : 입력 스트림, 출력 스트림
- 자료의 종류 : 바이트 스트림, 문자 스트림
- 스트림의 기능 : 기반 스트림, 보조 스트림

<hr>

### `입력 스트림` - 대상으로 부터 자료를 읽어드리는 스트림

### `출력 스트림` - 대상으로 자료를 출력하는 스트림

### `바이트 단위 스트림` - 바이트 단위로 자료를 읽고 씀

### `문자 단위 스트림` - 문자는 2바이트씩 처리해야 함

### `기반 스트림` - 개상에 직접 자료를 읽고 쓰는 기능의 스트림

### `보조 스트림` - 직접 읽고 쓰는 기능은 없고 추가적인 기능을 제공해주는 스트림, 기반 스트림이나 또 다른 보조 스트림을 생성자의 매개변수로 포함함

## 표준 입출력
### `System.in 사용`

보조 스트림을 사용하여 한글사용해보기
```java
import java.io.IOException;
import java.io.InputStreamReader;

public class SystemInTest {

	public static void main(String[] args) {

		System.out.println("입력 : ");

		try {
			int i;
			InputStreamReader isr = new InputStreamReader(System.in);
			while ((i = isr.read()) != '끝') {
				System.out.println((char) i);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
```

## Console 클래스
- System.in 을 사용하지 않고 콘솔에서 표준 입출력이 가능
- 이클립스와는 연동되지 않음

## 바이트 단위 스트림
- InputStream : 바이트 단위 입력 스트림 최상위 클래스
- OutputStream : 바이트 단위 출력 스트림 최상위 클래스
- FileInputStream, FileOutputStream
    - 파일에 한 바이트씩 자료를 읽고 쓰는데 사용
    - 입력 스트림은 파일이 없는 경우 예외 발생
    - 출력 스트림은 파일이 없는 경우 파일을 생성하여 출력

```java
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

public class FileInputTest2 {

	public static void main(String[] args) {

		try (FileInputStream fis = new FileInputStream("input.txt")) {
			int i;
			while ((i = fis.read()) != -1) {
				System.out.print((char) i);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("\nend");
	}
}
```
```java
import java.io.FileOutputStream;
import java.io.IOException;

public class FileOutputTest1 {

	public static void main(String[] args) {
		
		try(FileOutputStream fos = new FileOutputStream("output.txt", true)){
			fos.write(65);
			fos.write(66);
			fos.write(67);
		} catch (IOException e) {
			System.out.println(e);
		}
	}
}
```
```java
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class FileOutputTest2 {

	public static void main(String[] args) {
		
		byte[] bs = new byte[26];
		byte data =  65;
		for(int i = 0; i<bs.length; i++) {
			bs[i] = data;
			data++;
		}
		try(FileOutputStream fos = new FileOutputStream("alpha.txt");
				FileInputStream fis = new FileInputStream("alpha.txt")){
			fos.write(bs);
			int i;
			while((i= fis.read()) != -1) {
				System.out.print((char)i);
			}
		} catch (IOException e) {
			System.out.println(e);
		}
	}
}
```
## 문자 단위 스트림
- Reader : 문자 단위로 읽는 최상위 스트림
- Writer : 문자 단위로 읽는 최상위 스트림
- FileReader, FileWriter
    - 파일에 문자를 읽고 쓸때 가장 많이 사용하는 클래스
    - 문자의 인코딩 방식을 지정할 수 있다.

보조스트림 사용
```java
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

public class FileReaderTest {

	public static void main(String[] args) throws IOException {

		FileInputStream fis = new FileInputStream("reader.txt");
		InputStreamReader isr = new InputStreamReader(fis);
		int i;
		while ((i = isr.read()) != -1) {
			System.out.print((char) i);
		}
		fis.close();
	}
}
```
```java
import java.io.FileWriter;
import java.io.IOException;

public class FileWriterTest {

	public static void main(String[] args) throws IOException {

		FileWriter fw = new FileWriter("writer.txt");

		fw.write('A');
		char[] buf = { 'B', 'C', 'D', 'E', 'F' };
		fw.write(buf);
		fw.write("안녕하세요");
		fw.write(buf, 2, 2);
		fw.close();
	}
}
```
## 보조 스트림
- 실제 읽고 쓰는 스트림이 아닌 보조적인 기능을 추가하는 스트림
- FilterInputStream, FileOutputStream이 보조스트림의 상위 클래스이다.

## 직렬화
- 인스턴스의 상태를 그대로 저장하거나 네트워크로 전송하고 이를 다시 복원 하는 방식
- ObjectInputStream과 ObjectOutputStream을 사용한다.
- Serializable 인터페이스
    - 직렬화는 인스턴스의 내용이 외부로 유출되는 것이므로 프로그래머가 객체의 직렬화 가능 여부를 명시함
```java
import java.io.Externalizable;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;
import java.io.Serializable;

class Person implements Serializable{
	String name;
	transient String job; //직렬화 할 수 없음
	
	public Person(String name, String job) {
		this.name = name;
		this.job = job;
	}
	
	public String toString() {
		return name + "," + job;
	}

	@Override
	public void writeExternal(ObjectOutput out) throws IOException {
	}

	@Override
	public void readExternal(ObjectInput in) throws IOException, ClassNotFoundException {
	}
}

public class SerializationTest {

	public static void main(String[] args) {

		Person personLee = new Person("이순신", "엔지니어");
		Person personKim = new Person("김유신", "선생님");
		
		try( FileOutputStream fos = new FileOutputStream("serial.dat");
				ObjectOutputStream oos = new ObjectOutputStream(fos)){
			oos.writeObject(personLee);
			oos.writeObject(personKim);
			
		}catch(IOException e) {
			System.out.println(e);
		}

		try( FileInputStream fis = new FileInputStream("serial.dat");
				ObjectInputStream ois = new ObjectInputStream(fis)){
		
			Person p1 = (Person)ois.readObject();
			Person p2 = (Person)ois.readObject();
			
			System.out.println(p1);
			System.out.println(p2);
			
		}catch(IOException e) {
			System.out.println(e);
		}catch(ClassNotFoundException e) {
			System.out.println(e);
		}
	}
}
```

## 그 외 입출력 클래스
- File 클래스
    - 파일개념을 추상화한 클래스
    - 입출력 기능은 없고 파일의 속성, 경로, 이름 등을 알 수 있음
- RandomAccessFile 클래스
    - 입출력 클래스 중 유일하게 파일 입출력을 동시에 할 수 있는 클래스
    - 파일 포인터가 있어서 읽고 쓴느 위치의 이동이 가능함
    - 다양한 자료형에 대한 메서드가 제공 됨

```java
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;

public class RandomAccessFileTest {

	public static void main(String[] args) throws IOException {

		RandomAccessFile rf = new RandomAccessFile("random.txt", "rw");
		rf.writeInt(100);
		System.out.println(rf.getFilePointer());
		rf.writeDouble(3.14);
		rf.writeUTF("안녕하세요");
		
		rf.seek(0);
		int i = rf.readInt();
		double d = rf.readDouble();
		String str = rf.readUTF();
		
		System.out.println(i);
		System.out.println(d);
		System.out.println(str);
		rf.close();
		
	}

}
```

## 데코레이터 패턴
- 자바의 입출력 스트림은 데코레이터 패턴을 사용한다.
- 실제 입출력 기능을 가진 객체와 그 외 다양한 기능을 제공하는 데코레이터를 사용하여 다양한 입출력 기능을 구현
- 상속보다 유연한 확장성을 가짐
- 지속적인 서비스의 증가와 제거가 용이함