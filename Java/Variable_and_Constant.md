# 변수(Variable)와 상수(Constant)
## 목록
+ [변수(Variable)](#변수(variable))
    + [변수의 자료형](#변수의-자료형)
    + [형 변환](#형-변환(type-casting))
+ [상수(Constant)](#상수(constant))

>## 변수(Variable)

>> ## 변수의 자료형
+ 숫자형    
    + 정수형
        + byte
        + short
        + int
        + long
    + 실수형
        + float
        + double 

+ 문자형 (char)
+ 논리형 (boolean)
---
### 자료형 크기 
| `타입`  | `크기`  | `기본값`  |
|  :---:  | :---:  |   :---:   |
| `byte`  | 1 Byte |     0     |
| `short` | 2 Byte |     0     |
| `int`   | 4 Byte |     0     |
| `long`  | 8 Byte |     0L    |
| `float` | 4 Byte |    0.0f   |
|`double` | 8 Byte |0.0 or 0.0d|
| `char`  | 2 Byte |  '\u000'  |
|`boolean`| 1 Byte |   false   |

---

### 이스케이프 문자
| `지시자` | `설명` |
|  :---:  |  :---: |
|   %b    |  boolean   |
|   %d    |   10진수   |
|   %o    |   8진수    |
| %x, %X  |   16진수   |
|   %f    |실수형 10진수|
| %e, %E  | 지수형태표현|
|   %c    |    문자    |
|   %s    |   문자열   |
|   %n    |    개행    |

---

>>## 형 변환(Type casting)
### 묵시적 형 변환
작은 범위의 자료형을 더 큰 범위의 자료형에 넣으면 자동으로 형 변환이 일어나는 것

```
int i = 100;

double d = i;
```
### 명시적 형 변환
자료형의 범위가 큰 변수를 작은 변수로 변환

```
(자료형) 변수면(또는 리터럴)

int a = 10000;
short b = 40;

b = (short)a;
```

문자열과 숫자 자료형 간의 형 변환
```
String a1 = "123";
int a2 = Integer.parseInt(a1);
String a3 = Integer.toString(a2);

String b1 = "123.123"
float b2 = Float.parseFloat(b1);
String b3 = Float.toString(b2);
```
문자와 문자열 간의 형 변환
```
String a1 = "abcde";
char[] a2 = a1.toCharArray(); <-문자열을 문자 배열로 전환한 것

char b1 = 'a'
String b2 = String.valueOf(b1);
```
---
>>## 상수(Constant)
상수란.. " 값이 변하지 않는 수 "
```
상수 만드는 법
final [자료형] [변수명] = [리터럴];

final float PI = 3.14f;
```

var를 이용하여 상수를 만들 때에는 초기화를 함께 해주어야 한다.

```
final var PI;        --> X
final var PI = 3.14  --> O
```
