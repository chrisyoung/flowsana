module Rhag
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def make_files
      generate "rhag:use_case", file_name, 'list'
      generate "rhag:use_case", file_name, 'create'
      generate "rhag:use_case", file_name, 'read'
      generate "rhag:use_case", file_name, 'update'
      generate "rhag:use_case", file_name, 'delete'
      generate "rhag:model", file_name

    end
  end
end
