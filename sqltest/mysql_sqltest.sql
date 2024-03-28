 
Use kh; 
show tables;
 create table TB_MEMBER (MEMBER_ID varchar(20), MEMBER_PW varchar(20), MEMBER_NAME varchar(20), GRADE INT, AREA_CODE INT);
 insert into TB_MEMBER values('hong01', 'pass01', '홍길동', 10,02);
 insert into TB_MEMBER values('leess99', 'pass02', '이순신', 10,032);
 insert into TB_MEMBER values('ss50000', 'pass03', '신사임당', 30,031);
 insert into TB_MEMBER values('iu93', 'pass04', '아이유', 30,02);
 insert into TB_MEMBER values('pcs1234', 'pass05', '박철수', 20,031);
 insert into TB_MEMBER values('you_js', 'pass06', '유재석', 10,02);
 insert into TB_MEMBER values('kyh9876', 'pass07', '김영희', 20,031);
 
 create table TB_GRADE(GRADE_CODE int, GRADE_NAME varchar(30));
 insert into TB_GRADE values(10, '일반회원');
  insert into TB_GRADE values(20, '우수회원');
   insert into TB_GRADE values(30, '특별회원');

create table TB_AREA(AREA_CODE int, AREA_NAME varchar(30));
insert into TB_AREA values(02, '서울');
insert into TB_AREA values(031, '경기');
insert into TB_AREA values(032, '인천');

SELECT * FROM TB_MEMBER;
SELECT * FROM TB_GRADE;
SELECT * FROM TB_AREA;
-- 1-1
SELECT AREA_NAME, MEMBER_ID, MEMBER_NAME, GRADE_NAME FROM TB_MEMBER -- AS 생략 가능!!!
JOIN TB_GRADE ON(GRADE=GRADE_CODE)
JOIN TB_AREA using(AREA_CODE)
 -- 1. AREA_CODE 중복으로 프로그램이 구별을 못함 각자 따로 표시, 순서는 상관 없음
 -- 또는 USING을 사용하면 가능 -> using은 두 변수가 같은 이름이면 사용 가눙
WHERE TB_MEMBER.AREA_CODE = (
SELECT AREA_CODE FROM TB_MEMBER WHERE MEMBER_NAME='김영희') -- 2. dlias로 쓰면 안됨
ORDER BY MEMBER_NAME ASC; -- 3. DESC가 아니 ASC

-- 1-2
SELECT MEMBER_ID AS 아이디, MEMBER_PWD 비밀번호, MEMBER_NAME AS 이름, GRADE_NAME AS 등급명, -- 1. 지역명이 생략됨
	area_NAME AS 지역명
    FROM TB_MEMBER
	JOIN TB_GRADE on (Grade = GRADE_CODE) --  2. USING은 칼럼명이 일치할 때만 사용한다
	JOIN TB_AREA USING(AREA_CODE)
	WHERE (GRADE, TB_MEMBER.AREA_CODE) =(
    SELECT GRADE, AREA_CODE FROM TB_MEMBER WHERE MEMBER_ID = '%1234%')-- 3. 1234가 아닌 포함된 아이디를 찾아야하므로 오류
	ORDER BY MEMBER_ID DESC;
    
    -- 1-3 
SELECT ROWNUM 번호, MEMBER_ID 아이디, MEMBER_NAME 이름, GRADE_NAME 등급명, AREA_NAME 지역명 -- 1. rOWNUM은 없는 번호
	FROM (SELECT MEMBER_ID, MEMBER_NAME, GRADE_NAME -- 2. AREANAME 생략
	FROM TB_MEMBER
	JOIN TB_GRADE ON(GRADE = GRADE_CODE)
	JOIN TB_AREA USING(AREA_CODE)
	WHERE AREA_NAME = ('서울', '경기')) -- 3. =대신 IN을 사용해야 한다. 
	ORDER BY MEMBER_ID;
    
    SELECT MEMBER_ID 아이디, MEMBER_NAME 이름, GRADE_NAME 등급명, AREA_NAME 지역명
	FROM TB_MEMBER
	JOIN TB_GRADE ON(GRADE = GRADE_CODE)
	JOIN TB_AREA USING(AREA_CODE)
	WHERE AREA_NAME IN ('서울', '경기')
	ORDER BY MEMBER_ID;