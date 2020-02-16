# frozen_string_literal: true

require 'csv'

namespace :db do
  desc 'Sets up or migrates the database'
  task prepare: :environment do
    if ActiveRecord::Base.connection.table_exists?('schema_migrations')
      Rake::Task['db:migrate'].invoke
    else
      Rake::Task['db:schema:load'].invoke
      Rake::Task['db:seed'].invoke
    end
  end
end
