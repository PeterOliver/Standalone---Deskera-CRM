o=$(ps cax | grep -c ' mysqld$')
if [ $o -eq 1 ]; then
RESULT=`mysql -hlocalhost -P5000 -ukrawler -S /tmp/mysql-c.mxj/data/mysql.sock -pkrawler --skip-column-names -e "SHOW DATABASES LIKE 'crm'"`
if [ "$RESULT" == "crm" ]; then
mysql -hlocalhost -P5000 -ukrawler -S /tmp/mysql-c.mxj/data/mysql.sock -pkrawler crm -e "alter table finalgoalmanagement change startdate startdate1 date;alter table finalgoalmanagement change enddate enddate1 date;alter table finalgoalmanagement add column startdate bigint(20)AFTER startdate1;update finalgoalmanagement set startdate=UNIX_TIMESTAMP(startdate1)*1000;alter table finalgoalmanagement add column enddate bigint(20) AFTER startdate1;update finalgoalmanagement set enddate=UNIX_TIMESTAMP(enddate1)*1000;alter table finalgoalmanagement drop column startdate1;alter table finalgoalmanagement drop column enddate1;"
echo "Patch applied successfully............................."
else
echo "Error (02): Database does not exist"
fi
else
echo "Error (03): mysql is not running"
fi
