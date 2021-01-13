# 상속 (Inheritance)
## 목록
+ [상속 - Inheritance](#상속---Inheritance)
+ [묵시적 형변환](#묵시적-형변환)
+ [메서드 오버라이딩 - method overriding](#메서드-오버라이딩---method-overriding)
+ [다형성 - ploymorphism](#다형성---ploymorphism )
+ [상속은 언제 사용할까?](#상속은-언제-사용할까?)
+ [다운 캐스팅과 instanceof](#다운-캐스팅과-instanceof)

# 상속 - Inheritance
새로운 클래스를 정의 할 때 이미 구현된 클래스를 상속받아 기능들을 확장하여 사용할 수 있다.
<br>

상위 클래스 - `parent class`, base class, super clasee
<br>

하위 클래스 - `child class`, derived class, subclass

```java
class B extends A //상속 하는법 extends키워드 사용
```
extends 키워드 뒤에는 단 하나의 클래스만 사용이 가능하다.

하위 클래스가 생성될 때 상위 클래스가 먼저 생성되고 하위 클래스가 생성된다.
```java
public class Animal {
	public Animal() {
		System.out.println("Animal생성자 호출");
	}
}
```
```java
public class Dog extends Animal {
	public Dog() {		
		System.out.println("Dog생성자 호출");
	}
}

```
```java
public class AnimalTest {
	public static void main(String[] args) {
		Dog dog = new Dog();
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
Animal생성자 호출<br>
Dog생성자 호출
</div>
</details>
<br>

### `만약 상위 클래스의 기본생성자가 없는 경우 하위 클래스는 명시적으로 상위 클래스의 생성자를 호출해야한다. super()로 호출 가능`

## 묵시적 형변환
```java
public class AnimalTest {
	public static void main(String[] args) {
        //Animal 타입으로 생성
        Animal dog = new Dog();
	}
}
```
## 메서드 오버라이딩 - method overriding
메서드 오버라이딩(overriding)이은 상속 관계에 있는 부모 클래스에서 이미 정의된 메소드를 자식 클래스에서 같은 시그니쳐를 갖는 `메소드로 다시 정의하는 것`
```java
public class Animal {
	public Animal() {
		System.out.println("Animal생성자 호출");
	}
    public void run(){
        System.out.println("동물이 움직입니다.")
    }
}
```
```java
public class Dog extends Animal {
	public Dog() {		
		System.out.println("Dog생성자 호출");
	}
    //메소드 오버라이딩
    public void run(){
        System.out.println("강아지가 움직입니다.")
    }
}
```
## 다형성 - ploymorphism
하나의 코드가 여러 자료형으로 구현되어 실행 되는 것 <br>
같은 코드에서 여러 실행 결과가 나온다.
```java
class Animal {
	public void move() {
		System.out.println("동물이 움직입니다.");
	}
}

class Human extends Animal {
	public void move() {
		System.out.println("사람이 두발로 걷습니다.");
	}
}

class Tiger extends Animal {
	public void move() {
		System.out.println("호랑이가 네발로 걷습니다.");
	}
}

class Eagle extends Animal {
	public void move() {
		System.out.println("독수리가 하늘을 날아갑니다.");
	}
}

public class AnimalTest {

	public static void main(String[] args) {
		
        Animal hAnimal = new Human();
		Animal tAnimal = new Tiger();
		Animal eAnimal = new Eagle();
		
		AnimalTest test = new AnimalTest();
		// 하나의 코드가 다양한 실행구현을 만들어낸다.
        // 여러 클래스가 Animal 타입 하나로 처리 될 수 있다. 
        test.moveAnimal(hAnimal);
		test.moveAnimal(tAnimal);
		test.moveAnimal(eAnimal);
	}
	
	public void moveAnimal(Animal animal) {
		animal.move();
	}

}
```

## 상속은 언제 사용할까?
- `IS-A 관계 (is a relationship : inheritance)`
<br> `일반적인 개념과 구체적인 개념의 관계`
- HAS-A 관계 (composition) 에서는 사용 X
<br> 한 클래스가 다른 클래스를 소유한 관계

## 다운 캐스팅과 instanceof
### 다운캐스팅
- 묵시적으로 상위 클래스로 형변환된 인스턴스가 원래의 자료형으로 변환해야 할 때 사용
```java
Animal dog = new Dog();
Dog dog2 = (Dog)dog;
```
### instanceof
- instanceof는 참조변수가 참조하고 있는 인스턴스의 실제 타입을 알아보기 위해 사용
```java
Animal dog = new Dog();
if(dog instanceof Dog){
    Dog dog2 = (Dog)dog;
}
```
