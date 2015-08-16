module Dd
  class DatabaseRepositoryGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def copy_model_files
      template "database_repository.rb.erb", "app/models/repository/database/#{file_name}.rb"
      template "database_repository.rb.erb", "spec/models/repository/database/#{file_name}_spec.rb"
    end
  end
end
