BowerRails.configure do |bower_rails|
  # Tell bower-rails what path should be considered as root. Defaults to Dir.pwd
  bower_rails.root_path = Dir.pwd

  # Invokes rake bower:install before precompilation. Defaults to false
  bower_rails.install_before_precompile = false

  # Invokes rake bower:resolve before precompilation. Defaults to false
  bower_rails.resolve_before_precompile = false

  # Invokes rake bower:clean before precompilation. Defaults to false
  bower_rails.clean_before_precompile = false
end if defined?(BowerRails)
