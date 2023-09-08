# practice3
### 수강신청 도우미 사이트






📌사원테이블 생성

    create table tbl_emp_202108(
    
          empno char(4) not null,
          empname varchar2(20),
          tel1 char(03),
          tel2 char(04),
          tel3 char(04),
          deptcode char(02),
          position char(01),
          primary key(empno)
    
    );

📌좌석테이블 생성

    create table tbl_seat_202108(
    
          seatno char(04) not null,
          office varchar2(20),
          callno varchar2(10),
          useflag char(01),
          primary key(seatno)
          
    );

📌예약테이블 생성

    CREATE TABLE tbl_resv_202108(
    
          resvno char(08) not null,
          empno char(04),
          resvdate char(08),
          seatno char(04),
          primary key(resvno)
    
    );

📌사원 데이터 저장

    insert into tbl_emp_202108 values('1001','김사원','010','1234','1111','10','1');
    insert into tbl_emp_202108 values('1002','이사원','010','1234','2222','20','2');
    insert into tbl_emp_202108 values('1003','박사원','010','1234','3333','3','3');
    insert into tbl_emp_202108 values('1004','홍사원','010','1234','4444','10','4');
    insert into tbl_emp_202108 values('1005','조사원','010','1234','5555','20','1');
    insert into tbl_emp_202108 values('1006','정사원','010','1234','6666','30','2');
    insert into tbl_emp_202108 values('1007','황사원','010','1234','7777','10','3');



📌좌석 데이터 저장 

    insert into tbl_seat_202108 values('S001','1층 101호','777-0001','N');
    insert into tbl_seat_202108 values('S002','1층 101호','777-0002','Y');
    insert into tbl_seat_202108 values('S003','1층 101호','777-0003','Y');
    insert into tbl_seat_202108 values('S004','1층 102호','777-0004','Y');
    insert into tbl_seat_202108 values('S005','1층 102호','777-0005','Y');
    insert into tbl_seat_202108 values('S006','1층 102호','777-0006','N');
    insert into tbl_seat_202108 values('S007','1층 103호','777-0007','Y');
    insert into tbl_seat_202108 values('S008','1층 103호','777-0008','Y');
    insert into tbl_seat_202108 values('S009','1층 103호','777-0009','Y');




📌예약 데이터 저장 


    insert into tbl_resv_202108 values('20210001','1001','20211004','S002');
    insert into tbl_resv_202108 values('20210002','1002','20211004','S003');
    insert into tbl_resv_202108 values('20210003','1003','20211004','S004');
    insert into tbl_resv_202108 values('20210004','1004','20211004','S005');
    insert into tbl_resv_202108 values('20210005','1005','20211005','S004');
    insert into tbl_resv_202108 values('20210006','1006','20211005','S005');
    insert into tbl_resv_202108 values('20210007','1007','20211005','S007');
    insert into tbl_resv_202108 values('20210008','1001','20211005','S008');
    insert into tbl_resv_202108 values('20210009','1002','20211006','S002');
    insert into tbl_resv_202108 values('20210010','1003','20211006','S003');

    commit;

📌테이블 조회

    select * from tbl_seat_202108;
    select * from tbl_emp_202108;
    select * from tbl_resv_202108;
    select * from tbl_resv_202108 where empno='1001';

    -- 3개조인
    select e.empno, e.empname, r.resvdate, s.seatno, s.office, s.callno from tbl_emp_202108 e , tbl_seat_202108 s , tbl_resv_202108 r where e.empno = r.empno and s.seatno = r.seatno and e.empno = '1001' order by s.seatno desc; 
    
    select e.empno, e.empname, e.deptcode, count(r.resvdate) from tbl_emp_202108 e, tbl_resv_202108 r where e.empno = r.empno group by e.empno, e.empname, e.deptcode order by e.deptcode;














