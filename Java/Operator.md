# 연산자(Operator)
## 목록
+ [산술 연산자](#산술-연산자)
+ [증감 연산자](#증감-연산자)
+ [비교 연산자](#비교-연산자)
+ [논리 연산자](#논리-연산자)
+ [비트 연산자](#비트-연산자)
+ [복합대입 연산자](#복합대입-연산자)
+ [삼항 연산자](#삼항-연산자)

# 산술 연산자

|`연산지`|`명칭`|`EX`|
|:---:| :---: | :---: |
| `+` | 더하기 | A + B |
| `-` |  빼기  | A - B |
| `*` | 곱하기 | A * B |
| `/` | 나누기 | A / B |
| `%` | 나머지 | A % B |

<br>

```java
int a = 20;
int b = 10;

System.out.println(a+b);
System.out.println(a-b);
System.out.println(a*b);
System.out.println(a/b);
System.out.println(a%b);
```
<details>
<summary>실행 결과</summary>
<div>
30 <br>
10 <br>
200 <br>
2 <br>
0 
</div>
</details>
<br>

# 증감 연산자
## 전치 증감 연산자
```java
int a = 1;
System.out.println(++a);

int b = 10;
System.out.println(--b);
```
<details>
<summary>실행 결과</summary>
<div>
2 <br>
9
</div>
</details>
<br>

## 후치 증감 연산자
```java
int a = 1;
System.out.println(a++);
System.out.println(a);

int b = 10;
System.out.println(b--);
System.out.println(b);
```
<details>
<summary>실행 결과</summary>
<div>
1 <br>
2 <br>
10 <br>
9
</div>
</details>
<br>

# 비교 연산자

|`연산자`|`EX`|`설명`|
|:---: | :---:  | :---: |
|  `<` | x < y  | x는 y보다 작다. |
|  `>` | x > y  | x는 y보다 크다. |
| `<=` | x <= y | x는 y보다 작거나 같다. |
| `>=` | x >= y | x는 y보다 크거나 같다. |
| `==` | x == y | x와 y는 작다. |
| `!=` | x != y | x와 y는 같지 않다. |

<br>

```java
int a = 1;
int b = 2;

System.out.println(x < y);
System.out.println(x > y);
System.out.println(x <= y);
System.out.println(x >= y);
System.out.println(x == y);
System.out.println(x != y);
```

<details>
<summary>실행 결과</summary>
<div>
true <br>
false <br>
true <br>
false <br>
false <br>
true
</div>
</details>
<br>

# 논리 연산자

|`연산자`|`연산자명`|`EX`|`설명`|
|:---: | :---:  | :---: | :---: |
| `&` | 논리곱(AND)        | A & B | A와 B 모두가 참이면 참 아니면 거짓|
| `|` | 논리합(OR)         | A \| B| A와 B 둘 중 하나 이상 참이면 참 둘 다 거짓이면 거짓|
| `^` | 배타적 논리합(XOR) | A ^ B | A와 B가 다르면 참, 같으면 거짓|
| `!` | 논리부정(NOT)      |  !A   | A가 참이면 거짓, A가 거짓이면 참|

<br>

# 비트 연산자
|`연산자`|`명칭`|`설명`|
|:---: | :---:  | :---: |
|  `&` | AND  | 두 비트 모두 1일때 1반환|
|  `|` | OR  | 두 비트 중 적어도 하나가 1이면 1반환|
| `^` | XOR | 두 비트가 다르변 1반환 |
| `~` | NOT | 0인 비트는 1로, 1인 비트는 0으로 반전|
| `<<` | Sigend left shift | 비트를 왼쪽으로 이동 |
| `>>` | Sigend right shift |비트를 오른쪽으로 이동 |
| `>>>` | Unsigned right shift | 왼쪽의 남는 비트를 부호화는 무관하게 0으로 채움 |

<br>

# 복합대입 연산자
|`연산자`|`EX`|`설명`|
|:---: | :---:  | :---: |
|  `+=` | A += 3  | 변수 A에 3을 더한 후, 결과값을 변수 A에 대입 |
|  `-=` | A -= 3  | 변수 A에 3을 뺀 후, 결과값을 변수 A에 대입 |
| `*=` | A *= 3 | 변수 A에 3을 곱한 후, 결과값을 변수 A에 대입 |
| `/=` | A /= 3 | 변수 A에 3을 나눈 후, 결과값을 변수 A에 대입. |
| `%=` | A %= 3 | 변수 A에 3을 나눈 후, 나머지 값을 변수 A에 대입 |

<br>

```java
int A = 10;

System.out.println(A += 10);
System.out.println(A -= 10);
System.out.println(A *= 10);
System.out.println(A /= 10);
System.out.println(A %= 10);
```
<details>
<summary>실행 결과</summary>
<div>
20 <br>
10 <br>
100 <br>
10 <br>
0 
</div>
</details>
<br>

# 삼항 연산자
```java
(조건식) ? 처리식1(참일 때 처리) : 처리식2(거짓일 때 처리) // 1항 ? 2항 : 3항

int A = 10;
int B = (A==10) ? (B=100) : (B=200);
System.out.println(B);
```
<details>
<summary>실행 결과</summary>
<div>
100
</div>
</details>
<br>