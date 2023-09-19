show tables; -- 데이터베이스 보기

create table test1 (
  idx  int  not null auto_increment primary key,
  name varchar(20) not null
);

desc test1;

select * from test1;

insert into test1 values (default, '홍길동');
insert into test1 values (default, '김말숙');
insert into test1 values (default, '이기자');
insert into test1 values (default, '소나무');
insert into test1 values (default, '대나무');
insert into test1 values (default, '감나무', 35);
insert into test1 values (default, '대추나무', 40, '경주');
insert into test1 values (default, '가가가', 40, '경주','남자');
insert into test1 values (default, '나나나', 24, '광주','여자');
insert into test1 values (default, '다다다', 34, '전주','남자');
insert into test1 values (default, '라라라', 41, '나주','여자');
insert into test1 values (default, '마마마', 45, '음성','남자');
insert into test1 values (default, '바바바', 34, '남양주','남자');
insert into test1 values (default, '사사사', 45, '증평','남자');
insert into test1 values (default, '아아아', 42, '괴산','여자');
insert into test1 values (default, '자자자', 43, '청주','남자');
insert into test1 values (default, '차차차', 44, '서울','남자');
insert into test1 values (default, '카카카', 45, '광주','여자');
insert into test1 values (default, '파파파', 34, '인천','남자');
insert into test1 values (default, '하하하', 34, '서울','여자');

drop table test1;		-- 테이블의 구조까지 완전히 삭제한다.(데이터를 포함)

-- 컬럼추가(add column)
-- test1테이블에 age컬럼을 추가(int, default 15)
alter table test1 add column age int default 15;

-- test1테이블에 addr컬럼을 추가(varchar(50))
alter table test1 add column addr varchar(50);

-- test1테이블의 addr컬럼을 address로 변경(change / modify)하시오.

alter table test1 change  column addr address varchar(50);  
-- test1테이블의 address컬럼의 varchar(50)을 30Byte로 변경(change / modify)하시오.
alter table test1 change  column addr address varchar(30);

-- 컬럼 삭제(drop column)
alter table test1 drop column;
-- address컬럼을 추가(varchar(30) default '청주')
alter table test1 add column address  varchar(30) default'청주';

-- test1 테이블을 exam 테이블로 이름변경(rename)
alter table test1  rename exam;

-- exam테이블을 삭제하시오(구조를 완전삭제)
drop test1 from exam;
derop exam from test1;
-------------------------------------------------------------------
-- DML(데이터 조작어)

desc test1;

-- test1테이블 내용보기
select * from test1




-- test1테이블의 '성명/나이'정보의 모든 레코드를 보여주시오.
select * name,age from test1;
--select test1 from (name or age);
select name,age from test1;
-- 홍길동의 나이를 25세로 변경(update 테이블명 set 필드명 = '변경내용' where__조건__;)
update test1 set  age = 40 where name ='홍길동'; 

-- 홍길동의 성별을 남자로 변경
update test1 set gender = '남자' where name = '홍길동';

-- '이기자'의 성별을 남자로 변경
update test1 set gender = '남자' where name = '이기자';

-- '소나무/대나무/가나다/나나나/마마마'의 성별을 '여자'로 변경
update test1 set gender ='여자' where name = '소나무' or name ='대나무' or name='가나다' or name='나나나' or name='마마마';

-- '파파파/차차차/사삿'의 성별을 '여자'로 변경
update test1 set gender ='여자' where name = '파파파' or name='차차차' or name='사삿';

-- 정렬 : order by 필드명 _옵션__	:		옵션 생략시는 오름차순(asc), 내림차순(desc)
select * from test1 order by name
select * from test1 order by name desc;
-- 나이 내림차순...
select * from test1  order by age desc;

-- 성별 오름차순
select * from test1 order by gender;

-- 성별 오름차순... 그런데, 성별이 같으면 두번째 키는 성명 내림차순
select * from test1 order by gender, name desc;

-- 성별 내림차순 출력, 단 성별이 같으면 나이가 적은 사람을 우선적으로 출력하시오.

-- 1차 성별 내림차순, 2차 주소 오름차순, 3차 나이 내림차순, 4차 idx내림차순으로 출력하시오.


--나이가 30대만 출력하시오?(30~39) : between _ and _


--나이가 30대이면서 남자만 출력하시오?(30~39)


----나이가 30대이면서 남자만 이름 내림차순 출력하시오?(30~39)


-- 나이가 30대이거나 50대인 자료만 출력?


-- 서울에 살거나 청주에 사는 사람을 출력

-- 서울에 살거나 청주에 사는 사람중에서 나이가 20대 이하만 출력?

-- 서울에 살거나 나이가 20대 인 남자만 출력?


-- '성'이 '가' 씨만 출력?(like연산자 : %(복수개의 여러개를 대변함= 복수개의 와일드 카드))

-- 주소의 마지막 글자가 '주'로 끝나는 자료 출력?


-- 이름중에서 중간에 '나' 자를 포함한 자료 출력?
select * from test1 where name like '%나%';

-- 이름중에서 두번째 글자가 '나'자를 포함한 자료 출력?
select * from test1 where name like '_나%';

-- 이름중에서 두번째 글자가 '나'자를 포함한 자료의 '성명/주소'를 출력?
select name, address from test1 where name like '_나%';

-- 자료를 10개만 출력하시오?(제한 : limit)
select * from test1 limit 10;

-- 인덱스번호 4에서부터 5개?
select * from test1 limit 4,5;

-- 주소의 마지막 글자가 '주'로 끝나는 자료의 나이를 1살씩 추가해주세요?
update test1 set age=age+1 where address like '%주' 

-- 서울에 사는 남자를 삭제하시오?
delete  from test1 where address='서울' and gender='남자'

-- 나이가 많은 사람 5명만 출력하세요?
select * from test1 where order by age desc limit 5;