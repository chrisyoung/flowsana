module Dd
  class ResourceGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)
    argument :fields, :type => :array

    def make_files
      generate "dd:use_case", "list_#{file_name.pluralize}", 'list'
      generate "dd:use_case", "create_#{file_name}", 'create attributes'
      generate "dd:use_case", "read_#{file_name}", 'read id'
      generate "dd:use_case", "update_#{file_name}", 'update id attributes'
      generate "dd:use_case", "delete_#{file_name}", 'delete id'
      generate "dd:model", file_name, fields
      binding.pry
      generate "migration", "create_#{file_name}", fields
    end
  end
end
