
/* Drop Tables */

DROP TABLE IF EXISTS t_am_asst_atrb_default;
DROP TABLE IF EXISTS t_am_asst_atrb_val;
DROP TABLE IF EXISTS t_am_asst_atrb;
DROP TABLE IF EXISTS t_au_dept;
DROP TABLE IF EXISTS T_CM_CODE;
DROP TABLE IF EXISTS T_CM_CD_GRP;
DROP TABLE IF EXISTS t_cm_menu;
DROP TABLE IF EXISTS public.t_am_asst;




/* Create Tables */

-- 자산속성
CREATE TABLE t_am_asst_atrb
(
	-- 속성아이디
	atrb_id varchar(50) NOT NULL UNIQUE,
	-- 속성명
	atrb_nm varchar(200) NOT NULL,
	-- 속성설명
	atrb_dc varchar(2000),
	-- 등록 일시
	regist_dt date,
	-- 등록 아이디
	regist_id varchar(50),
	-- 수정 일시
	modify_dt date,
	-- 수정 아이디
	modify_id varchar(50),
	-- 사용여부
	use_yn char,
	CONSTRAINT PK_T_AM_ASST_ATRB PRIMARY KEY (atrb_id)
) WITHOUT OIDS;


-- 자산속성기본설정
CREATE TABLE t_am_asst_atrb_default
(
	-- 분류코드
	cl_cd varchar(5) NOT NULL,
	-- 속성아이디
	atrb_id varchar(50) NOT NULL UNIQUE,
	PRIMARY KEY (cl_cd, atrb_id)
) WITHOUT OIDS;


-- 자산속성값
CREATE TABLE t_am_asst_atrb_val
(
	-- 자산일련번호
	asst_sn int NOT NULL,
	-- 속성아이디
	atrb_id varchar(50) NOT NULL UNIQUE,
	-- 속성내용
	atrb_cn varchar(1000),
	PRIMARY KEY (asst_sn, atrb_id)
) WITHOUT OIDS;


-- 부서
CREATE TABLE t_au_dept
(
	-- 부서코드
	dept_cd varchar(5) NOT NULL,
	-- 부서명
	dept_nm varchar(200),
	-- 상위부서코드
	upper_dept_cd varchar(5),
	-- 권한내용
	author_cn varchar(1000),
	PRIMARY KEY (dept_cd)
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


-- 메뉴
CREATE TABLE t_cm_menu
(
	-- 메뉴아이디
	menu_id varchar(50) NOT NULL,
	-- 메뉴명
	menu_nm varchar(200),
	-- 상위메뉴아이디
	upper_menu_id varchar(50),
	PRIMARY KEY (menu_id)
) WITHOUT OIDS;


-- 자산
CREATE TABLE public.t_am_asst
(
	-- 자산일련번호
	asst_sn int NOT NULL,
	-- 자산구분
	asst_se varchar(50),
	-- 공급계통코드
	splsys_cd varchar(5),
	-- 공급계통소재지명
	splsys_locplc_nm varchar(200),
	-- 공정코드
	prc_cd varchar(5),
	-- 공종코드
	worktype_cd varchar(5),
	-- 대분류명
	lclas_nm varchar(200),
	-- 중분류명
	mclas_nm varchar(200),
	-- 소분류명
	sclas_nm varchar(200),
	-- 자산명
	asst_nm varchar(200) NOT NULL,
	-- 소재지명(설치위치)
	locplc_nm varchar(200),
	-- 소속명
	psitn_nm varchar(200),
	-- 사용여부
	use_yn char,
	-- 최초취득일
	frst_acqs_ymd char(10),
	-- 최초취득가
	frst_acqs_pc numeric,
	-- 재평가일
	reval_ymd char(10),
	-- 재평가액
	reval_am numeric,
	-- 현재취득가
	now_acqs_pc numeric,
	-- 현재내용년수
	now_uslfsvc_co numeric,
	-- 현재충당금계
	now_rsvmney_sm numeric,
	-- 현재장부액
	now_acntbk_am numeric,
	-- 연상각액
	yr_dprt_am numeric,
	-- 수량
	co numeric,
	-- 형식명
	fom_nm varchar(200),
	-- 규격명(동력)
	stndrd_nm varchar(200),
	-- 설치일
	install_ymd char(10),
	-- 모델명
	model_nm varchar(200),
	-- 모델번호
	model_nov varchar(20),
	-- 구조명
	struct_nm varchar(200),
	-- 재질명
	mtrqlt_nm varchar(200),
	-- 제조사명
	makr_nm varchar(200),
	-- 자산확인여부
	asst_cnfirm_yn char(1),
	-- 비고
	rm varchar(200),
	-- 색인구분
	index_se varchar(50),
	-- 등록 아이디
	regist_id varchar(50),
	-- 등록 일시
	regist_dt date,
	-- 수정 아이디
	modify_id varchar(50),
	-- 수정 일시
	modify_dt date,
	CONSTRAINT pk_t_am_asst_fclty PRIMARY KEY (asst_sn)
) WITHOUT OIDS;



/* Create Foreign Keys */

ALTER TABLE t_am_asst_atrb_default
	ADD FOREIGN KEY (atrb_id)
	REFERENCES t_am_asst_atrb (atrb_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_am_asst_atrb_val
	ADD FOREIGN KEY (atrb_id)
	REFERENCES t_am_asst_atrb (atrb_id)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE T_CM_CODE
	ADD CONSTRAINT FK_CM_CODE_GRP_CD FOREIGN KEY (GRP_CD)
	REFERENCES T_CM_CD_GRP (GRP_CD)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;


ALTER TABLE t_am_asst_atrb_val
	ADD FOREIGN KEY (asst_sn)
	REFERENCES public.t_am_asst (asst_sn)
	ON UPDATE RESTRICT
	ON DELETE RESTRICT
;



/* Comments */

COMMENT ON TABLE t_am_asst_atrb IS '자산속성';
COMMENT ON COLUMN t_am_asst_atrb.atrb_id IS '속성아이디';
COMMENT ON COLUMN t_am_asst_atrb.atrb_nm IS '속성명';
COMMENT ON COLUMN t_am_asst_atrb.atrb_dc IS '속성설명';
COMMENT ON COLUMN t_am_asst_atrb.regist_dt IS '등록 일시';
COMMENT ON COLUMN t_am_asst_atrb.regist_id IS '등록 아이디';
COMMENT ON COLUMN t_am_asst_atrb.modify_dt IS '수정 일시';
COMMENT ON COLUMN t_am_asst_atrb.modify_id IS '수정 아이디';
COMMENT ON COLUMN t_am_asst_atrb.use_yn IS '사용여부';
COMMENT ON TABLE t_am_asst_atrb_default IS '자산속성기본설정';
COMMENT ON COLUMN t_am_asst_atrb_default.cl_cd IS '분류코드';
COMMENT ON COLUMN t_am_asst_atrb_default.atrb_id IS '속성아이디';
COMMENT ON TABLE t_am_asst_atrb_val IS '자산속성값';
COMMENT ON COLUMN t_am_asst_atrb_val.asst_sn IS '자산일련번호';
COMMENT ON COLUMN t_am_asst_atrb_val.atrb_id IS '속성아이디';
COMMENT ON COLUMN t_am_asst_atrb_val.atrb_cn IS '속성내용';
COMMENT ON TABLE t_au_dept IS '부서';
COMMENT ON COLUMN t_au_dept.dept_cd IS '부서코드';
COMMENT ON COLUMN t_au_dept.dept_nm IS '부서명';
COMMENT ON COLUMN t_au_dept.upper_dept_cd IS '상위부서코드';
COMMENT ON COLUMN t_au_dept.author_cn IS '권한내용';
COMMENT ON TABLE T_CM_CD_GRP IS '코드 그룹';
COMMENT ON COLUMN T_CM_CD_GRP.GRP_CD IS '그룹 코드';
COMMENT ON COLUMN T_CM_CD_GRP.GRP_CD_NM IS '그릅 코드 명';
COMMENT ON COLUMN T_CM_CD_GRP.TABLE_NM IS '테이블 명';
COMMENT ON COLUMN T_CM_CD_GRP.COLUMN_NM IS '컬럼 명';
COMMENT ON TABLE T_CM_CODE IS '코드';
COMMENT ON COLUMN T_CM_CODE.GRP_CD IS '그룹 코드';
COMMENT ON COLUMN T_CM_CODE.CD IS '코드';
COMMENT ON COLUMN T_CM_CODE.CD_NM IS '코드 명';
COMMENT ON TABLE t_cm_menu IS '메뉴';
COMMENT ON COLUMN t_cm_menu.menu_id IS '메뉴아이디';
COMMENT ON COLUMN t_cm_menu.menu_nm IS '메뉴명';
COMMENT ON COLUMN t_cm_menu.upper_menu_id IS '상위메뉴아이디';
COMMENT ON TABLE public.t_am_asst IS '자산';
COMMENT ON COLUMN public.t_am_asst.asst_sn IS '자산일련번호';
COMMENT ON COLUMN public.t_am_asst.asst_se IS '자산구분';
COMMENT ON COLUMN public.t_am_asst.splsys_cd IS '공급계통코드';
COMMENT ON COLUMN public.t_am_asst.splsys_locplc_nm IS '공급계통소재지명';
COMMENT ON COLUMN public.t_am_asst.prc_cd IS '공정코드';
COMMENT ON COLUMN public.t_am_asst.worktype_cd IS '공종코드';
COMMENT ON COLUMN public.t_am_asst.lclas_nm IS '대분류명';
COMMENT ON COLUMN public.t_am_asst.mclas_nm IS '중분류명';
COMMENT ON COLUMN public.t_am_asst.sclas_nm IS '소분류명';
COMMENT ON COLUMN public.t_am_asst.asst_nm IS '자산명';
COMMENT ON COLUMN public.t_am_asst.locplc_nm IS '소재지명(설치위치)';
COMMENT ON COLUMN public.t_am_asst.psitn_nm IS '소속명';
COMMENT ON COLUMN public.t_am_asst.use_yn IS '사용여부';
COMMENT ON COLUMN public.t_am_asst.frst_acqs_ymd IS '최초취득일';
COMMENT ON COLUMN public.t_am_asst.frst_acqs_pc IS '최초취득가';
COMMENT ON COLUMN public.t_am_asst.reval_ymd IS '재평가일';
COMMENT ON COLUMN public.t_am_asst.reval_am IS '재평가액';
COMMENT ON COLUMN public.t_am_asst.now_acqs_pc IS '현재취득가';
COMMENT ON COLUMN public.t_am_asst.now_uslfsvc_co IS '현재내용년수';
COMMENT ON COLUMN public.t_am_asst.now_rsvmney_sm IS '현재충당금계';
COMMENT ON COLUMN public.t_am_asst.now_acntbk_am IS '현재장부액';
COMMENT ON COLUMN public.t_am_asst.yr_dprt_am IS '연상각액';
COMMENT ON COLUMN public.t_am_asst.co IS '수량';
COMMENT ON COLUMN public.t_am_asst.fom_nm IS '형식명';
COMMENT ON COLUMN public.t_am_asst.stndrd_nm IS '규격명(동력)';
COMMENT ON COLUMN public.t_am_asst.install_ymd IS '설치일';
COMMENT ON COLUMN public.t_am_asst.model_nm IS '모델명';
COMMENT ON COLUMN public.t_am_asst.model_nov IS '모델번호';
COMMENT ON COLUMN public.t_am_asst.struct_nm IS '구조명';
COMMENT ON COLUMN public.t_am_asst.mtrqlt_nm IS '재질명';
COMMENT ON COLUMN public.t_am_asst.makr_nm IS '제조사명';
COMMENT ON COLUMN public.t_am_asst.asst_cnfirm_yn IS '자산확인여부';
COMMENT ON COLUMN public.t_am_asst.rm IS '비고';
COMMENT ON COLUMN public.t_am_asst.index_se IS '색인구분';
COMMENT ON COLUMN public.t_am_asst.regist_id IS '등록 아이디';
COMMENT ON COLUMN public.t_am_asst.regist_dt IS '등록 일시';
COMMENT ON COLUMN public.t_am_asst.modify_id IS '수정 아이디';
COMMENT ON COLUMN public.t_am_asst.modify_dt IS '수정 일시';



