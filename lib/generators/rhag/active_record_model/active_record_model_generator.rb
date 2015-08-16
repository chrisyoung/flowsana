module Rhag
  class ActiveRecordModelGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def copy_model_files
      template "active_record_model.rb.erb", "app/models/repository/adapters/ar/data/#{file_name}.rb"
      template "active_record_model_spec.rb.erb", "spec/models/repository/adapters/ar/data/#{file_name}_spec.rb"
    end
  end
end
