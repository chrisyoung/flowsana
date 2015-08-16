module Dd
  class DatabaseAdapterGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def copy_model_files
      template "database_adapter.rb.erb", "app/models/repository/adapters/ar/#{file_name}.rb"
      template "database_adapter_spec.rb.erb", "spec/models/repository/adapters/ar/#{file_name}_spec.rb"
    end
  end
end
