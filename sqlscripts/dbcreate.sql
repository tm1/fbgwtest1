/********************* ROLES **********************/

CREATE ROLE ADMINISTRATOR;
CREATE ROLE CASHIER;
CREATE ROLE CLEANER;
CREATE ROLE ENTRANCE;
CREATE ROLE KIOSK;
CREATE ROLE RDB$ADMIN;
CREATE ROLE REPLDATA;
CREATE ROLE REPLMETA;
/********************* UDFS ***********************/

DECLARE EXTERNAL FUNCTION DIV
Integer, Integer
RETURNS Double precision BY VALUE 
ENTRY_POINT 'IB_UDF_div'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION LTRIM
CSTRING(1020) NULL 
RETURNS CSTRING(1020)
ENTRY_POINT 'IB_UDF_ltrim'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION RTRIM
CSTRING(1020) NULL 
RETURNS CSTRING(1020)
ENTRY_POINT 'IB_UDF_rtrim'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION SRAND

RETURNS Double precision BY VALUE 
ENTRY_POINT 'IB_UDF_srand'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION STRLEN
CSTRING(32767) CHARACTER SET NONE
RETURNS Integer BY VALUE 
ENTRY_POINT 'IB_UDF_strlen'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION SUBSTR
CSTRING(1020) NULL , Smallint, Smallint
RETURNS CSTRING(1020)
ENTRY_POINT 'IB_UDF_substr'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION SUBSTRLEN
CSTRING(1020) NULL , Smallint, Smallint
RETURNS CSTRING(1020)
ENTRY_POINT 'IB_UDF_substrlen'
MODULE_NAME 'ib_udf';

DECLARE EXTERNAL FUNCTION UDF_FRAC
Double precision
RETURNS Double precision BY VALUE 
ENTRY_POINT 'IB_UDF_frac'
MODULE_NAME 'ib_udf';

/****************** GENERATORS ********************/

/******************** DOMAINS *********************/

/******************* PROCEDURES ******************/

/******************** TABLES **********************/

/********************* VIEWS **********************/

/******************* EXCEPTIONS *******************/

/******************** TRIGGERS ********************/


