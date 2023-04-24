-- 테이블(entity) 생성
-- 성적 정보 저장 테이블

CREATE TABLE tbl_score (
	name VARCHAR2(4) NOT NULL,
	kor NUMBER(3) NOT NULL CHECK(kor > 0 AND kor <= 100),
	eng NUMBER(3) NOT NULL CHECK(eng > 0 AND eng <= 100),
	math NUMBER(3) NOT NULL CHECK(math > 0 AND math <= 100),
	total NUMBER(3) NULL,
	average NUMBER(5, 2) NULL,
	grade CHAR(1),
	stu_num NUMBER(6),
	-- PK  거는법
	CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num)
);

-- 테이블 생성 후 PK 적용하기
ALTER TABLE tbl_score
ADD CONSTRAINT pk_stu_num
	PRIMARY KEY (stu_num);


-- 컬럼 추가하기
ALTER TABLE 
	TBL_SCORE 
ADD (sci NUMBER(3) NOT NULL);	


-- 컬럼 제거하기
ALTER TABLE
	TBL_SCORE
DROP COLUMN sci;


-- 테이블 복사 (tb_emp)
-- CTAS
CREATE TABLE
	tb_emp_copy
AS SELECT * FROM tb_emp;

-- 복사 테이블 조회
SELECT * FROM tb_emp_copy;
SELECT * FROM tb_emp;

-- drop table
DROP TABLE tb_emp_copy;


-- truncate table
-- 구조는 냅두고 내부 데이터만 전체 삭제
TRUNCATE TABLE tb_emp_copy;


-- 예시 테이블
CREATE TABLE goods (
	id NUMBER(6) PRIMARY KEY,
	g_name VARCHAR2(10) NOT NULL,
	price NUMBER(10) DEFAULT 1000,
	reg_date DATE
);


SELECT * FROM goods;


-- INSERT 
INSERT INTO goods
	(id, g_name, price, reg_date)
VALUES (1, '선풍기', '120000', SYSDATE);


INSERT INTO goods
	(id, g_name, reg_date)
VALUES (2, '달고나', SYSDATE);


INSERT INTO goods
	(g_name, id, price)
VALUES ('후리', 3, 500);


-- 컬럼명 생략시 모든 컬럼에 대해 순서대로 넣어야 함.
INSERT INTO goods
VALUES (4, '하하', 10000, SYSDATE);


INSERT INTO goods
	(id, g_name, price, reg_date)
VALUES
	(5, '후하', 13515, SYSDATE),
	(6, '후히', 15165, SYSDATE),
	(7, '후헤', 17456, SYSDATE);


INSERT INTO goods
	(id, g_name, price, reg_date)
VALUES (5, '선풍기', '120000', SYSDATE),
	   (6, '선풍기', '120000', SYSDATE),
	   (7, '선풍기', '120000', SYSDATE);
	   
	  
SELECT * FROM goods;
	  
-- 수정 UPDATE 
UPDATE goods
SET g_name = '냉장고'
WHERE id = 3
;


UPDATE tbl_user
SET age = age + 1
;

-- 수정 UPDATE,
-- WHERE 절이 없으면 모든 행이 적용된다.
UPDATE goods
SET price = 9999
;







-- 행을 삭제 DELETE
DELETE FROM goods
WHERE id = 3
;

-- 모든 행 삭제
DELETE FROM goods;




SELECT * FROM goods;


-- SELECT 조회
SELECT
	CERTI_NM 
	, ISSUE_INSTI_NM 
	, CERTI_CD 
FROM TB_CERTI
;



-- 중복 제거 distinct
SELECT DISTINCT
	 ISSUE_INSTI_NM 
FROM TB_CERTI
;

-- 열 별칭 부여 (alias)
SELECT 
	EMP_NM "사원이름"
	,ADDR "사원의 거주지 주소"
FROM TB_EMP
;


-- 문자열 연결하기

SELECT 
	CERTI_NM || '(' || ISSUE_INSTI_NM || ')' "자격증 정보"
FROM TB_CERTI
;