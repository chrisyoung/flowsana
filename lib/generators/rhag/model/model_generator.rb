module Rhag
  class ModelGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)
    argument :fields, :type => :array

    def copy_model_files
      template "model.rb.erb",            "app/models/#{file_name}.rb"
      template "model_spec.rb.erb",       "spec/models/#{file_name}_spec.rb"
      generate "rhag:active_record_model", file_name
      generate "rhag:memory_repository",   file_name
      generate "rhag:database_repository", file_name
      generate "rhag:database_adapter",    file_name
    end
  end
end
