-- drop table
DROP TABLE tblProcess;
DROP TABLE tblFunding;
DROP TABLE tblProjectPack;
DROP TABLE tblLike;
DROP TABLE tblExpense;
DROP TABLE tblCalendar;
DROP TABLE tblBlackList;
DROP TABLE tblWarning;
DROP TABLE tblAucList;
DROP TABLE tblQA;
DROP TABLE tblComment;
DROP TABLE tblNotice;
DROP TABLE tblCard;

DROP TABLE tblProject;

DROP TABLE tblAuction;
DROP TABLE tblTax;
DROP TABLE tblCategory;
DROP TABLE tblAdmin;
DROP TABLE tblMember;


-- drop sequence
DROP SEQUENCE memberSeq;
DROP SEQUENCE adminSeq;
DROP SEQUENCE categorySeq;
DROP SEQUENCE auctionSeq;
DROP SEQUENCE projectSeq;
DROP SEQUENCE cardSeq;
DROP SEQUENCE noticeSeq;
DROP SEQUENCE commentSeq;
DROP SEQUENCE qaSeq;
DROP SEQUENCE aucListSeq;
DROP SEQUENCE warningSeq;
DROP SEQUENCE blacklistSeq;
DROP SEQUENCE calSeq;
DROP SEQUENCE expenseSeq;
DROP SEQUENCE likeSeq;
DROP SEQUENCE packageSeq;
DROP SEQUENCE fundingSeq;
DROP SEQUENCE processSeq;
DROP SEQUENCE contentImageSeq;
-- create sequence
CREATE SEQUENCE memberSeq;
CREATE SEQUENCE adminSeq;
CREATE SEQUENCE categorySeq;
CREATE SEQUENCE auctionSeq;
CREATE SEQUENCE projectSeq;
CREATE SEQUENCE cardSeq;
CREATE SEQUENCE noticeSeq;
CREATE SEQUENCE commentSeq;
CREATE SEQUENCE qaSeq;
CREATE SEQUENCE aucListSeq;
CREATE SEQUENCE warningSeq;
CREATE SEQUENCE blacklistSeq;
CREATE SEQUENCE calSeq;
CREATE SEQUENCE expenseSeq;
CREATE SEQUENCE likeSeq;
CREATE SEQUENCE packageSeq;
CREATE SEQUENCE fundingSeq;
CREATE SEQUENCE processSeq;
CREATE SEQUENCE contentImageSeq;

commit;