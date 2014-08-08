namespace :clockwork do
  desc "Stop clockwork"
  task :stop do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :clockworkd, "-c lib/clockwork.rb --pid-dir=#{cw_pid_dir} --log-dir=#{cw_log_dir} stop"
        end
      end
    end
  end

  desc "Clockwork status"
  task :status do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :clockworkd, "-c lib/clockwork.rb --pid-dir=#{cw_pid_dir} --log-dir=#{cw_log_dir} status"
        end
      end
    end
  end

  desc "Start clockwork"
  task :start do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :clockworkd, "-c lib/clockwork.rb --pid-dir=#{cw_pid_dir} --log-dir=#{cw_log_dir} start"
        end
      end
    end
  end

  desc "Restart clockwork"
  task :restart do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :clockworkd, "-c lib/clockwork.rb --pid-dir=#{cw_pid_dir} --log-dir=#{cw_log_dir} restart"
        end
      end
    end
  end

  def cw_log_dir
    "#{shared_path}/log"
  end
  def cw_pid_dir
    "#{shared_path}/tmp/pids"
  end


  def rails_env
    fetch(:rails_env, false) ? "RAILS_ENV=#{fetch(:rails_env)}" : ''
  end
end
