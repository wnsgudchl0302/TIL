# 조건문(Conditional)
## 목록
+ [if](#if)
+ [if~else](#if~else)
+ [if~else if~else](#if~else-if~else)
+ [switch~case](#switch~case)
+ [향상된 switch~case](#향상된-switch~case)
### 프로그래밍을 하다보면 경우의 수가 발생한다. 경우의 수를 처리하기위해서 조건문을 활용해야 한다.
<br>

# if
### if문을 만나 조건식이 true이면 실행문을 실행시킨다.
```
if문 사용법
if(조건식) {
    실행문 <- 참일 경우에만 실행
}
```
```
int a = 10;
if(a%2==0){
    System.out.println("a는 짝수입니다.")
}
if(a%2==1){
    System.out.println("a는 홀수입니다.")
}
```
<details>
<summary>실행 결과</summary>
<div>
a는 짝수입니다.
</div>
</details>
<br>

# if~else
### 참이면 if문을 실행하고 거짓이면 else문을 실행한다.
```
if(조건식){
    실행문1 <- 참일 경우 실행
}else {
    실행문2 <- 거짓일 경우 실행
}
```
```
int a = 3;
if(a%2==0){
    System.out.println("짝수 입니다.");
}else{
    System.out.println("홀수 입니다.");
}
```
<details>
<summary>실행 결과</summary>
<div>
홀수 입니다.
</div>
</details>
<br>

# if~else if ~else
### 더 많은 조건들을 처리할수 있다.
```
if(조건식1){

    실행문1 <- 첫 번째 조건식이 참이면 실행

}else if(조건식2){

    실행문2 <- 첫 번째 조건식이 거짓이고 두 번째 조건식이 참이면 실행

}else{

    실행문3

}
```
```
int a = 3;
if(a>0){

    System.out.println("a는 0보다 큽니다.");

}else if(a<0){

    System.out.println("a는 0보다 작습니다.");

}else{

    System.out.println("a는 0입니다.");

}
```
<details>
<summary>실행 결과</summary>
<div>
a는 0보다 큽니다.
</div>
</details>
<br>

# switch~case
### if문과 다르게 변수의 값이나 연산식이 비교값과 정확하게 일치하면 실행문을 처리한다.
```
switch(변수 or 연산식){

    case 비교값1 : (실행문1)
                    break;

    case 비교값2 : (실행문2)
                    break;

    case 비교값3 : (실행문3)
                    break;

    default : (실행문4)               
}
```
```
int n = 3;
switch(n){
    case 1 : System.out.println("1");
    case 2 : System.out.println("2");
    case 3 : System.out.println("3");
    case 4 : System.out.println("4");
    case 5 : System.out.println("5");
    default : System.out.println("1~5의 수가 아닙니다.");
}
```
<details>
<summary>실행 결과</summary>
<div>
3
</div>
</details>
<br>

# 향상된 switch~case
```
switch(변수 or 연산식){
    case 비교값1 -> (실행문1)
    case 비교값2, 비교값3 -> (실행문2)
    default -> (실행문3)
}
```
```
int a = 3;
switch(a){

    case 1, 3, 5 -> System.out.println("홀수입니다.");
    case 2, 4, 6 -> System.out.println("짝수입니다.");
    default System.out.println("1~6의 수가 아닙니다.");
}
```
<details>
<summary>실행 결과</summary>
<div>
홀수입니다.
</div>
</details>
<br>
