#부서 테이블
drop table dept CASCADE CONSTRAINTS;
create table dept(
	deptno varchar2(15) primary key,
	deptname varchar2(20),
	deptStartDay date,
	deptEndDay date,
	deptlevel varchar2(5),
	deptstep varchar2(5),
	deptuppercode varchar2(15),
	job_category varchar2(15),
	mgr_id varchar2(15),
	deptaddr varchar2(100),
	depttel varchar2(15)
);
#인사 테이블
drop table member CASCADE CONSTRAINTS;
create table member(
	id varchar2(20) primary key,
	pass varchar2(20),
	name varchar2(15),
	ssn varchar2(30),
	birthday date,
	marry char(1),
	gender char(1),
	position varchar2(15),
	duty varchar2(15),
	classes varchar2(15),
	startday date,
	endday date,
	deptno varchar2(15),
	curstate varchar2(10),
	zipcode varchar2(10),
	addr varchar2(80),
	detailaddr varchar2(50),
	phonehome varchar2(15),
	phoneco varchar2(15),
	phonecell varchar2(15),
	email varchar2(50),
	profile_photo varchar2(50));
	


#업무테이블
drop table job CASCADE CONSTRAINTS;
create table job(
	job_id varchar2(10) primary key,
	job_name varchar2(15),
	job_category varchar2(15),
	menupath varchar2(50));

#게시판테이블	
drop table board CASCADE CONSTRAINTS;
create table tbboard(
	board_no varchar2(10) primary key,
	id varchar2(15),
	write_date date,
	title varchar2(50),
	content  varchar2(50),
	category  varchar2(20));

#게시판에 업로드 되는 파일의 정보를 저장하기 위한 테이블
create table board_file(
	board_no varchar2(12),
	originalFilename varchar2(30),
	storeFilename varchar2(30)	
);

#시퀀스
create sequence tbboard_seq;

#제약조건
alter table member
add constraint member_fk foreign key(deptno) references dept(deptno);

alter table dept
add constraint job_fk foreign key(job_category) references job(job_category);

#데이터
insert into job values('j001','영업','영업관리','/menu/sales_menu.jsp');
insert into job values('j002','인사','인사관리','/menu/insa_menu.jsp');
insert into job values('j003','전산','전산관리','/menu/it_menu.jsp');
insert into job values('j004','경영지원','경영관리','/menu/manage_menu.jsp');
insert into job values('j005','재무','재무관리','/menu/jaemu_menu.jsp');

insert into dept values('d001','인사팀','1999/9/27',null,'2','1','dg001','j002','9401023jang','서울시 서초구 multicampus빌딩7층','02-225-1111');
insert into dept values('d002','재무팀','1999/9/27',null,'2','1','dg001','j005','9401023jang','서울시 서초구 multicampus빌딩7층','02-225-1122');
insert into dept values('d003','개발팀','1999/9/27',null,'2','1','dg003','j003','9401023jang','서울시 서초구 multicampus빌딩6층','02-225-1133');
insert into dept values('d0031','디자인팀','1999/9/27',null,'3','1','d003','j003','9401023jang','서울시 서초구 multicampus빌딩6층','02-225-1121');
insert into dept values('d0032','Ajax팀','1999/9/27',null,'3','2','d003','j003','9401023jang','서울시 서초구 multicampus빌딩1층','02-225-1131');
insert into dept values('d004','개발지원','1999/9/27',null,'2','1','dg001','j003','9401023jang','서울시 서초구 multicampus빌딩1층','02-225-1144');
insert into dept values('d005','시스템지원팀','1999/9/27',null,'2','1','dg001','j003','9401023jang','서울시 서초구 multicampus빌딩2층','02-225-1155');
insert into dept values('d006','총무과','1999/9/27',null,'2','1','dg001','j004','9401023jang','서울시 서초구 multicampus빌딩3층','02-225-1166');
insert into dept values('dg001','경영지원본부','1999/9/27',null,'1','1',null,'j004','9401023jang','서울시 서초구 multicampus빌딩4층','02-225-1177');
insert into dept values('dg002','영업본부','1999/9/27',null,'1','1',null,'j001','9401023jang','서울시 서초구 multicampus빌딩5층','02-225-1188');
insert into dept values('dg003','IT지원센터','1999/9/27',null,'1','1',null,'j003','9401023jang','서울시 서초구 multicampus빌딩6층','02-225-1199');
insert into dept values('d007','교육부','1999/9/27',null,'2','1','dg001','j004','9401023jang','서울시 서초구 multicampus빌딩6층','02-225-1100');
insert into dept values('d008','기획실','1999/9/27',null,'2','1','dg001','j004','9401023jang','서울시 서초구 multicampus빌딩5층','02-225-1102');
insert into dept values('d009','영업1팀','1999/9/27',null,'2','1','dg001','j001','9401023jang','서울시 서초구 multicampus빌딩8층','02-225-1222');
insert into dept values('d010','기업영업본부','1999/9/27',null,'2','1','dg001','j001','9401023jang','서울시 서초구 multicampus빌딩9층','02-225-13331');
insert into dept values('d011','영업2팀','1999/9/27',null,'2','1','dg001','j001','9401023jang','서울시 서초구 multicampus빌딩10층','02-225-1444');
insert into dept values('d012','마케팅실','1999/9/27',null,'2','1','dg001','j004','9401023jang','서울시 서초구 multicampus빌딩10층','02-225-1555');

insert into member values('9401023jang','1234','장동건','731111-1111111','1973/11/11','1','0','부장','팀장','3급20호봉','1999/10/01',null,'d001','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-2222','jang@naver.com','jang.jpg');
insert into member values('0111022kim','1234','김범룡','800521-1111111','1980/09/01','1','0','과장','팀장','4급20호봉','2007/02/27',null,'d002','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-3333','kbr@naver.com','kbr.jpg');
insert into member values('92115kim','1234','김서연','901012-1111111','1990/11/11','1','1','과장','팀장','4급20호봉','2010/10/01',null,'d003','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','kim.jpg');




insert into member values('881011kim','1234','김동현','721012-1111111','1990/11/11','1','1','과장','팀장','4급20호봉','2010/10/01',null,'d006','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','kimdong.jpg');
insert into member values('787871lee','1234','이민호','721012-1111111','1990/11/11','1','1','대리','사원','4급20호봉','2010/10/01',null,'dg001','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','leemin.jpg');
insert into member values('17171park','1234','박문수','721012-1111111','1990/11/11','1','1','대리','사원','4급20호봉','2010/10/01',null,'d0032','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','park.jpg');
insert into member values('9871kim','1234','김어준','721012-1111111','1990/11/11','1','1','과장','팀장','4급20호봉','2010/10/01',null,'d009','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','jjangkim.jpg');
insert into member values('lee0idjj','1234','안정환','721012-1111111','1990/11/11','1','1','차장','팀장','4급20호봉','2010/10/01',null,'dg002','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','ansoccer.jpg');
insert into member values('djdiwjs','1234','차범근','721012-1111111','1990/11/11','1','1','사원','사원','4급20호봉','2010/10/01',null,'dg003','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','chasoccer.jpg');
insert into member values('282djdid','1234','박지성','721012-1111111','1990/11/11','1','1','대리','파트장','4급20호봉','2010/10/01',null,'d001','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','parksoccer.jpg');
insert into member values('Yeona1231','1234','김연아','721012-1111111','1990/11/11','1','1','대리','파트장','4급20호봉','2010/10/01',null,'d003','재직','222-222','서울시 봉천구','좋은동네','02-858-1111','02-858-1111','010-111-4444','jang@naver.com','parksoccer.jpg');

insert into tbboard values(tbboard_seq.nextval,'881011kim','설정파일이 너무 많아요','spring,mybatis,tiles너무 많아요',sysdate,'게시판');
insert into tbboard values(tbboard_seq.nextval,'881011kim','설정파일이 너무 많아요','spring,mybatis,tiles너무 많아요',sysdate,'게시판');
insert into tbboard values(tbboard_seq.nextval,'881011kim','설정파일이 너무 많아요','spring,mybatis,tiles너무 많아요',sysdate,'게시판');

commit;
