rm -f spec/dummy/config/database.yml

engine=$(ruby -e 'puts RUBY_ENGINE')

case $DB in
  "mysql" )
    mysql -e 'CREATE DATABASE anedot_test;';;
  "postgres" )
    psql -c 'CREATE DATABASE anedot_test;' -U postgres;;
esac

cp spec/ci/database.$DB.$engine.yml spec/dummy/config/database.yml

cd spec/dummy
RAILS_ENV=test bundle exec rake db:setup db:migrate
