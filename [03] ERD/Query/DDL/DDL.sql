SELECT * FROM tabs; -- 테이블 조회
SELECT * FROM USER_SEQUENCES; -- 시퀀스 조회

CREATE TABLE tblMember (
	memberSeq	number		NOT NULL,
	id	varchar2(50)		NOT NULL,
	password	varchar2(50)		NOT NULL,
	name	varchar2(50)		NOT NULL,
	nickname	varchar2(50)		NOT NULL,
	phone	varchar2(50)		NOT NULL,
	birth	varchar2(20)		NOT NULL,
	gender	varchar2(20)		NOT NULL,
	email	varchar2(50)		NOT NULL,
	address	varchar2(100)		NOT NULL,
	point	number	DEFAULT 0	NOT NULL,
	question	varchar2(200)		NOT NULL,
	answer	varchar2(100)		NOT NULL,
	bank	varchar2(50)		NULL,
	accountNum	varchar2(100)		NULL,
	profileImage	varchar2(500)		NULL,
    deleteOk CHAR(1) DEFAULT 'n' NOT NULL
);
ALTER TABLE tblMember ADD CONSTRAINT PK_TBLMEMBER PRIMARY KEY (
	memberSeq
);
CREATE SEQUENCE memberSeq;
--=================================================
CREATE TABLE tblAdmin (
	adminSeq	VARCHAR(255)		NOT NULL,
	id	VARCHAR(255)		NOT NULL,
	password	VARCHAR(255)		NOT NULL,
	bank	VARCHAR(255)		NOT NULL,
	accountNum	VARCHAR(255)		NOT NULL
);
ALTER TABLE tblAdmin ADD CONSTRAINT PK_TBLADMIN PRIMARY KEY (
	adminSeq
);
CREATE SEQUENCE adminSeq;
--=================================================
CREATE TABLE tblCategory (
	categorySeq	NUMBER		NOT NULL,
	name	VARCHAR2(200)		NOT NULL
);
ALTER TABLE tblCategory ADD CONSTRAINT PK_TBLCATEGORY PRIMARY KEY (
	categorySeq
);
CREATE SEQUENCE categorySeq;

--=================================================

CREATE TABLE tblAuction (
	auctionSeq	number		NOT NULL,
	name	varchar2(50)		NOT NULL,
	regdate	date		NOT NULL,
	startPrice	number		NOT NULL,
	unitPrice	number		NOT NULL,
	startTime	date		NOT NULL,
	endTime	date		NOT NULL,
	content	varchar2(4000)		NOT NULL,
	Field2	varchar2(500)		NOT NULL,
	images	varchar2(500)		NULL
);
ALTER TABLE tblAuction ADD CONSTRAINT PK_TBLAUCTION PRIMARY KEY (
	auctionSeq
);
CREATE SEQUENCE auctionSeq;
--=================================================
CREATE TABLE tblProject (
	projectSeq	number		NOT NULL,
	name	varchar2(300)		NOT NULL,
	startDate	date		NOT NULL,
	endDate	date		NOT NULL,
	teamName	varchar2(100)		NULL,
	detail	varchar2(3000)		NOT NULL,
	thumImage	varchar2(500)		NOT NULL,
	target	number		NOT NULL,
	searchTag	varchar2(1000)		NULL,
	status	char(1)	DEFAULT 'n'	NOT NULL,
	content	varchar2(4000) NULL,
	categorySeq	NUMBER		NOT NULL,
	memberSeq	number		NOT NULL,
    deleteOk CHAR(1) DEFAULT 'n' NOT NULL
);
ALTER TABLE tblProject ADD CONSTRAINT PK_TBLPROJECT PRIMARY KEY (
	projectSeq
);

ALTER TABLE tblProject ADD CONSTRAINT FK_Category_TO_Project FOREIGN KEY (
	categorySeq
)
REFERENCES tblCategory (
	categorySeq
);
ALTER TABLE tblProject ADD CONSTRAINT FK_Member_TO_Project FOREIGN KEY (
	memberSeq
)
REFERENCES tblMember (
	memberSeq
);
CREATE SEQUENCE projectSeq;
--=================================================

CREATE TABLE tblContentImage (
    contentImageSeq NUMBER NOT NULL,
    fileName varchar2(3000) not null,
    projectSeq NUMBER not null

);

ALTER TABLE tblContentImage  ADD CONSTRAINT PK_ContentImage  PRIMARY KEY (
	contentImageSeq
);

ALTER TABLE tblContentImage ADD CONSTRAINT FK_Project_TO_ContentImage FOREIGN KEY (
	projectSeq
)
REFERENCES tblProject (
	projectSeq
);

CREATE SEQUENCE contentImageSeq;



--=================================================

CREATE TABLE tblCard (
	cardSeq	number		NOT NULL,
	cardNum	varchar2(50)		NOT NULL,
	validYear	varchar2(10)		NOT NULL,
	validMonth	varchar2(10)		NOT NULL,
	password	varchar2(30)		NOT NULL,
	cvc	varchar2(20)		NOT NULL,
	memberSeq	number		NOT NULL
);
ALTER TABLE tblCard ADD CONSTRAINT PK_TBLCARD PRIMARY KEY (
	cardSeq
);
ALTER TABLE tblCard ADD CONSTRAINT FK_Member_TO_Card FOREIGN KEY (
	memberSeq
)
REFERENCES tblMember (
	memberSeq
);

CREATE SEQUENCE cardSeq;

--=================================================
CREATE TABLE tblNotice (
	noticeSeq	number		NOT NULL,
	subject	varchar2(4000)		NOT NULL,
	content	varchar2(4000)		NOT NULL,
	readCount	number	DEFAULT 0	NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL,
	projectSeq	number		NOT NULL
);
ALTER TABLE tblNotice ADD CONSTRAINT PK_TBLNOTICE PRIMARY KEY (
	noticeSeq
);

ALTER TABLE tblNotice ADD CONSTRAINT FK_Project_TO_Notice FOREIGN KEY (
	projectSeq
)
REFERENCES tblProject (
	projectSeq
);
CREATE SEQUENCE noticeSeq;

--=================================================
CREATE TABLE tblComment (
	commentSeq	number		NOT NULL,
	content	varchar2(4000)		NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL,
	noticeSeq	number		NOT NULL,
	memberSeq	number		NOT NULL
);
ALTER TABLE tblComment ADD CONSTRAINT PK_TBLCOMMENT PRIMARY KEY (
	commentSeq
);

ALTER TABLE tblComment ADD CONSTRAINT FK_Notice_TO_Comment FOREIGN KEY (
	noticeSeq
)
REFERENCES tblNotice (
	noticeSeq
);

ALTER TABLE tblComment ADD CONSTRAINT FK_Member_TO_Comment FOREIGN KEY (
	memberSeq
)
REFERENCES tblMember (
	memberSeq
);

CREATE SEQUENCE commentSeq;
--=================================================

CREATE TABLE tblQA (
	qaSeq	NUMBER		NOT NULL,
	content	VARCHAR2(4000)		NOT NULL,
	sMemberSeq	number		NOT NULL,
	rMemberSeq	number		NOT NULL
);
ALTER TABLE tblQA ADD CONSTRAINT PK_TBLQA PRIMARY KEY (
	qaSeq
);
ALTER TABLE tblQA ADD CONSTRAINT FK_Member_TO_QA FOREIGN KEY (
	sMemberSeq
)
REFERENCES tblMember (
	memberSeq
);

ALTER TABLE tblQA ADD CONSTRAINT FK_Member_TO_QA_2 FOREIGN KEY (
	rMemberSeq
)
REFERENCES tblMember (
	memberSeq
);
CREATE SEQUENCE qaSeq;
--=================================================

CREATE TABLE tblAucList (
	aucListSeq	number		NOT NULL,
	biddingPrice	number		NOT NULL,
	status	char(1)	DEFAULT 'n'	NOT NULL,
	memberSeq	number		NOT NULL,
	auctionSeq	number		NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL
);
ALTER TABLE tblAucList ADD CONSTRAINT PK_TBLAUCLIST PRIMARY KEY (
	aucListSeq
);
ALTER TABLE tblAucList ADD CONSTRAINT FK_Member_TO_AucList FOREIGN KEY (
	memberSeq
)
REFERENCES tblMember (
	memberSeq
);

ALTER TABLE tblAucList ADD CONSTRAINT FK_Auction_TO_AucList FOREIGN KEY (
	auctionSeq
)
REFERENCES tblAuction (
	auctionSeq
);
CREATE SEQUENCE aucListSeq;
--=================================================
CREATE TABLE tblWarning (
	warningSeq	NUMBER		NOT NULL,
	content	VARCHAR2(1000)		NOT NULL,
	regDate	DATE	DEFAULT sysdate	NOT NULL,
	warnCategory	VARCHAR2(300)		NOT NULL,
	sMemberSeq	number		NOT NULL,
	rMemberSeq	number		NOT NULL
);
ALTER TABLE tblWarning ADD CONSTRAINT PK_TBLWARNING PRIMARY KEY (
	warningSeq
);
ALTER TABLE tblWarning ADD CONSTRAINT FK_Member_TO_Warning FOREIGN KEY (
	sMemberSeq
)
REFERENCES tblMember (
	memberSeq
);
CREATE SEQUENCE warningSeq;
--=================================================
CREATE TABLE tblBlackList (
	blackListSeq	NUMBER		NOT NULL,
	warningSeq	NUMBER		NOT NULL
);
ALTER TABLE tblBlackList ADD CONSTRAINT PK_TBLBLACKLIST PRIMARY KEY (
	blackListSeq
);
ALTER TABLE tblBlackList ADD CONSTRAINT FK_Warning_TO_BlackList FOREIGN KEY (
	warningSeq
)
REFERENCES tblWarning (
	warningSeq
);
CREATE SEQUENCE blacklistSeq;
--=================================================
CREATE TABLE tblCalendar (
	calSeq	number		NOT NULL,
	startDate	date		NOT NULL,
	endDate	date		NOT NULL,
	content	varchar2(500)		NOT NULL,
	status	char(1)	DEFAULT 'n'	NOT NULL,
	projectSeq	number		NOT NULL
);
ALTER TABLE tblCalendar ADD CONSTRAINT PK_TBLCALENDAR PRIMARY KEY (
	calSeq
);

ALTER TABLE tblCalendar ADD CONSTRAINT FK_Project_TO_Calendar FOREIGN KEY (
	projectSeq
)
REFERENCES tblProject (
	projectSeq
);
CREATE SEQUENCE calSeq;

--=================================================
CREATE TABLE tblExpense (
	expenseSeq	number		NOT NULL,
	isProfit	varchar2(6)		NOT NULL,
	price	number		NOT NULL,
	content	varchar2(100)		NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL,
	projectSeq	number		NOT NULL
);
ALTER TABLE tblExpense ADD CONSTRAINT PK_TBLEXPENSE PRIMARY KEY (
	expenseSeq
);

ALTER TABLE tblExpense ADD CONSTRAINT FK_Project_TO_Expense FOREIGN KEY (
	projectSeq
)
REFERENCES tblProject (
	projectSeq
);

CREATE SEQUENCE expenseSeq;
--=================================================

CREATE TABLE tblLike (
	likeSeq	number		NOT NULL,
	projectSeq	number		NOT NULL,
	memberSeq	number		NOT NULL
);
ALTER TABLE tblLike ADD CONSTRAINT PK_TBLLIKE PRIMARY KEY (
	likeSeq
);
ALTER TABLE tblLike ADD CONSTRAINT FK_Project_TO_Like FOREIGN KEY (
	projectSeq
)
REFERENCES tblProject (
	projectSeq
);

ALTER TABLE tblLike ADD CONSTRAINT FK_Member_TO_Like FOREIGN KEY (
	memberSeq
)
REFERENCES tblMember (
	memberSeq
);

CREATE SEQUENCE likeSeq;
--=================================================

CREATE TABLE tblProjectPack (
	packageSeq	number		NOT NULL,
	price	number		NOT NULL,
	name	varchar2(300)		NOT NULL,
	content	varchar2(4000)		NOT NULL,
	projectSeq	number		NOT NULL
);
ALTER TABLE tblProjectPack ADD CONSTRAINT PK_TBLPROJECTPACK PRIMARY KEY (
	packageSeq
);

ALTER TABLE tblProjectPack ADD CONSTRAINT FK_Project_TO_ProjectPack FOREIGN KEY (
	projectSeq
)
REFERENCES tblProject (
	projectSeq
);

CREATE SEQUENCE packageSeq;
--=================================================

CREATE TABLE tblFunding (
	fundingSeq	number		NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL,
	packageSeq	number		NOT NULL,
	memberSeq	number		NOT NULL,
	usePoint	number	DEFAULT 0	NOT NULL
);
ALTER TABLE tblFunding ADD CONSTRAINT PK_TBLFUNDING PRIMARY KEY (
	fundingSeq
);
ALTER TABLE tblFunding ADD CONSTRAINT FK_ProjectPack_TO_Funding FOREIGN KEY (
	packageSeq
)
REFERENCES tblProjectPack (
	packageSeq
);

ALTER TABLE tblFunding ADD CONSTRAINT FK_Member_TO_Funding FOREIGN KEY (
	memberSeq
)
REFERENCES tblMember (
	memberSeq
);
CREATE SEQUENCE fundingSeq;

--=================================================
drop TABLE tblProcess;
CREATE TABLE tblProcess (
	processSeq	number		NOT NULL,
	content	varchar2(4000)		NOT NULL,
	title	varchar2(1000)		NOT NULL,
	fundingSeq	number		NOT NULL,
	regdate	date	DEFAULT sysdate	NOT NULL
);
ALTER TABLE tblProcess ADD CONSTRAINT PK_TBLPROCESS PRIMARY KEY (
	processSeq
);

ALTER TABLE tblProcess ADD CONSTRAINT FK_Funding_TO_Process FOREIGN KEY (
	fundingSeq
)
REFERENCES tblFunding (
	fundingSeq
);
CREATE SEQUENCE processSeq;

--=================================================
CREATE TABLE tblTax (
	vat	number		NOT NULL,
	platformCharge	number		NOT NULL,
	payCharge	number		NOT NULL
);



