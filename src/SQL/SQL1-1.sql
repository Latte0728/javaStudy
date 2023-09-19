--------------------- DB 다루기 구문 --------------------------
-- 데이터베이스 보기
show databases;

-- 만약 sqlDB가 존재하면 우선 지운다.
drop database if exists sqlDB;

-- 데이터베이스 생성
create database sqlDB;

-- 데이터베이스 선택
use sqlDB;

------ 유닉스 환경의 MySQL에서는 데이터베이스 이름의 대소문자를 구분합니다.
------ 그러나 윈도우 환경의 MySQL에서는 데이터베이스의 이름에 대소문자를 구분하지 않습니다.
------ 하지만 될 수 있으면 언제나 데이터베이스의 이름은 대소문자를 구분하여 사용하는 것이 가독성 측면에서도 좋습니다.

------------------------ 테이블 생성 -------------------------
create table DB명.테이블명(
컬럼명1 Int primary key AUTO_Increment, -- 기본키 숫자 자동 증가 설정
컬럼명2 char(15) not null,
컬럼명3 Int,

primary key(컬럼명1),
foreign key(컬럼명2) references 테이블명(컬럼명) -- 자기 자신 외래키 참조
foreign key(컬럼명3) references 다른 테이블명(컬럼명a) -- 다른 테이블 외래키 참조
);

-- 테이블 이름을 띄어쓰기 하고 싶으면 ' '를 반드시 넣어야 한다.
create table 'my testABC'(id INT);

--------------- 테이블 제약 조건(1) -----------------------------

NOT NULL : 해당 필드는 NULL 값을 저장할 수 없게 됩니다.
UNIQUE : 해당 필드는 서로 다른 값을 가져야만 합니다.
PRIMARY KEY : 해당 필드가 NOT NULL과 UNIQUE 제약 조건의 특징을 모두 가지게 됩니다.
FOREIGN KEY : 하나의 테이블을 다른 테이블에 의존하게 만듭니다.
DEFAULT : 해당 필드의 기본값을 설정합니다.
AUTO_INCREMENT : 해당 필드의 값을 1부터 시작하여 새로운 레코드가 추가될 때마다 1씩 증가된 값을 저장합니다.
---------------- 테이블 제약 조건(2) ------------------------------

create table buyABC
(
	num int auto_increment not null primary key, -- 자동으로 숫자 순서대로 증가
	userID char(8) not null,
	price int not null default 80, -- 값이 입력되지 않을 때 기볼 값
	
	constraint 외래키이름 foreign key (userID) references(userID) on update cascade
	-- 외래키 지정. constraint 쓰면 외래키이름 지정, 안쓰면 필드값 자체가 이름이 됨
	-- 만일 부모키를 변경하거나 부모키가 변경될 경우 같이 외래키값도 변경
	);
	
	create table userABC
	(
	userID char(8)0 primary key,
	name varchar(10) not null unique,
	birthYear int not null,
	addr char(2) not null,
	mobile char(3),
	mdate date
	);
	
	--------------- 테이블 조회 -----------------------------
	show tables
	
	show table status -- 더 자세히 
	
	-- Name : 테이블 이름
	-- Type : 테이블 타입
	-- Row_format : 열 저장 형태(Fixed, Dynamic, Compressed)
	-- Rows : 열의 수 
	-- Avg_row_length : 열의 평균 길이
	-- Data_length : 데이터 파일의 길이
	-- Max_data_length : 데이터 파일의 최대 길이
	-- Index_length : 인덱스 파일의 길이
	-- Data_free : 사용되지 않는 bytes에 할당된 수 
	-- Auto_increment : 다음 자동 증가 변수 
	-- Create_time : 테이블이 생성된 시간
	-- Update_time : 데이터파일의 마지막 update 시간
	-- Check_time : 테이블의 마지막 체크 시간
	-- Create_options : 테이블 생성시의 기타 옵션
	-- Comment : 테이블 생성시의 명령어
	------------------------------- 테이블 구성도 -----------------------------
	
	show colums from 테이블명
	describe 테이블명
	desc 테이블명
	
	
	------------------------------ 테이블 데이터 조회 ----------------------------
	SELECT 컬럼명, 집계함수 as 별명 ----------------(5)
	FROM 테이블명 -------------------------------(1)
	WHERE 테이블 조건 ----------------------------(2)
	GROUP BY 컬럼명 -----------------------------(3)
	HAVING 그룹 조건 -----------------------------(4)
	ORDER BY 컬럼명 -------------------------------(6)
	
	--1. FROM : SQL은 구문이 들어오면 테이블을 가장 먼저 확인. 테이블이 없는데 다른 것들을 먼저 조회하면 에러
	--2. WHERE: 테이블에서 주어진 조건에 맞는 데이터들을 추출
	--3. GROUP BY : 공통적인 데이터들끼리 묶어 그룹을 만들어줌
	--4. HAVING : 공통적인 데이터들이 묶여진 그룹 중, 주어진 조건에 맞는 그룹들을 추출해줌
	--5. SELECT : 최종적으로 추출된 데이터들을 ( 또 함수로 묶어 계산결과를) 조회함
	--6. ORDER BY : 추출된 데이터들을 정렬
	
	-------------------- SQL 작성 순서 ----------------------------------------
	---1. select 필드1, 필드2, sum(필드명) as 별명
	---2. from 테이블명
	---3. where 필드명1=값(조건)
	---4. group by 필드명1
	---5. having 별명 > 100 (그룹 조건)
	---6. order by 필드명2 desc (정렬)
	
	-------------------- SQL 실행 순서 -----------------------------------------
	
	--1. FROM : 어느 테이블에서
	--2. WHERE : 어느 조건을 만족하는 것만(select문에 집계함수가 있든 없든 무조건 where 조건부터 맞추고 집계한다.)
	--3. GROUP BY : 그룹핑
	--4. HAVING : 집계용 조건
	--5. SELECT : 필드(열)들과 집계함수 결과값을 선택하고 AS로 별명을 지정
	--6. ORDER BY: 정렬
	---------------------------------------------------------------------------
	
	--- 그룹핑 추가 정리
	--1. 그룹핑은 뭔가 sum()이나 avg()같은 묶음데이터들을 통계 낼때 사용하는 편.
	--2. 분담하고 싶은 필드를 정하고 그룹핑 해주면, 각 필드들의 값들이 임시로 묶음 처리 되어, 이 임시로 묶음 처리 됨
	--2-1. 다만 이 묶음 처리된 데이터를 테이블 구조로 표현할 수 없으니 빈칸으로 보여지게 되지만, 사실 안에는 여러 데이터들이 뭉쳐있음.
	--3. 따라서 이 데이터들을 이용해 sum()을 쓰면 값들을 더하고 avg()를 쓰면 평균을 구하게 되는 원리가 그룹핑 정의.
	--4. 다만 그룹화 한 것들은 특별해서, 따로 조건을 줄 때, where가 아닌 having으로 써야함.
	---4.1 where은 그룹핑 전 테이블을 제어
	---4.2 having은 그룹핑 후 테이블을 제어 