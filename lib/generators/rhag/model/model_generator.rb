module Rhag
  class ModelGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def copy_model_files
      template "model.rb.erb", "app/models/#{file_name}.rb"
      template "model_spec.rb.erb", "spec/models/#{file_name}_spec.rb"
    end
  end
end
