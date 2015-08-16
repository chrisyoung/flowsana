module Rhag
  class UseCaseGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)
    argument :repository_action, :type => :string

    def copy_use_case_file
      template "use_case.rb.erb", "app/models/use_case/#{file_name}.rb"
      template "use_case_spec.rb.erb", "spec/models/use_case/#{file_name}_spec.rb"
    end
  end
end
