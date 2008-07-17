DROP TABLE JBPM_ACTION;
DROP TABLE JBPM_BYTEARRAY;
DROP TABLE JBPM_BYTEBLOCK;
DROP TABLE JBPM_COMMENT;
DROP TABLE JBPM_DECISIONCONDITIONS;
DROP TABLE JBPM_DELEGATION;
DROP TABLE JBPM_EVENT;
DROP TABLE JBPM_EXCEPTIONHANDLER;
DROP TABLE JBPM_ID_GROUP;
DROP TABLE JBPM_ID_MEMBERSHIP;
DROP TABLE JBPM_ID_PERMISSIONS;
DROP TABLE JBPM_ID_USER;
DROP TABLE JBPM_LOG;
DROP TABLE JBPM_MESSAGE;
DROP TABLE JBPM_MODULEDEFINITION;
DROP TABLE JBPM_MODULEINSTANCE;
DROP TABLE JBPM_NODE;
DROP TABLE JBPM_POOLEDACTOR;
DROP TABLE JBPM_PROCESSDEFINITION;
DROP TABLE JBPM_PROCESSINSTANCE;
DROP TABLE JBPM_RUNTIMEACTION;
DROP TABLE JBPM_SWIMLANE;
DROP TABLE JBPM_SWIMLANEINSTANCE;
DROP TABLE JBPM_TASK;
DROP TABLE JBPM_TASKACTORPOOL;
DROP TABLE JBPM_TASKCONTROLLER;
DROP TABLE JBPM_TASKINSTANCE;
DROP TABLE JBPM_TIMER;
DROP TABLE JBPM_TOKEN;
DROP TABLE JBPM_TOKENVARIABLEMAP;
DROP TABLE JBPM_TRANSITION;
DROP TABLE JBPM_VARIABLEACCESS;
DROP TABLE JBPM_VARIABLEINSTANCE;
CREATE TABLE JBPM_ACTION (
    ID_                    NUMBER(19,0) NOT NULL,
    class                  CHAR(1) NOT NULL     ,
    NAME_                  VARCHAR2(255)        ,
    ISPROPAGATIONALLOWED_  NUMBER(1,0)          ,
    ACTIONEXPRESSION_      VARCHAR2(255)        ,
    ISASYNC_               NUMBER(1,0)          ,
    REFERENCEDACTION_      NUMBER(19,0)         ,
    ACTIONDELEGATION_      NUMBER(19,0)         ,
    EVENT_                 NUMBER(19,0)         ,
    PROCESSDEFINITION_     NUMBER(19,0)         ,
    TIMERNAME_             VARCHAR2(255)        ,
    DUEDATE_               VARCHAR2(255)        ,
    REPEAT_                VARCHAR2(255)        ,
    TRANSITIONNAME_        VARCHAR2(255)        ,
    TIMERACTION_           NUMBER(19,0)         ,
    EXPRESSION_            VARCHAR2(4000)       ,
    EVENTINDEX_            NUMBER(10,0)         ,
    EXCEPTIONHANDLER_      NUMBER(19,0)         ,
    EXCEPTIONHANDLERINDEX_ NUMBER(10,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_BYTEARRAY (
    ID_             NUMBER(19,0) NOT NULL,
    NAME_           VARCHAR2(255)        ,
    FILEDEFINITION_ NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_BYTEBLOCK (
    PROCESSFILE_ NUMBER(19,0) NOT NULL,
    BYTES_ raw(1024)                  ,
    INDEX_ NUMBER(10,0) NOT NULL      ,
    PRIMARY KEY (PROCESSFILE_, INDEX_)
  );

CREATE TABLE JBPM_COMMENT (
    ID_      NUMBER(19,0) NOT NULL,
    VERSION_ NUMBER(10,0) NOT NULL,
    ACTORID_ VARCHAR2(255)        ,
    TIME_ DATE                    ,
    MESSAGE_           VARCHAR2(4000)       ,
    TOKEN_             NUMBER(19,0)         ,
    TASKINSTANCE_      NUMBER(19,0)         ,
    TOKENINDEX_        NUMBER(10,0)         ,
    TASKINSTANCEINDEX_ NUMBER(10,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_DECISIONCONDITIONS (
    DECISION_       NUMBER(19,0) NOT NULL,
    TRANSITIONNAME_ VARCHAR2(255)        ,
    EXPRESSION_     VARCHAR2(255)        ,
    INDEX_          NUMBER(10,0) NOT NULL,
    PRIMARY KEY (DECISION_, INDEX_)
  );

CREATE TABLE JBPM_DELEGATION (
    ID_                NUMBER(19,0) NOT NULL,
    CLASSNAME_         VARCHAR2(4000)       ,
    CONFIGURATION_     VARCHAR2(4000)       ,
    CONFIGTYPE_        VARCHAR2(255)        ,
    PROCESSDEFINITION_ NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_EVENT (
    ID_                NUMBER(19,0) NOT NULL,
    EVENTTYPE_         VARCHAR2(255)        ,
    TYPE_              CHAR(1)              ,
    GRAPHELEMENT_      NUMBER(19,0)         ,
    PROCESSDEFINITION_ NUMBER(19,0)         ,
    NODE_              NUMBER(19,0)         ,
    TRANSITION_        NUMBER(19,0)         ,
    TASK_              NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_EXCEPTIONHANDLER (
    ID_                 NUMBER(19,0) NOT NULL,
    EXCEPTIONCLASSNAME_ VARCHAR2(4000)       ,
    TYPE_               CHAR(1)              ,
    GRAPHELEMENT_       NUMBER(19,0)         ,
    PROCESSDEFINITION_  NUMBER(19,0)         ,
    GRAPHELEMENTINDEX_  NUMBER(10,0)         ,
    NODE_               NUMBER(19,0)         ,
    TRANSITION_         NUMBER(19,0)         ,
    TASK_               NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_ID_GROUP (
    ID_     NUMBER(19,0) NOT NULL,
    CLASS_  CHAR(1) NOT NULL     ,
    NAME_   VARCHAR2(255)        ,
    TYPE_   VARCHAR2(255)        ,
    PARENT_ NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_ID_MEMBERSHIP (
    ID_    NUMBER(19,0) NOT NULL,
    CLASS_ CHAR(1) NOT NULL     ,
    NAME_  VARCHAR2(255)        ,
    ROLE_  VARCHAR2(255)        ,
    USER_  NUMBER(19,0)         ,
    GROUP_ NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_ID_PERMISSIONS (
    ENTITY_ NUMBER(19,0) NOT NULL,
    CLASS_  VARCHAR2(255)        ,
    NAME_   VARCHAR2(255)        ,
    ACTION_ VARCHAR2(255)
  );

CREATE TABLE JBPM_ID_USER (
    ID_       NUMBER(19,0) NOT NULL,
    CLASS_    CHAR(1) NOT NULL     ,
    NAME_     VARCHAR2(255)        ,
    EMAIL_    VARCHAR2(255)        ,
    PASSWORD_ VARCHAR2(255)        ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_LOG (
    ID_    NUMBER(19,0) NOT NULL,
    CLASS_ CHAR(1) NOT NULL     ,
    INDEX_ NUMBER(10,0)         ,
    DATE_ DATE                  ,
    TOKEN_     NUMBER(19,0)         ,
    PARENT_    NUMBER(19,0)         ,
    MESSAGE_   VARCHAR2(4000)       ,
    EXCEPTION_ VARCHAR2(4000)       ,
    ACTION_    NUMBER(19,0)         ,
    NODE_      NUMBER(19,0)         ,
    ENTER_ DATE                     ,
    LEAVE_ DATE                     ,
    DURATION_         NUMBER(19,0)          ,
    TRANSITION_       NUMBER(19,0)          ,
    CHILD_            NUMBER(19,0)          ,
    SOURCENODE_       NUMBER(19,0)          ,
    DESTINATIONNODE_  NUMBER(19,0)          ,
    VARIABLEINSTANCE_ NUMBER(19,0)          ,
    OLDBYTEARRAY_     NUMBER(19,0)          ,
    NEWBYTEARRAY_     NUMBER(19,0)          ,
    OLDDATEVALUE_ DATE                      ,
    NEWDATEVALUE_ DATE                      ,
    OLDDOUBLEVALUE_ DOUBLE PRECISION        ,
    NEWDOUBLEVALUE_ DOUBLE PRECISION        ,
    OLDLONGIDCLASS_   VARCHAR2(255)           ,
    OLDLONGIDVALUE_   NUMBER(19,0)            ,
    NEWLONGIDCLASS_   VARCHAR2(255)           ,
    NEWLONGIDVALUE_   NUMBER(19,0)            ,
    OLDSTRINGIDCLASS_ VARCHAR2(255)           ,
    OLDSTRINGIDVALUE_ VARCHAR2(255)           ,
    NEWSTRINGIDCLASS_ VARCHAR2(255)           ,
    NEWSTRINGIDVALUE_ VARCHAR2(255)           ,
    OLDLONGVALUE_     NUMBER(19,0)            ,
    NEWLONGVALUE_     NUMBER(19,0)            ,
    OLDSTRINGVALUE_   VARCHAR2(4000)          ,
    NEWSTRINGVALUE_   VARCHAR2(4000)          ,
    TASKINSTANCE_     NUMBER(19,0)            ,
    TASKACTORID_      VARCHAR2(255)           ,
    TASKOLDACTORID_   VARCHAR2(255)           ,
    SWIMLANEINSTANCE_ NUMBER(19,0)            ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_MESSAGE (
    ID_             NUMBER(19,0) NOT NULL,
    CLASS_          CHAR(1) NOT NULL     ,
    DESTINATION_    VARCHAR2(255)        ,
    EXCEPTION_      VARCHAR2(255)        ,
    ISSUSPENDED_    NUMBER(1,0)          ,
    TOKEN_          NUMBER(19,0)         ,
    TEXT_           VARCHAR2(255)        ,
    ACTION_         NUMBER(19,0)         ,
    NODE_           NUMBER(19,0)         ,
    TRANSITIONNAME_ VARCHAR2(255)        ,
    TASKINSTANCE_   NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_MODULEDEFINITION (
    ID_                NUMBER(19,0) NOT NULL,
    CLASS_             CHAR(1) NOT NULL     ,
    NAME_              VARCHAR2(4000)       ,
    PROCESSDEFINITION_ NUMBER(19,0)         ,
    STARTTASK_         NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_MODULEINSTANCE (
    ID_                 NUMBER(19,0) NOT NULL,
    CLASS_              CHAR(1) NOT NULL     ,
    PROCESSINSTANCE_    NUMBER(19,0)         ,
    TASKMGMTDEFINITION_ NUMBER(19,0)         ,
    NAME_               VARCHAR2(255)        ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_NODE (
    ID_                   NUMBER(19,0) NOT NULL,
    CLASS_                CHAR(1) NOT NULL     ,
    NAME_                 VARCHAR2(255)        ,
    PROCESSDEFINITION_    NUMBER(19,0)         ,
    ISASYNC_              NUMBER(1,0)          ,
    ACTION_               NUMBER(19,0)         ,
    SUPERSTATE_           NUMBER(19,0)         ,
    SUBPROCESSDEFINITION_ NUMBER(19,0)         ,
    DECISIONEXPRESSION_   VARCHAR2(255)        ,
    DECISIONDELEGATION    NUMBER(19,0)         ,
    SIGNAL_               NUMBER(10,0)         ,
    CREATETASKS_          NUMBER(1,0)          ,
    ENDTASKS_             NUMBER(1,0)          ,
    NODECOLLECTIONINDEX_  NUMBER(10,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_POOLEDACTOR (
    ID_               NUMBER(19,0) NOT NULL,
    ACTORID_          VARCHAR2(255)        ,
    SWIMLANEINSTANCE_ NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_PROCESSDEFINITION (
    ID_                    NUMBER(19,0) NOT NULL,
    NAME_                  VARCHAR2(255)        ,
    VERSION_               NUMBER(10,0)         ,
    ISTERMINATIONIMPLICIT_ NUMBER(1,0)          ,
    STARTSTATE_            NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_PROCESSINSTANCE (
    ID_      NUMBER(19,0) NOT NULL,
    VERSION_ NUMBER(10,0) NOT NULL,
    START_ DATE                   ,
    END_ DATE                     ,
    ISSUSPENDED_       NUMBER(1,0)      ,
    PROCESSDEFINITION_ NUMBER(19,0)     ,
    ROOTTOKEN_         NUMBER(19,0)     ,
    SUPERPROCESSTOKEN_ NUMBER(19,0)     ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_RUNTIMEACTION (
    ID_                   NUMBER(19,0) NOT NULL,
    VERSION_              NUMBER(10,0) NOT NULL,
    EVENTTYPE_            VARCHAR2(255)        ,
    TYPE_                 CHAR(1)              ,
    GRAPHELEMENT_         NUMBER(19,0)         ,
    PROCESSINSTANCE_      NUMBER(19,0)         ,
    ACTION_               NUMBER(19,0)         ,
    PROCESSINSTANCEINDEX_ NUMBER(10,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_SWIMLANE (
    ID_                     NUMBER(19,0) NOT NULL,
    NAME_                   VARCHAR2(255)        ,
    ACTORIDEXPRESSION_      VARCHAR2(255)        ,
    POOLEDACTORSEXPRESSION_ VARCHAR2(255)        ,
    ASSIGNMENTDELEGATION_   NUMBER(19,0)         ,
    TASKMGMTDEFINITION_     NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );
CREATE TABLE JBPM_SWIMLANEINSTANCE (
    ID_               NUMBER(19,0) NOT NULL,
    NAME_             VARCHAR2(255)        ,
    ACTORID_          VARCHAR2(255)        ,
    SWIMLANE_         NUMBER(19,0)         ,
    TASKMGMTINSTANCE_ NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );
CREATE TABLE JBPM_TASK (
    ID_                     NUMBER(19,0) NOT NULL,
    NAME_                   VARCHAR2(255)        ,
    PROCESSDEFINITION_      NUMBER(19,0)         ,
    DESCRIPTION_            VARCHAR2(4000)       ,
    ISBLOCKING_             NUMBER(1,0)          ,
    ISSIGNALLING_           NUMBER(1,0)          ,
    DUEDATE_                VARCHAR2(255)        ,
    ACTORIDEXPRESSION_      VARCHAR2(255)        ,
    POOLEDACTORSEXPRESSION_ VARCHAR2(255)        ,
    TASKMGMTDEFINITION_     NUMBER(19,0)         ,
    TASKNODE_               NUMBER(19,0)         ,
    STARTSTATE_             NUMBER(19,0)         ,
    ASSIGNMENTDELEGATION_   NUMBER(19,0)         ,
    SWIMLANE_               NUMBER(19,0)         ,
    TASKCONTROLLER_         NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );
CREATE TABLE JBPM_TASKACTORPOOL (
    TASKINSTANCE_ NUMBER(19,0) NOT NULL,
    POOLEDACTOR_  NUMBER(19,0) NOT NULL,
    PRIMARY KEY (TASKINSTANCE_, POOLEDACTOR_)
  );
CREATE TABLE JBPM_TASKCONTROLLER (
    ID_                       NUMBER(19,0) NOT NULL,
    TASKCONTROLLERDELEGATION_ NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );
CREATE TABLE JBPM_TASKINSTANCE (
    ID_          NUMBER(19,0) NOT NULL,
    CLASS_       CHAR(1) NOT NULL     ,
    NAME_        VARCHAR2(255)        ,
    DESCRIPTION_ VARCHAR2(4000)       ,
    ACTORID_     VARCHAR2(255)        ,
    CREATE_ DATE                      ,
    START_ DATE                       ,
    END_ DATE                         ,
    DUEDATE_ DATE                     ,
    PRIORITY_         NUMBER(10,0)            ,
    ISCANCELLED_      NUMBER(1,0)             ,
    ISSUSPENDED_      NUMBER(1,0)             ,
    ISOPEN_           NUMBER(1,0)             ,
    ISSIGNALLING_     NUMBER(1,0)             ,
    ISBLOCKING_       NUMBER(1,0)             ,
    TASK_             NUMBER(19,0)            ,
    TOKEN_            NUMBER(19,0)            ,
    SWIMLANINSTANCE_  NUMBER(19,0)            ,
    TASKMGMTINSTANCE_ NUMBER(19,0)            ,
    PRIMARY KEY (ID_)
  );
CREATE TABLE JBPM_TIMER (
    ID_   NUMBER(19,0) NOT NULL,
    NAME_ VARCHAR2(255)        ,
    DUEDATE_ DATE              ,
    REPEAT_           VARCHAR2(255)      ,
    TRANSITIONNAME_   VARCHAR2(255)      ,
    EXCEPTION_        VARCHAR2(4000)     ,
    ISSUSPENDED_      NUMBER(1,0)        ,
    ACTION_           NUMBER(19,0)       ,
    TOKEN_            NUMBER(19,0)       ,
    PROCESSINSTANCE_  NUMBER(19,0)       ,
    TASKINSTANCE_     NUMBER(19,0)       ,
    GRAPHELEMENTTYPE_ VARCHAR2(255)      ,
    GRAPHELEMENT_     NUMBER(19,0)       ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_TOKEN (
    ID_      NUMBER(19,0) NOT NULL,
    VERSION_ NUMBER(10,0) NOT NULL,
    NAME_    VARCHAR2(255)        ,
    START_ DATE                   ,
    END_ DATE                     ,
    NODEENTER_ DATE               ,
    NEXTLOGINDEX_             NUMBER(10,0)    ,
    ISABLETOREACTIVATEPARENT_ NUMBER(1,0)     ,
    ISTERMINATIONIMPLICIT_    NUMBER(1,0)     ,
    ISSUSPENDED_              NUMBER(1,0)     ,
    NODE_                     NUMBER(19,0)    ,
    PROCESSINSTANCE_          NUMBER(19,0)    ,
    PARENT_                   NUMBER(19,0)    ,
    SUBPROCESSINSTANCE_       NUMBER(19,0)    ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_TOKENVARIABLEMAP (
    ID_              NUMBER(19,0) NOT NULL,
    TOKEN_           NUMBER(19,0)         ,
    CONTEXTINSTANCE_ NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_TRANSITION (
    ID_                NUMBER(19,0) NOT NULL,
    NAME_              VARCHAR2(255)        ,
    PROCESSDEFINITION_ NUMBER(19,0)         ,
    FROM_              NUMBER(19,0)         ,
    TO_                NUMBER(19,0)         ,
    FROMINDEX_         NUMBER(10,0)         ,
    PRIMARY KEY (ID_)
  );

CREATE TABLE JBPM_VARIABLEACCESS (
    ID_             NUMBER(19,0) NOT NULL,
    VARIABLENAME_   VARCHAR2(255)        ,
    ACCESS_         VARCHAR2(255)        ,
    MAPPEDNAME_     VARCHAR2(255)        ,
    PROCESSSTATE_   NUMBER(19,0)         ,
    TASKCONTROLLER_ NUMBER(19,0)         ,
    INDEX_          NUMBER(10,0)         ,
    SCRIPT_         NUMBER(19,0)         ,
    PRIMARY KEY (ID_)
  );
  
CREATE TABLE JBPM_VARIABLEINSTANCE (
    ID_               NUMBER(19,0) NOT NULL,
    CLASS_            CHAR(1) NOT NULL     ,
    NAME_             VARCHAR2(255)        ,
    CONVERTER_        CHAR(1)              ,
    TOKEN_            NUMBER(19,0)         ,
    TOKENVARIABLEMAP_ NUMBER(19,0)         ,
    PROCESSINSTANCE_  NUMBER(19,0)         ,
    BYTEARRAYVALUE_   NUMBER(19,0)         ,
    DATEVALUE_ DATE                        ,
    DOUBLEVALUE_ DOUBLE PRECISION          ,
    LONGIDCLASS_   VARCHAR2(255)             ,
    LONGVALUE_     NUMBER(19,0)              ,
    STRINGIDCLASS_ VARCHAR2(255)             ,
    STRINGVALUE_   VARCHAR2(255)             ,
    TASKINSTANCE_  NUMBER(19,0)              ,
    PRIMARY KEY (ID_)
  );

ALTER TABLE JBPM_ACTION ADD CONSTRAINT FK_ACTION_EVENT FOREIGN KEY
(
  EVENT_
)
REFERENCES JBPM_EVENT;
ALTER TABLE JBPM_ACTION ADD CONSTRAINT FK_ACTION_EXPTHDL FOREIGN KEY
(
  EXCEPTIONHANDLER_
)
REFERENCES JBPM_EXCEPTIONHANDLER;
ALTER TABLE JBPM_ACTION ADD CONSTRAINT FK_ACTION_PROCDEF FOREIGN KEY
(
  PROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_ACTION ADD CONSTRAINT FK_CRTETIMERACT_TA FOREIGN KEY
(
  TIMERACTION_
)
REFERENCES JBPM_ACTION;
ALTER TABLE JBPM_ACTION ADD CONSTRAINT FK_ACTION_ACTNDEL FOREIGN KEY
(
  ACTIONDELEGATION_
)
REFERENCES JBPM_DELEGATION;
ALTER TABLE JBPM_ACTION ADD CONSTRAINT FK_ACTION_REFACT FOREIGN KEY
(
  REFERENCEDACTION_
)
REFERENCES JBPM_ACTION;
ALTER TABLE JBPM_BYTEARRAY ADD CONSTRAINT FK_BYTEARR_FILDEF FOREIGN KEY
(
  FILEDEFINITION_
)
REFERENCES JBPM_MODULEDEFINITION;
ALTER TABLE JBPM_BYTEBLOCK ADD CONSTRAINT FK_BYTEBLOCK_FILE FOREIGN KEY
(
  PROCESSFILE_
)
REFERENCES JBPM_BYTEARRAY;
ALTER TABLE JBPM_COMMENT ADD CONSTRAINT FK_COMMENT_TOKEN FOREIGN KEY
(
  TOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_COMMENT ADD CONSTRAINT FK_COMMENT_TSK FOREIGN KEY
(
  TASKINSTANCE_
)
REFERENCES JBPM_TASKINSTANCE;
ALTER TABLE JBPM_DECISIONCONDITIONS ADD CONSTRAINT FK_DECCOND_DEC FOREIGN KEY
(
  DECISION_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_DELEGATION ADD CONSTRAINT FK_DELEGATION_PRCD FOREIGN KEY
(
  PROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_EVENT ADD CONSTRAINT FK_EVENT_PROCDEF FOREIGN KEY
(
  PROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_EVENT ADD CONSTRAINT FK_EVENT_NODE FOREIGN KEY
(
  NODE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_EVENT ADD CONSTRAINT FK_EVENT_TRANS FOREIGN KEY
(
  TRANSITION_
)
REFERENCES JBPM_TRANSITION;
ALTER TABLE JBPM_EVENT ADD CONSTRAINT FK_EVENT_TASK FOREIGN KEY
(
  TASK_
)
REFERENCES JBPM_TASK;
ALTER TABLE JBPM_ID_GROUP ADD CONSTRAINT FK_ID_GRP_PARENT FOREIGN KEY
(
  PARENT_
)
REFERENCES JBPM_ID_GROUP;
ALTER TABLE JBPM_ID_MEMBERSHIP ADD CONSTRAINT FK_ID_MEMSHIP_GRP FOREIGN KEY
(
  GROUP_
)
REFERENCES JBPM_ID_GROUP;
ALTER TABLE JBPM_ID_MEMBERSHIP ADD CONSTRAINT FK_ID_MEMSHIP_USR FOREIGN KEY
(
  USER_
)
REFERENCES JBPM_ID_USER;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_SOURCENODE FOREIGN KEY
(
  SOURCENODE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_TOKEN FOREIGN KEY
(
  TOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_OLDBYTES FOREIGN KEY
(
  OLDBYTEARRAY_
)
REFERENCES JBPM_BYTEARRAY;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_NEWBYTES FOREIGN KEY
(
  NEWBYTEARRAY_
)
REFERENCES JBPM_BYTEARRAY;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_CHILDTOKEN FOREIGN KEY
(
  CHILD_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_DESTNODE FOREIGN KEY
(
  DESTINATIONNODE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_TASKINST FOREIGN KEY
(
  TASKINSTANCE_
)
REFERENCES JBPM_TASKINSTANCE;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_SWIMINST FOREIGN KEY
(
  SWIMLANEINSTANCE_
)
REFERENCES JBPM_SWIMLANEINSTANCE;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_PARENT FOREIGN KEY
(
  PARENT_
)
REFERENCES JBPM_LOG;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_NODE FOREIGN KEY
(
  NODE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_ACTION FOREIGN KEY
(
  ACTION_
)
REFERENCES JBPM_ACTION;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_VARINST FOREIGN KEY
(
  VARIABLEINSTANCE_
)
REFERENCES JBPM_VARIABLEINSTANCE;
ALTER TABLE JBPM_LOG ADD CONSTRAINT FK_LOG_TRANSITION FOREIGN KEY
(
  TRANSITION_
)
REFERENCES JBPM_TRANSITION;
ALTER TABLE JBPM_MESSAGE ADD CONSTRAINT FK_MSG_TOKEN FOREIGN KEY
(
  TOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_MESSAGE ADD CONSTRAINT FK_CMD_NODE FOREIGN KEY
(
  NODE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_MESSAGE ADD CONSTRAINT FK_CMD_ACTION FOREIGN KEY
(
  ACTION_
)
REFERENCES JBPM_ACTION;
ALTER TABLE JBPM_MESSAGE ADD CONSTRAINT FK_CMD_TASKINST FOREIGN KEY
(
  TASKINSTANCE_
)
REFERENCES JBPM_TASKINSTANCE;
ALTER TABLE JBPM_MODULEDEFINITION ADD CONSTRAINT FK_TSKDEF_START FOREIGN KEY
(
  STARTTASK_
)
REFERENCES JBPM_TASK;
ALTER TABLE JBPM_MODULEDEFINITION ADD CONSTRAINT FK_MODDEF_PROCDEF FOREIGN KEY
(
  PROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_MODULEINSTANCE ADD CONSTRAINT FK_TASKMGTINST_TMD FOREIGN KEY
(
  TASKMGMTDEFINITION_
)
REFERENCES JBPM_MODULEDEFINITION;
ALTER TABLE JBPM_MODULEINSTANCE ADD CONSTRAINT FK_MODINST_PRCINST FOREIGN KEY
(
  PROCESSINSTANCE_
)
REFERENCES JBPM_PROCESSINSTANCE;
ALTER TABLE JBPM_NODE ADD CONSTRAINT FK_PROCST_SBPRCDEF FOREIGN KEY
(
  SUBPROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_NODE ADD CONSTRAINT FK_NODE_PROCDEF FOREIGN KEY
(
  PROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_NODE ADD CONSTRAINT FK_NODE_ACTION FOREIGN KEY
(
  ACTION_
)
REFERENCES JBPM_ACTION;
ALTER TABLE JBPM_NODE ADD CONSTRAINT FK_DECISION_DELEG FOREIGN KEY
(
  DECISIONDELEGATION
)
REFERENCES JBPM_DELEGATION;
ALTER TABLE JBPM_NODE ADD CONSTRAINT FK_NODE_SUPERSTATE FOREIGN KEY
(
  SUPERSTATE_
)
REFERENCES JBPM_NODE;
CREATE INDEX IDX_PLDACTR_ACTID ON JBPM_POOLEDACTOR
  (
    ACTORID_
  );

ALTER TABLE JBPM_POOLEDACTOR ADD CONSTRAINT FK_POOLEDACTOR_SLI FOREIGN KEY
(
  SWIMLANEINSTANCE_
)
REFERENCES JBPM_SWIMLANEINSTANCE;
ALTER TABLE JBPM_PROCESSDEFINITION ADD CONSTRAINT FK_PROCDEF_STRTSTA FOREIGN KEY
(
  STARTSTATE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_PROCESSINSTANCE ADD CONSTRAINT FK_PROCIN_PROCDEF FOREIGN KEY
(
  PROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_PROCESSINSTANCE ADD CONSTRAINT FK_PROCIN_ROOTTKN FOREIGN KEY
(
  ROOTTOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_PROCESSINSTANCE ADD CONSTRAINT FK_PROCIN_SPROCTKN FOREIGN KEY
(
  SUPERPROCESSTOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_RUNTIMEACTION ADD CONSTRAINT FK_RTACTN_PROCINST FOREIGN KEY
(
  PROCESSINSTANCE_
)
REFERENCES JBPM_PROCESSINSTANCE;
ALTER TABLE JBPM_RUNTIMEACTION ADD CONSTRAINT FK_RTACTN_ACTION FOREIGN KEY
(
  ACTION_
)
REFERENCES JBPM_ACTION;
ALTER TABLE JBPM_SWIMLANE ADD CONSTRAINT FK_SWL_ASSDEL FOREIGN KEY
(
  ASSIGNMENTDELEGATION_
)
REFERENCES JBPM_DELEGATION;
ALTER TABLE JBPM_SWIMLANE ADD CONSTRAINT FK_SWL_TSKMGMTDEF FOREIGN KEY
(
  TASKMGMTDEFINITION_
)
REFERENCES JBPM_MODULEDEFINITION;
ALTER TABLE JBPM_SWIMLANEINSTANCE ADD CONSTRAINT FK_SWIMLANEINST_TM FOREIGN KEY
(
  TASKMGMTINSTANCE_
)
REFERENCES JBPM_MODULEINSTANCE;
ALTER TABLE JBPM_SWIMLANEINSTANCE ADD CONSTRAINT FK_SWIMLANEINST_SL FOREIGN KEY
(
  SWIMLANE_
)
REFERENCES JBPM_SWIMLANE;
ALTER TABLE JBPM_TASK ADD CONSTRAINT FK_TSK_TSKCTRL FOREIGN KEY
(
  TASKCONTROLLER_
)
REFERENCES JBPM_TASKCONTROLLER;
ALTER TABLE JBPM_TASK ADD CONSTRAINT FK_TASK_ASSDEL FOREIGN KEY
(
  ASSIGNMENTDELEGATION_
)
REFERENCES JBPM_DELEGATION;
ALTER TABLE JBPM_TASK ADD CONSTRAINT FK_TASK_TASKNODE FOREIGN KEY
(
  TASKNODE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_TASK ADD CONSTRAINT FK_TASK_PROCDEF FOREIGN KEY
(
  PROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_TASK ADD CONSTRAINT FK_TASK_STARTST FOREIGN KEY
(
  STARTSTATE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_TASK ADD CONSTRAINT FK_TASK_TASKMGTDEF FOREIGN KEY
(
  TASKMGMTDEFINITION_
)
REFERENCES JBPM_MODULEDEFINITION;
ALTER TABLE JBPM_TASK ADD CONSTRAINT FK_TASK_SWIMLANE FOREIGN KEY
(
  SWIMLANE_
)
REFERENCES JBPM_SWIMLANE;
ALTER TABLE JBPM_TASKACTORPOOL ADD CONSTRAINT FK_TSKACTPOL_PLACT FOREIGN KEY
(
  POOLEDACTOR_
)
REFERENCES JBPM_POOLEDACTOR;
ALTER TABLE JBPM_TASKACTORPOOL ADD CONSTRAINT FK_TASKACTPL_TSKI FOREIGN KEY
(
  TASKINSTANCE_
)
REFERENCES JBPM_TASKINSTANCE;
ALTER TABLE JBPM_TASKCONTROLLER ADD CONSTRAINT FK_TSKCTRL_DELEG FOREIGN KEY
(
  TASKCONTROLLERDELEGATION_
)
REFERENCES JBPM_DELEGATION;
CREATE INDEX IDX_TASK_ACTORID ON JBPM_TASKINSTANCE
  (
    ACTORID_
  );

ALTER TABLE JBPM_TASKINSTANCE ADD CONSTRAINT FK_TASKINST_TMINST FOREIGN KEY
(
  TASKMGMTINSTANCE_
)
REFERENCES JBPM_MODULEINSTANCE;
ALTER TABLE JBPM_TASKINSTANCE ADD CONSTRAINT FK_TASKINST_TOKEN FOREIGN KEY
(
  TOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_TASKINSTANCE ADD CONSTRAINT FK_TASKINST_SLINST FOREIGN KEY
(
  SWIMLANINSTANCE_
)
REFERENCES JBPM_SWIMLANEINSTANCE;
ALTER TABLE JBPM_TASKINSTANCE ADD CONSTRAINT FK_TASKINST_TASK FOREIGN KEY
(
  TASK_
)
REFERENCES JBPM_TASK;
ALTER TABLE JBPM_TIMER ADD CONSTRAINT FK_TIMER_TOKEN FOREIGN KEY
(
  TOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_TIMER ADD CONSTRAINT FK_TIMER_PRINST FOREIGN KEY
(
  PROCESSINSTANCE_
)
REFERENCES JBPM_PROCESSINSTANCE;
ALTER TABLE JBPM_TIMER ADD CONSTRAINT FK_TIMER_ACTION FOREIGN KEY
(
  ACTION_
)
REFERENCES JBPM_ACTION;
ALTER TABLE JBPM_TIMER ADD CONSTRAINT FK_TIMER_TSKINST FOREIGN KEY
(
  TASKINSTANCE_
)
REFERENCES JBPM_TASKINSTANCE;
ALTER TABLE JBPM_TOKEN ADD CONSTRAINT FK_TOKEN_PARENT FOREIGN KEY
(
  PARENT_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_TOKEN ADD CONSTRAINT FK_TOKEN_NODE FOREIGN KEY
(
  NODE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_TOKEN ADD CONSTRAINT FK_TOKEN_PROCINST FOREIGN KEY
(
  PROCESSINSTANCE_
)
REFERENCES JBPM_PROCESSINSTANCE;
ALTER TABLE JBPM_TOKEN ADD CONSTRAINT FK_TOKEN_SUBPI FOREIGN KEY
(
  SUBPROCESSINSTANCE_
)
REFERENCES JBPM_PROCESSINSTANCE;
ALTER TABLE JBPM_TOKENVARIABLEMAP ADD CONSTRAINT FK_TKVARMAP_CTXT FOREIGN KEY
(
  CONTEXTINSTANCE_
)
REFERENCES JBPM_MODULEINSTANCE;
ALTER TABLE JBPM_TOKENVARIABLEMAP ADD CONSTRAINT FK_TKVARMAP_TOKEN FOREIGN KEY
(
  TOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_TRANSITION ADD CONSTRAINT FK_TRANSITION_TO FOREIGN KEY
(
  TO_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_TRANSITION ADD CONSTRAINT FK_TRANS_PROCDEF FOREIGN KEY
(
  PROCESSDEFINITION_
)
REFERENCES JBPM_PROCESSDEFINITION;
ALTER TABLE JBPM_TRANSITION ADD CONSTRAINT FK_TRANSITION_FROM FOREIGN KEY
(
  FROM_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_VARIABLEACCESS ADD CONSTRAINT FK_VARACC_TSKCTRL FOREIGN KEY
(
  TASKCONTROLLER_
)
REFERENCES JBPM_TASKCONTROLLER;
ALTER TABLE JBPM_VARIABLEACCESS ADD CONSTRAINT FK_VARACC_SCRIPT FOREIGN KEY
(
  SCRIPT_
)
REFERENCES JBPM_ACTION;
ALTER TABLE JBPM_VARIABLEACCESS ADD CONSTRAINT FK_VARACC_PROCST FOREIGN KEY
(
  PROCESSSTATE_
)
REFERENCES JBPM_NODE;
ALTER TABLE JBPM_VARIABLEINSTANCE ADD CONSTRAINT FK_VARINST_TK FOREIGN KEY
(
  TOKEN_
)
REFERENCES JBPM_TOKEN;
ALTER TABLE JBPM_VARIABLEINSTANCE ADD CONSTRAINT FK_VARINST_TKVARMP FOREIGN KEY
(
  TOKENVARIABLEMAP_
)
REFERENCES JBPM_TOKENVARIABLEMAP;
ALTER TABLE JBPM_VARIABLEINSTANCE ADD CONSTRAINT FK_VARINST_PRCINST FOREIGN KEY
(
  PROCESSINSTANCE_
)
REFERENCES JBPM_PROCESSINSTANCE;
ALTER TABLE JBPM_VARIABLEINSTANCE ADD CONSTRAINT FK_VAR_TSKINST FOREIGN KEY
(
  TASKINSTANCE_
)
REFERENCES JBPM_TASKINSTANCE;
ALTER TABLE JBPM_VARIABLEINSTANCE ADD CONSTRAINT FK_BYTEINST_ARRAY FOREIGN KEY
(
  BYTEARRAYVALUE_
)
REFERENCES JBPM_BYTEARRAY;
CREATE sequence hibernate_sequence;