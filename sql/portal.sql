@include jbpm.jpdl.DB_NAME.sql

@include portal-tables.sql

@include portal-data-common.sql

@include portal-data-counter.sql

@include portal-data-sample.vm

@include portal-data-cms-content.sql

@include portal-data-cms-layout.sql

@include portal-data-image.sql

@include portal-data-release.sql

@include quartz-tables.sql

COMMIT_TRANSACTION;