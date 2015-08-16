module Rhag
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)

    def make_files
      generate "rhag:use_case", "list_#{file_name.pluralize}", 'list'
      generate "rhag:use_case", "create_#{file_name}", 'create'
      generate "rhag:use_case", "read_#{file_name}", 'read'
      generate "rhag:use_case", "update_#{file_name}", 'update'
      generate "rhag:use_case", "delete_#{file_name}", 'delete'
      generate "rhag:model", file_name

    end
  end
end
