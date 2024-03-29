SET SQL DIALECT 3;

SET NAMES UTF8;

/* CREATE DATABASE 'fbgwtest1.fdb' PAGE_SIZE 8192 USER 'sysdba' PASSWORD 'masterkey' DEFAULT CHARACTER SET UTF8; */

CREATE DATABASE 'fbgwtest1.fdb' PAGE_SIZE 16384 DEFAULT CHARACTER SET UTF8;

/********************* ROLES **********************/

CREATE ROLE ADMINISTRATOR;
CREATE ROLE CASHIER;
CREATE ROLE CLEANER;
CREATE ROLE ENTRANCE;
CREATE ROLE KIOSK;
/* CREATE ROLE RDB$ADMIN; */
CREATE ROLE REPLDATA;
CREATE ROLE REPLMETA;
/********************* UDFS ***********************/

DECLARE EXTERNAL FUNCTION ADDDAY
Timestamp, Integer
RETURNS Timestamp
ENTRY_POINT 'addDay'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ADDDAY2
Timestamp, Integer, Timestamp
RETURNS PARAMETER 3
ENTRY_POINT 'addDay2'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ADDHOUR
Timestamp, Integer
RETURNS Timestamp
ENTRY_POINT 'addHour'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ADDMILLISECOND
Timestamp, Integer
RETURNS Timestamp
ENTRY_POINT 'addMilliSecond'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ADDMINUTE
Timestamp, Integer
RETURNS Timestamp
ENTRY_POINT 'addMinute'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ADDMONTH
Timestamp, Integer
RETURNS Timestamp
ENTRY_POINT 'addMonth'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ADDSECOND
Timestamp, Integer
RETURNS Timestamp
ENTRY_POINT 'addSecond'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ADDWEEK
Timestamp, Integer
RETURNS Timestamp
ENTRY_POINT 'addWeek'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ADDYEAR
Timestamp, Integer
RETURNS Timestamp
ENTRY_POINT 'addYear'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION DIV
Integer, Integer
RETURNS Double precision BY VALUE 
ENTRY_POINT 'IB_UDF_div'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION DOW
Timestamp, Varchar(60) CHARACTER SET NONE
RETURNS PARAMETER 2
ENTRY_POINT 'DOW'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION DPOWER
Double precision BY DESCRIPTOR , Double precision BY DESCRIPTOR , Double precision BY DESCRIPTOR 
RETURNS PARAMETER 3
ENTRY_POINT 'power'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION FN_BLOBBINCMP
blob, blob
RETURNS Integer BY VALUE 
ENTRY_POINT 'BlobBinCmp'
MODULE_NAME 'FREEUDFLIB.DLL';

DECLARE EXTERNAL FUNCTION FN_CRLF

RETURNS CSTRING(3) CHARACTER SET NONE
ENTRY_POINT 'CRLF'
MODULE_NAME 'FreeUDFLib.dll';

DECLARE EXTERNAL FUNCTION FN_GETRANDOM
Integer NULL 
RETURNS Double precision BY VALUE 
ENTRY_POINT 'GetRandom'
MODULE_NAME 'RANDOMUDF.DLL';

DECLARE EXTERNAL FUNCTION FN_INITRANDOM

RETURNS Integer BY VALUE 
ENTRY_POINT 'InitRandom'
MODULE_NAME 'RANDOMUDF.DLL';

DECLARE EXTERNAL FUNCTION FN_LRTRIM
CSTRING(1020) CHARACTER SET NONE NULL 
RETURNS CSTRING(1020) CHARACTER SET NONE
ENTRY_POINT 'lrTrim'
MODULE_NAME 'FreeUDFLib';

DECLARE EXTERNAL FUNCTION FN_MD5SUM
CSTRING(1020) CHARACTER SET NONE NULL , CSTRING(40) CHARACTER SET NONE
RETURNS PARAMETER 2
ENTRY_POINT 'MD5sum'
MODULE_NAME 'CRYPTUDF.DLL';

DECLARE EXTERNAL FUNCTION FN_RANDOMSTR
Integer, Integer, CSTRING(16000) CHARACTER SET NONE
RETURNS PARAMETER 3
ENTRY_POINT 'RandomStr'
MODULE_NAME 'RANDOMUDF.DLL';

DECLARE EXTERNAL FUNCTION FN_RANDOMSTRE
Integer, Integer, CSTRING(16000) CHARACTER SET NONE
RETURNS PARAMETER 3
ENTRY_POINT 'RandomStrE'
MODULE_NAME 'RANDOMUDF.DLL';

DECLARE EXTERNAL FUNCTION FN_SETRANDSEED
Integer NULL 
RETURNS Integer BY VALUE 
ENTRY_POINT 'SetRandSeed'
MODULE_NAME 'RANDOMUDF.DLL';

DECLARE EXTERNAL FUNCTION FN_SHA1SUM
CSTRING(1020) CHARACTER SET NONE NULL , CSTRING(40) CHARACTER SET NONE
RETURNS PARAMETER 2
ENTRY_POINT 'SHA1sum'
MODULE_NAME 'CRYPTUDF.DLL';

DECLARE EXTERNAL FUNCTION I64ROUND
Numeric(18,4) BY DESCRIPTOR , Numeric(18,4) BY DESCRIPTOR 
RETURNS PARAMETER 2
ENTRY_POINT 'fbround'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION I64TRUNCATE
Numeric(18,0) BY DESCRIPTOR , Numeric(18,0) BY DESCRIPTOR 
RETURNS PARAMETER 2
ENTRY_POINT 'fbtruncate'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION ISLEAPYEAR
Timestamp
RETURNS Integer BY VALUE 
ENTRY_POINT 'isLeapYear'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION LTRIM
CSTRING(1020) CHARACTER SET NONE NULL 
RETURNS CSTRING(1020) CHARACTER SET NONE
ENTRY_POINT 'IB_UDF_ltrim'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION ROUND
Integer BY DESCRIPTOR , Integer BY DESCRIPTOR 
RETURNS PARAMETER 2
ENTRY_POINT 'fbround'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION RTRIM
CSTRING(1020) CHARACTER SET NONE NULL 
RETURNS CSTRING(1020) CHARACTER SET NONE
ENTRY_POINT 'IB_UDF_rtrim'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION SDOW
Timestamp, Varchar(20) CHARACTER SET NONE
RETURNS PARAMETER 2
ENTRY_POINT 'SDOW'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION SRAND

RETURNS Double precision BY VALUE 
ENTRY_POINT 'IB_UDF_srand'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION SRIGHT
Varchar(400) CHARACTER SET NONE BY DESCRIPTOR , Smallint, Varchar(400) CHARACTER SET NONE BY DESCRIPTOR 
RETURNS PARAMETER 3
ENTRY_POINT 'right'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION STRING2BLOB
Varchar(1200) CHARACTER SET NONE BY DESCRIPTOR , blob
RETURNS PARAMETER 2
ENTRY_POINT 'string2blob'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION STRLEN
CSTRING(32767) CHARACTER SET NONE
RETURNS Integer BY VALUE 
ENTRY_POINT 'IB_UDF_strlen'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION SUBSTR
CSTRING(1020) CHARACTER SET NONE NULL , Smallint, Smallint
RETURNS CSTRING(1020) CHARACTER SET NONE
ENTRY_POINT 'IB_UDF_substr'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION SUBSTRLEN
CSTRING(1020) CHARACTER SET NONE NULL , Smallint, Smallint
RETURNS CSTRING(1020) CHARACTER SET NONE
ENTRY_POINT 'IB_UDF_substrlen'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION TRUNCATE
Integer BY DESCRIPTOR , Integer BY DESCRIPTOR 
RETURNS PARAMETER 2
ENTRY_POINT 'fbtruncate'
MODULE_NAME 'fbudf';

DECLARE EXTERNAL FUNCTION UDF_FRAC
Double precision
RETURNS Double precision BY VALUE 
ENTRY_POINT 'IB_UDF_frac'
MODULE_NAME 'ib_udf';

/****************** GENERATORS ********************/

/******************** DOMAINS *********************/

CREATE DOMAIN DOM_BIGINT_ABOVE_ZERO
 AS Bigint
 NOT NULL
 CHECK(value > 0)
;
CREATE DOMAIN DOM_BIGINT_ABOVE_ZERO_DEF
 AS Bigint
 DEFAULT 1
 NOT NULL
 CHECK(value > 0)
;
CREATE DOMAIN DOM_BIGINT_ABOVE_ZERO_NUL
 AS Bigint
 NOT NULL
 CHECK((value > 0) or (value is null))
;
CREATE DOMAIN DOM_BIGINT_POSITIVE_DEF
 AS Bigint
 DEFAULT 0
 NOT NULL
 check (value >= 0)
;
CREATE DOMAIN DOM_BOOLEAN_F
 AS Smallint
 DEFAULT 0
 NOT NULL
 CHECK(value in (0,1))
;
CREATE DOMAIN DOM_BOOLEAN_T
 AS Smallint
 DEFAULT 1
 NOT NULL
 CHECK(value in (0,1))
;
CREATE DOMAIN DOM_DATE
 AS Date
 DEFAULT 'now'
 NOT NULL
;
CREATE DOMAIN DOM_INT_ABOVE_ZERO
 AS Integer
 NOT NULL
 CHECK(value > 0)
;
CREATE DOMAIN DOM_INT_ABOVE_ZERO_DEF
 AS Integer
 DEFAULT 1
 NOT NULL
 CHECK(value > 0)
;
CREATE DOMAIN DOM_INT_ABOVE_ZERO_NUL
 AS Integer
 CHECK((value > 0) or (value is null))
;
CREATE DOMAIN DOM_INT_PERCENT
 AS Integer
 NOT NULL
 CHECK((value >= 0) and (value <= 100))
;
CREATE DOMAIN DOM_INT_POSITIVE
 AS Integer
 NOT NULL
 CHECK(value >= 0)
;
CREATE DOMAIN DOM_INT_POSITIVE_DEF
 AS Integer
 DEFAULT 0
 NOT NULL
 CHECK(value >= 0)
;
CREATE DOMAIN DOM_INT_POSITIVE_NUL
 AS Integer
 CHECK((value >= 0) or (value is null))
;
CREATE DOMAIN DOM_REASON
 AS Smallint
 check ((value is null) or (value in (0,1,2,3)))
;
CREATE DOMAIN DOM_SESSION
 AS Bigint
 NOT NULL
 CHECK(value > 0)
;
CREATE DOMAIN DOM_STRING_COMMENT
 AS Varchar(4000)
 NOT NULL
 CHECK(value <> '')
 COLLATE UTF8;
CREATE DOMAIN DOM_STRING_COMMENT_DEF
 AS Varchar(4000)
 DEFAULT 'no comments'
 NOT NULL
 CHECK(value <> '')
 COLLATE UTF8;
CREATE DOMAIN DOM_TIMESTAMP_DEF
 AS Timestamp
 DEFAULT 'now'
 NOT NULL
;
CREATE DOMAIN DOM_TIMESTAMP_NUL
 AS Timestamp
;
CREATE DOMAIN DOM_TIME_HOURS
 AS Integer
 NOT NULL
 CHECK(value >= 0 and value <= 23)
;
CREATE DOMAIN DOM_TIME_MINUTES
 AS Integer
 NOT NULL
 CHECK(value >= 0 and value <= 59)
;
CREATE DOMAIN DOM_TIME_SECONDS
 AS Integer
 NOT NULL
 CHECK(value >= 0 and value <= 59)
;
CREATE DOMAIN DOM_YEAR
 AS Smallint
 NOT NULL
 CHECK((value >= 1800) and (value <= 9999))
;
/******************* PROCEDURES ******************/

SET TERM ^ ;
CREATE PROCEDURE IP_ERROR (
    E Varchar(2000) )
AS
BEGIN SUSPEND; END^
SET TERM ; ^

/******************** TABLES **********************/

/********************* VIEWS **********************/

/******************* EXCEPTIONS *******************/

CREATE EXCEPTION EXCP_DYN_ERR
'???';
CREATE EXCEPTION SYS$EXCP_DATA
'Data deletion not allowed';
CREATE EXCEPTION SYS$EXCP_META
'Metadata changes not allowed';
/******************** TRIGGERS ********************/

SET TERM ^ ;
CREATE TRIGGER SYS$TRG_CHECK_CONSTRAINTS FOR RDB$CHECK_CONSTRAINTS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_DATABASE FOR RDB$DATABASE ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_DEPENDENCIES FOR RDB$DEPENDENCIES ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_EXCEPTIONS FOR RDB$EXCEPTIONS ACTIVE
BEFORE INSERT OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_FIELDS FOR RDB$FIELDS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_PROCEDURES FOR RDB$PROCEDURES ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_PROCEDURE_PARAMETERS FOR RDB$PROCEDURE_PARAMETERS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_REF_CONSTRAINTS FOR RDB$REF_CONSTRAINTS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_RELATIONS FOR RDB$RELATIONS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_RELATION_CONSTRAINTS FOR RDB$RELATION_CONSTRAINTS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_RELATION_FIELDS FOR RDB$RELATION_FIELDS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_TRIGGERS FOR RDB$TRIGGERS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_USER_PRIVILEGES FOR RDB$USER_PRIVILEGES ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^
SET TERM ^ ;
CREATE TRIGGER SYS$TRG_VIEW_RELATIONS FOR RDB$VIEW_RELATIONS ACTIVE
BEFORE INSERT OR UPDATE OR DELETE POSITION 0
as
begin
  if ((current_user <> 'DEVEL001')
    and (current_role <> 'REPLMETA')) then
  begin
    exception SYS$EXCP_META  'Metadata changes not allowed for user (' ||
      current_user || '), role (' || current_role || ')';
  end
end^
SET TERM ; ^

SET TERM ^ ;
ALTER PROCEDURE IP_ERROR (
    E Varchar(2000) )
AS
DECLARE VARIABLE EE VARCHAR(78) CHARACTER SET NONE;
begin
  EE = '';
  EE = :E;
  /* если входной параметр больше чем 78 то тут возникает ошибка
     которая успешно обрабатывается ниже */
  update RDB$EXCEPTIONS
    set RDB$MESSAGE = :E
    where RDB$EXCEPTION_NAME = 'EXCP_DYN_ERR';
  exception EXCP_DYN_ERR;
  /* сюда попадаем только если входной параметр Е больше 78 символов */
  /* EE - содержит 78 символов в обрезанных от E */
  when any do
  begin
    if (:EE is null) then
      EE = 'Message text is <null>.';
    update RDB$EXCEPTIONS
      set RDB$MESSAGE = :EE
      where RDB$EXCEPTION_NAME = 'EXCP_DYN_ERR';
    exception EXCP_DYN_ERR;
  end
end^
SET TERM ; ^


GRANT EXECUTE
 ON PROCEDURE IP_ERROR TO  DEVEL001;

GRANT EXECUTE
 ON PROCEDURE IP_ERROR TO  SYSDBA;

