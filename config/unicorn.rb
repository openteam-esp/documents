worker_processes 2
preload_app true
timeout 300
listen "/tmp/unicorn-esp-documents.sock", :backlog => 64
pid "/var/run/unicorn/esp/documents.pid"
stderr_path "/var/log/unicorn/esp/documents.stderr.log"
stdout_path "/var/log/unicorn/esp/documents.stdout.log"

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end
