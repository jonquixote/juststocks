web: bundle exec rails s
release: bin/rake db:migrate

HEROKU_DEBUG_RAILS_RUNNER=1

heroku buildpacks:add heroku/nodejs --index 1
heroku buildpacks:add heroku/ruby --index 2

heroku run rake db:seed