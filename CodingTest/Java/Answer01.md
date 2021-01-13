## Student 클래스
```java
import java.util.ArrayList;

public class Student {
	String studentName;
	int studentID;
	ArrayList<String> bookName;

	ArrayList<Book> Book;

	public Student(String studentName, int studentID) {
		this.studentName = studentName;
		this.studentID = studentID;

		Book = new ArrayList<Book>();
	}

	public void addBook(String bookName) {

		Book book = new Book(bookName);

		Book.add(book);

	}

	public void showStudentInfo() {

		System.out.print(studentName + "학생이 읽은 책은 : ");
		for (Book book : Book) {
			System.out.print(book.getBookName() + " ");
		}
		System.out.println("입니다.");
	}

}
```
## Book 클래스
```java
public class Book {
	
	private String bookName;

	public Book(String bookName) {
		this.bookName = bookName;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
}
```
## StudentTest 클래스
```java
public class StudentTest {

	public static void main(String[] args) {
		Student Lee = new Student("Lee",101);
		Student Kim = new Student("Kim",101);
		Student Cho = new Student("Cho",101);
		
		Lee.addBook("태백산맥1");
		Lee.addBook("태백산맥2");
		
		Kim.addBook("토지1");
		Kim.addBook("토지2");
		Kim.addBook("토지3");
		
		Cho.addBook("해리포터1");
		Cho.addBook("해리포터2");
		Cho.addBook("해리포터3");
		Cho.addBook("해리포터4");
		Cho.addBook("해리포터5");
		Cho.addBook("해리포터6");
		
		Lee.showStudentInfo();
		Kim.showStudentInfo();
		Cho.showStudentInfo();
	}

}
```