web: bundle exec rails s
release: bin/rake db:migrate

heroku buildpacks:add heroku/nodejs --index 1
heroku buildpacks:add heroku/ruby --index 2

heroku run rake db:seed