class UseCaseGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :repository_name, :type => :string
  argument :repository_action, :type => :string

  def copy_use_case_file
    template "use_case.rb.erb", "app/models/use_case/#{file_name}.rb"
    template "model.rb.erb", "app/models/#{repository_name}.rb"
    template "repository.rb.erb", "app/models/repository/memory/#{repository_name}.rb"
  end
end
