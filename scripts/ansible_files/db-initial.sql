CREATE DATABASE "QSR";
CREATE DATABASE "SenseServices";
CREATE DATABASE "QSMQ";
CREATE DATABASE "Licenses";

ALTER DATABASE "QSR" OWNER TO "qse_svc_user";
ALTER DATABASE "SenseServices" OWNER TO "qse_svc_user";
ALTER DATABASE "QSMQ" OWNER TO "qse_svc_user";
ALTER DATABASE "Licenses" OWNER TO "qse_svc_user";

GRANT TEMPORARY, CONNECT ON DATABASE "QSMQ" TO PUBLIC;
GRANT ALL ON DATABASE "QSMQ" TO "rdsadmin";
GRANT CREATE ON DATABASE "QSMQ" TO "qse_svc_user";
GRANT TEMPORARY, CONNECT ON DATABASE "SenseServices" TO PUBLIC;
GRANT ALL ON DATABASE "SenseServices" TO "rdsadmin";
GRANT CREATE ON DATABASE "SenseServices" TO "qse_svc_user";

GRANT TEMPORARY, CONNECT ON DATABASE "Licenses" TO PUBLIC;
GRANT ALL ON DATABASE "Licenses" TO "rdsadmin";
GRANT CREATE ON DATABASE "Licenses" TO "qse_svc_user";

UPDATE "Users" SET "RolesString"='RootAdmin' WHERE "UserId"='qse_svc_user';
UPDATE "Users" SET "RolesString"='RootAdmin' WHERE "UserId"='exampleservice';