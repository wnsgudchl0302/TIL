# 반복문(Loop)
## 목록
+ [for문](#for문)
+ [다중 for문](#다중-for문)
+ [향상된 for문](#향상된-for문)
+ [while문](#while문)
+ [do~while문](#do~while문)
+ [break문](#break문)
+ [continue문](#continue문)
### 반복문은 같은 패턴 작업을 반복할 때 사용한다.
# for문
### 지정된 횟수만큼 반복을 실행한다
```
for(1.초기식; 2.조건식; 4.증감식){
    3.실행문
}
```
1.초기식 실행 후 2.조건식에서 참 거짓을 구분한다 참이면 3.실행문을 수행하고 처리가 완료되면 4.증감식을 실행합니다.

```
for(int i = 0; i < 10; i++){
    System.out.println(i+1);
}
```
<details>
<summary>실행 결과</summary>
<div>
1<br>
2<br>
3<br>
4<br>
5<br>
6<br>
7<br>
8<br>
9<br>
10
</div>
</details>
<br>

# 다중 for문
### 반복문안에 반복문이 들어간 코드
```
for(int i =0; i<3; i++) {
	for(int j=0; j<i+1; j++) {
		System.out.print("*");
	}
	System.out.println();
}
```
<details>
<summary>실행 결과</summary>
<div>
*<br>
**<br>
***
</div>
</details>
<br>

# 향상된 for문
### JDK 1.5부터 추가됨. 배열을 for문으로 간단하게 구현하기
```
for(자료형 변수명 : 배열명){
    실행문
}
```
```
int[] n = new int[] { 1, 2, 3, 4, 5 };

for (int a : n) {
	System.out.println(a);
}
```
<details>
<summary>실행 결과</summary>
<div>
1<br>
2<br>
3<br>
4<br>
5
</div>
</details>
<br>

# while문
### for문과 비슷하지만 조건식만 가지고 있다. 조건식이 true인 동안 실행문이 계속 실행되며 조건식이 false가 되면 반복문을 빠져나갑니다.
```
초기식
while(조건식){
    실행문
}
```
```
int i = 1;
while (i < 10) {
	System.out.println(i);
	i++;
}
```
<details>
<summary>실행 결과</summary>
<div>
1<br>
2<br>
3<br>
4<br>
5<br>
6<br>
7<br>
8<br>
9
</div>
</details>
<br>

# do~while문
### while문과 비슷하지만 한번 실행한후 조건식을 확인하고 조건식이 true면 false가 될 때까지 반복한다.
```
do{
    실행문
} while(조건식)
```
```
int i = 1;
do {
	for(int j = 0; j<i; j++) {
		System.out.print("*");
	}
	System.out.println();
	i++;
}while(i<=3);
```
<details>
<summary>실행 결과</summary>
<div>
*<br>
**<br>
***
</div>
</details>
<br>

# break문
### 코드 실행 도중 break문을 만나면 블럭 밖으로 빠져나간다.
```
int i = 1;
while (i < 10) {
	System.out.println(i);
	i++;
	if(i==5) {
		break;
	}
}
```
<details>
<summary>실행 결과</summary>
<div>
1<br>
2<br>
3<br>
4
</div>
</details>
<br>

# continue문
### continue문은 break문과 다르게 만나게 되면 현재의 실행문을 종료하고 조건문으로 돌아가서 반복문의 증감식을 이어나간다.
```
for (int i = 0; i < 10; i++) {
	if (i % 2 == 0) {
		continue;
	}
	System.out.println(i);
}
```
<details>
<summary>실행 결과</summary>
<div>
1<br>
3<br>
5<br>
7<br>
9
</div>
</details>

