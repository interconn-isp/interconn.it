web: bundle exec rails server -p $PORT
worker: bundle exec sidekiq -q default -q mailers -e production -c 3
release: bundle exec rake db:prepare
