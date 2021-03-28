# AndroidBaseApp

## 상단바 이미지 넣기
```java
getSupportActionBar().setDisplayShowHomeEnabled(true);
getSupportActionBar().setIcon(R.drawable.그림파일);
```

## xml파일 중 간단한 코드 설명

```java
android:layout_width="match_parent" // 가로길이

android:layout_height="wrap_content" // 세로길이

android:id="@+id/아이디이름" //아이디 설정

android:text="@string/이름" //text설정 string.xml파일에서 문자열을 생성하고 사용할 수 있다.
```
### string.xml 사용법
```java
<resources>
    <string name="이름">띄울 문자</string>
</resources>
```

## JAVA파일에서 xml파일의 변수 가져오기
```java
Button button1; //객체 생성 후

@Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        button1 = (Button) findViewById(R.id.button1); //아이디 값으로 가져오기
```

## 버튼 클릭시 이벤트 활성 코드 작성해보기
```java
button1.setOnClickListener(new View.OnClickListener() {
    @Override
        public void onClick(View view) {
            // 버튼 클릭시 실행될 코드 작성
        }
    });
```

### 간단한 이벤트
```java

    Toast.makeText(getApplicationContext(), "텍스트", Toast.LENGTH_SHORT).show(); // 클릭시 하단에 텍스트 띄우기

    Intent mintent = new Intent(Intent.ACTION_VIEW, Uri.parse("주소"));
    startActivity(mintent); //버튼 클릭시 "주소" 실행, "주소"에는 홈페이지, 전화, 갤러리열기 등등을 할수 있다.

    imageView.setImageResource(R.drawable.이미지이름); //이미지 띄우기

    finish(); //앱 종료
```

