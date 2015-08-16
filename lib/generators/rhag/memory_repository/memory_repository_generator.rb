module Rhag
  class MemoryRepositoryGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def copy_model_files
      template "memory_repository.rb.erb", "app/models/repository/memory/#{file_name}.rb"
      template "memory_repository.rb.erb", "spec/models/repository/memory/#{file_name}_spec.rb"
    end
  end
end
