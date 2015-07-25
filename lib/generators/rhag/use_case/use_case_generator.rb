module Rhag
  class UseCaseGenerator < Rails::Generators::NamedBase
    source_root File.expand_path('../../templates', __FILE__)
    argument :repository_name,   :type => :string
    argument :repository_action, :type => :string

    ROOT_PATH      = "app/models/"
    TEST_ROOT_PATH = "spec/models/"

    PATHS = {
      model:               "/",
      memory_repository:   "repository/memory/",
      database_repository: "repository/database/",
      active_record:       "repository/adapters/ar/data/",
      adapter:             "repository/adapters/ar/" }

    def copy_use_case_file
      template "use_case.rb.erb", "#{ROOT_PATH}/use_case/#{file_name}.rb"
      template "use_case_spec.rb.erb", "#{TEST_ROOT_PATH}/use_case/#{file_name}_spec.rb"

      PATHS.keys.each do |fname|
        template "#{fname.to_s}.rb.erb", "#{ROOT_PATH}#{PATHS[fname]}#{repository_name}.rb"
        template "#{fname.to_s}_spec.rb.erb", "#{TEST_ROOT_PATH}#{PATHS[fname]}#{repository_name.to_s}_spec.rb"
      end
    end
  end
end
