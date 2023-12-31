show tables;

/* 상품 테이블(product) */

create table product (
	idx 	int not null auto_increment primary key, 
	pName varchar(20) not null,  /* 상품명 */  /*모델명은 중복 불가 */
	price int not null /* 상품 가격 */

);
desc product;

insert into product values (default, '냉장고', 800000);

select * from product;

/* 판매 테이ㅐ블 */

create table sale (
	idx 	int not null auto_increment primary key, /* 판매테이블 고유 번호 */
	pName varchar(20) not null, /* 판매 상품명 */
	ea 		int not null default 0,		/* 판매 수량 */
	pDate datetime not null default now() /* 판매 날짜 */
);

desc sale;

insert into sale values (default, '냉장고', 2, default);