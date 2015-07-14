module Rhag
  class UseCaseGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)
    argument :repository_name, :type => :string
    argument :repository_action, :type => :string

    def copy_use_case_file
      template "use_case.rb.erb", "app/models/use_case/#{file_name}.rb"
      template "model.rb.erb", "app/models/#{repository_name}.rb"
      template "memory_repository.rb.erb", "app/models/repository/memory/#{repository_name}.rb"
      template "database_repository.rb.erb", "app/models/repository/database/#{repository_name}.rb"
      template "active_record.rb.erb", "app/models/repository/adapters/ar/#{repository_name}.rb"

      template "repository_adapter_spec.rb.erb", "spec/models/repository/adapters/#{repository_name}_spec.rb"
      template "repository_memory_spec.rb.erb", "spec/models/repository/memory/#{repository_name}_spec.rb"
      template "repository_database_spec.rb.erb", "spec/models/repository/database/#{repository_name}_spec.rb"
      template "use_case_spec.rb.erb", "spec/models/use_case/#{file_name}_spec.rb"
      template "model_spec.rb.erb", "spec/models/#{repository_name}_spec.rb"
    end
  end
end
