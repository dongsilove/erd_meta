
/* Drop Tables */

DROP TABLE IF EXISTS T_AU_USER;
DROP TABLE IF EXISTS T_AU_DEPT;
DROP TABLE IF EXISTS T_CM_CODE;
DROP TABLE IF EXISTS T_CM_CD_GRP;
DROP TABLE IF EXISTS T_WD_APLY;
DROP TABLE IF EXISTS T_WD_TERM;
DROP TABLE IF EXISTS T_WD_DOMAIN;
DROP TABLE IF EXISTS T_WD_GOVWORD;
DROP TABLE IF EXISTS T_WD_WORD;




/* Create Tables */

-- 부서
CREATE TABLE T_AU_DEPT
(
	-- 부서 코드
	DEPT_CD varchar(5) NOT NULL,
	-- 부서 명
	DEPT_NM varchar(200) NOT NULL,
	-- 상위 부서 코드
	UPPER_DEPT_CD varchar(5) NOT NULL,
	CONSTRAINT PK_T_AU_DEPT PRIMARY KEY (DEPT_CD)
) WITHOUT OIDS;


-- 사용자
CREATE TABLE T_AU_USER
(
	-- 사용자 아이디
	USER_ID varchar(50) NOT NULL,
	-- 사용자 명
	USER_NM varchar(200) NOT NULL,
	-- 직급 코드
	CLSF_CD varchar(5),
	-- 입사 일자
	ECNY_YMD char(8),
	-- 부서 코드
	DEPT_CD varchar(5) NOT NULL,
	CONSTRAINT PK_T_AU_USER PRIMARY KEY (USER_ID)
) WITHOUT OIDS;


-- 코드 그룹
CREATE TABLE T_CM_CD_GRP
(
	-- 그룹 코드
	GRP_CD varchar(5) NOT NULL,
	-- 그릅 코드 명
	GRP_CD_NM varchar(200) NOT NULL,
	-- 테이블 명
	TABLE_NM varchar(200),
	-- 컬럼 명
	COLUMN_NM varchar(200),
	CONSTRAINT PK_T_CM_CD_GRP PRIMARY KEY (GRP_CD)
) WITHOUT OIDS;


-- 코드
CREATE TABLE T_CM_CODE
(
	-- 그룹 코드
	GRP_CD varchar(5) NOT NULL,
	-- 코드
	CD varchar(5) NOT NULL,
	-- 코드 명
	CD_NM varchar(200) NOT NULL,
	CONSTRAINT PK_T_CM_CODE PRIMARY KEY (GRP_CD, CD)
) WITHOUT OIDS;


-- 신청
CREATE TABLE T_WD_APLY
(
	-- 신청 일련번호
	APLY_SN serial NOT NULL,
	-- 신청 종류
	APLY_KND varchar(5),
	-- 용어 일련번호
	TERM_SN int UNIQUE,
	-- 도메인 일련번호
	DOMAIN_SN int UNIQUE,
	-- 단어 일련번호
	WORD_SN int UNIQUE,
	-- 등록 아이디
	REGIST_ID varchar(50),
	-- 등록 일시
	REGIST_DT date,
	-- 승인 상태
	CONFM_STTUS varchar(5) NOT NULL,
	-- 승인 아이디
	CONFM_ID varchar(50),
	-- 승인 일시
	CONFM_DT date,
	CONSTRAINT PK_T_WD_APLY PRIMARY KEY (APLY_SN)
) WITHOUT OIDS;


-- 도메인
CREATE TABLE T_WD_DOMAIN
(
	-- 도메인 일련번호
	DOMAIN_SN serial NOT NULL UNIQUE,
	-- 도메인 분류
	DOMAIN_CL varchar(5),
	-- 도메인 표현 명
	DOMAIN_EXPRSN_NM varchar(200),
	-- 도메인 명
	DOMAIN_NM varchar(200) NOT NULL,
	-- 도메인 영문 약어
	DOMAIN_EN_ABBR varchar(100) NOT NULL,
	-- 도메인 영문 명
	DOMAIN_EN_NM varchar(200) NOT NULL,
	-- 도메인 설명
	DOMAIN_DC varchar(2000),
	-- 데이터 타입
	DATA_TYPE varchar(100),
	-- 데이터 길이
	DATA_LT numeric,
	-- 소수점 길이
	DCMLPOINT_LT numeric,
	-- 표현 형식
	EXPRSN_FOM varchar(100),
	-- 단위
	UNIT varchar(50),
	-- 허용 값 설명
	PERM_VAL_DC varchar(2000),
	-- 등록 아이디
	REGIST_ID varchar(50),
	-- 등록 일시
	REGIST_DT date,
	-- 수정 아이디
	MODIFY_ID varchar(50),
	-- 수정 일시
	MODIFY_DT date,
	CONSTRAINT PK_T_WD_DOMAIN PRIMARY KEY (DOMAIN_SN)
) WITHOUT OIDS;


-- 정부단어
CREATE TABLE T_WD_GOVWORD
(
	-- 단어 일련번호
	WORD_SN serial NOT NULL UNIQUE,
	-- 단어 명
	WORD_NM varchar(200) NOT NULL UNIQUE,
	-- 단어 영문 약어
	WORD_EN_ABBR varchar(100) NOT NULL,
	-- 단어 영문 명
	WORD_EN_NM varchar(200) NOT NULL,
	-- 단어 설명
	WORD_DC varchar(2000),
	-- 등록 아이디
	REGIST_ID varchar(50),
	-- 등록 일자
	REGIST_YMD date,
	-- 수정 아이디
	MODIFY_ID varchar(50),
	-- 수정 일자
	MODIFY_YMD date,
	-- 단어 구분
	WORD_SE varchar(5),
	-- 주제 구분
	THEMA_SE varchar(5),
	-- 상태 구분
	STTUS_SE varchar(5),
	CONSTRAINT PK_T_WD_GOVWORD PRIMARY KEY (WORD_SN)
) WITHOUT OIDS;


-- 용어
CREATE TABLE T_WD_TERM
(
	-- 용어 일련번호
	TERM_SN serial NOT NULL UNIQUE,
	-- 용어 명
	TERM_NM varchar(200) NOT NULL UNIQUE,
	-- 용어 영문 약어
	TERM_EN_ABBR varchar(100) NOT NULL,
	-- 용어 영어 명
	TERM_EN_NM varchar(200),
	-- 용어 설명
	TERM_DC varchar(2000),
	-- 데이터 형식
	DATA_FOM varchar(100),
	-- 도메인 일련번호
	DOMAIN_SN int,
	-- 주제 구분
	THEMA_SE varchar(5),
	-- 등록 아이디
	REGIST_ID varchar(50),
	-- 등록 일시
	REGIST_DT date,
	-- 수정 아이디
	MODIFY_ID varchar(50),
	-- 수정 일시
	MODIFY_DT date,
	CONSTRAINT PK_T_WD_TERM PRIMARY KEY (TERM_SN)
) WITHOUT OIDS;


-- 단어
CREATE TABLE T_WD_WORD
(
	-- 단어 일련번호
	WORD_SN serial NOT NULL UNIQUE,
	-- 단어 명
	WORD_NM varchar(200) NOT NULL UNIQUE,
	-- 단어 영문 약어
	WORD_EN_ABBR varchar(100) NOT NULL,
	-- 단어 영문 명
	WORD_EN_NM varchar(200) NOT NULL,
	-- 단어 설명
	WORD_DC varchar(2000),
	-- 동의어
	SYNONM varchar(200),
	-- 금지 단어
	PRHIBT_WORD varchar(200),
	-- 주제 구분
	THEMA_SE varchar(5),
	-- 등록 아이디
	REGIST_ID varchar(50),
	-- 등록 일시
	REGIST_DT date,
	-- 수정 아이디
	MODIFY_ID varchar(50),
	-- 수정 일시
	MODIFY_DT date,
	CONSTRAINT PK_T_WD_WORD PRIMARY KEY (WORD_SN)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE T_AU_DEPT
	ADD FOREIGN KEY (UPPER_DEPT_CD)
	REFERENCES T_AU_DEPT (DEPT_CD)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_AU_USER
	ADD CONSTRAINT FK_AU_USER_DEPT_CD FOREIGN KEY (DEPT_CD)
	REFERENCES T_AU_DEPT (DEPT_CD)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_CM_CODE
	ADD CONSTRAINT FK_CM_CODE_GRP_CD FOREIGN KEY (GRP_CD)
	REFERENCES T_CM_CD_GRP (GRP_CD)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_WD_APLY
	ADD FOREIGN KEY (DOMAIN_SN)
	REFERENCES T_WD_DOMAIN (DOMAIN_SN)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_WD_TERM
	ADD FOREIGN KEY (DOMAIN_SN)
	REFERENCES T_WD_DOMAIN (DOMAIN_SN)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_WD_APLY
	ADD FOREIGN KEY (TERM_SN)
	REFERENCES T_WD_TERM (TERM_SN)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_WD_APLY
	ADD FOREIGN KEY (WORD_SN)
	REFERENCES T_WD_WORD (WORD_SN)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Comments */

COMMENT ON TABLE T_AU_DEPT IS '부서';
COMMENT ON COLUMN T_AU_DEPT.DEPT_CD IS '부서 코드';
COMMENT ON COLUMN T_AU_DEPT.DEPT_NM IS '부서 명';
COMMENT ON COLUMN T_AU_DEPT.UPPER_DEPT_CD IS '상위 부서 코드';
COMMENT ON TABLE T_AU_USER IS '사용자';
COMMENT ON COLUMN T_AU_USER.USER_ID IS '사용자 아이디';
COMMENT ON COLUMN T_AU_USER.USER_NM IS '사용자 명';
COMMENT ON COLUMN T_AU_USER.CLSF_CD IS '직급 코드';
COMMENT ON COLUMN T_AU_USER.ECNY_YMD IS '입사 일자';
COMMENT ON COLUMN T_AU_USER.DEPT_CD IS '부서 코드';
COMMENT ON TABLE T_CM_CD_GRP IS '코드 그룹';
COMMENT ON COLUMN T_CM_CD_GRP.GRP_CD IS '그룹 코드';
COMMENT ON COLUMN T_CM_CD_GRP.GRP_CD_NM IS '그릅 코드 명';
COMMENT ON COLUMN T_CM_CD_GRP.TABLE_NM IS '테이블 명';
COMMENT ON COLUMN T_CM_CD_GRP.COLUMN_NM IS '컬럼 명';
COMMENT ON TABLE T_CM_CODE IS '코드';
COMMENT ON COLUMN T_CM_CODE.GRP_CD IS '그룹 코드';
COMMENT ON COLUMN T_CM_CODE.CD IS '코드';
COMMENT ON COLUMN T_CM_CODE.CD_NM IS '코드 명';
COMMENT ON TABLE T_WD_APLY IS '신청';
COMMENT ON COLUMN T_WD_APLY.APLY_SN IS '신청 일련번호';
COMMENT ON COLUMN T_WD_APLY.APLY_KND IS '신청 종류';
COMMENT ON COLUMN T_WD_APLY.TERM_SN IS '용어 일련번호';
COMMENT ON COLUMN T_WD_APLY.DOMAIN_SN IS '도메인 일련번호';
COMMENT ON COLUMN T_WD_APLY.WORD_SN IS '단어 일련번호';
COMMENT ON COLUMN T_WD_APLY.REGIST_ID IS '등록 아이디';
COMMENT ON COLUMN T_WD_APLY.REGIST_DT IS '등록 일시';
COMMENT ON COLUMN T_WD_APLY.CONFM_STTUS IS '승인 상태';
COMMENT ON COLUMN T_WD_APLY.CONFM_ID IS '승인 아이디';
COMMENT ON COLUMN T_WD_APLY.CONFM_DT IS '승인 일시';
COMMENT ON TABLE T_WD_DOMAIN IS '도메인';
COMMENT ON COLUMN T_WD_DOMAIN.DOMAIN_SN IS '도메인 일련번호';
COMMENT ON COLUMN T_WD_DOMAIN.DOMAIN_CL IS '도메인 분류';
COMMENT ON COLUMN T_WD_DOMAIN.DOMAIN_EXPRSN_NM IS '도메인 표현 명';
COMMENT ON COLUMN T_WD_DOMAIN.DOMAIN_NM IS '도메인 명';
COMMENT ON COLUMN T_WD_DOMAIN.DOMAIN_EN_ABBR IS '도메인 영문 약어';
COMMENT ON COLUMN T_WD_DOMAIN.DOMAIN_EN_NM IS '도메인 영문 명';
COMMENT ON COLUMN T_WD_DOMAIN.DOMAIN_DC IS '도메인 설명';
COMMENT ON COLUMN T_WD_DOMAIN.DATA_TYPE IS '데이터 타입';
COMMENT ON COLUMN T_WD_DOMAIN.DATA_LT IS '데이터 길이';
COMMENT ON COLUMN T_WD_DOMAIN.DCMLPOINT_LT IS '소수점 길이';
COMMENT ON COLUMN T_WD_DOMAIN.EXPRSN_FOM IS '표현 형식';
COMMENT ON COLUMN T_WD_DOMAIN.UNIT IS '단위';
COMMENT ON COLUMN T_WD_DOMAIN.PERM_VAL_DC IS '허용 값 설명';
COMMENT ON COLUMN T_WD_DOMAIN.REGIST_ID IS '등록 아이디';
COMMENT ON COLUMN T_WD_DOMAIN.REGIST_DT IS '등록 일시';
COMMENT ON COLUMN T_WD_DOMAIN.MODIFY_ID IS '수정 아이디';
COMMENT ON COLUMN T_WD_DOMAIN.MODIFY_DT IS '수정 일시';
COMMENT ON TABLE T_WD_GOVWORD IS '정부단어';
COMMENT ON COLUMN T_WD_GOVWORD.WORD_SN IS '단어 일련번호';
COMMENT ON COLUMN T_WD_GOVWORD.WORD_NM IS '단어 명';
COMMENT ON COLUMN T_WD_GOVWORD.WORD_EN_ABBR IS '단어 영문 약어';
COMMENT ON COLUMN T_WD_GOVWORD.WORD_EN_NM IS '단어 영문 명';
COMMENT ON COLUMN T_WD_GOVWORD.WORD_DC IS '단어 설명';
COMMENT ON COLUMN T_WD_GOVWORD.REGIST_ID IS '등록 아이디';
COMMENT ON COLUMN T_WD_GOVWORD.REGIST_YMD IS '등록 일자';
COMMENT ON COLUMN T_WD_GOVWORD.MODIFY_ID IS '수정 아이디';
COMMENT ON COLUMN T_WD_GOVWORD.MODIFY_YMD IS '수정 일자';
COMMENT ON COLUMN T_WD_GOVWORD.WORD_SE IS '단어 구분';
COMMENT ON COLUMN T_WD_GOVWORD.THEMA_SE IS '주제 구분';
COMMENT ON COLUMN T_WD_GOVWORD.STTUS_SE IS '상태 구분';
COMMENT ON TABLE T_WD_TERM IS '용어';
COMMENT ON COLUMN T_WD_TERM.TERM_SN IS '용어 일련번호';
COMMENT ON COLUMN T_WD_TERM.TERM_NM IS '용어 명';
COMMENT ON COLUMN T_WD_TERM.TERM_EN_ABBR IS '용어 영문 약어';
COMMENT ON COLUMN T_WD_TERM.TERM_EN_NM IS '용어 영어 명';
COMMENT ON COLUMN T_WD_TERM.TERM_DC IS '용어 설명';
COMMENT ON COLUMN T_WD_TERM.DATA_FOM IS '데이터 형식';
COMMENT ON COLUMN T_WD_TERM.DOMAIN_SN IS '도메인 일련번호';
COMMENT ON COLUMN T_WD_TERM.THEMA_SE IS '주제 구분';
COMMENT ON COLUMN T_WD_TERM.REGIST_ID IS '등록 아이디';
COMMENT ON COLUMN T_WD_TERM.REGIST_DT IS '등록 일시';
COMMENT ON COLUMN T_WD_TERM.MODIFY_ID IS '수정 아이디';
COMMENT ON COLUMN T_WD_TERM.MODIFY_DT IS '수정 일시';
COMMENT ON TABLE T_WD_WORD IS '단어';
COMMENT ON COLUMN T_WD_WORD.WORD_SN IS '단어 일련번호';
COMMENT ON COLUMN T_WD_WORD.WORD_NM IS '단어 명';
COMMENT ON COLUMN T_WD_WORD.WORD_EN_ABBR IS '단어 영문 약어';
COMMENT ON COLUMN T_WD_WORD.WORD_EN_NM IS '단어 영문 명';
COMMENT ON COLUMN T_WD_WORD.WORD_DC IS '단어 설명';
COMMENT ON COLUMN T_WD_WORD.SYNONM IS '동의어';
COMMENT ON COLUMN T_WD_WORD.PRHIBT_WORD IS '금지 단어';
COMMENT ON COLUMN T_WD_WORD.THEMA_SE IS '주제 구분';
COMMENT ON COLUMN T_WD_WORD.REGIST_ID IS '등록 아이디';
COMMENT ON COLUMN T_WD_WORD.REGIST_DT IS '등록 일시';
COMMENT ON COLUMN T_WD_WORD.MODIFY_ID IS '수정 아이디';
COMMENT ON COLUMN T_WD_WORD.MODIFY_DT IS '수정 일시';



