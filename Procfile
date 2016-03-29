web: bundle exec puma -p $PORT -C ./config/puma.rb
worker: TERM_CHILD=1 QUEUES=* bundle exec rake resque:work
#clock:  bundle exec rake resque:scheduler
