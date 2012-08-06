rm -f spec/dummy/config/database.yml

case $DB in
  "mysql" )
    mysql -e 'CREATE DATABASE anedot_test;'
    cp spec/ci/database.mysql.yml spec/dummy/config/database.yml;;
  "postgres" )
    psql -c 'CREATE DATABASE anedot_test;' -U postgres
    cp spec/ci/database.postgresql.yml spec/dummy/config/database.yml;;
  "sqlite" )
    cp spec/ci/database.sqlite.yml spec/dummy/config/database.yml;;
esac

cd spec/dummy
RAILS_ENV=test bundle exec rake db:setup db:migrate
