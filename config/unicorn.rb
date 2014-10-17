# If you have a very small app you may be able to
# increase this, but in general 3 workers seems to
# work best
worker_processes 2

# Load your app into the master before forking
# workers for super-fast worker spawn times
preload_app true

# Immediately restart any workers that
# haven't responded within 45 seconds
timeout 6000

# Needed to establish db connection on heroku
after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection 
  end
end