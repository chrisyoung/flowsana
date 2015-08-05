class Rhag::UseCase
  def initialize(listener)
    @listener = listener
  end

  def [](name, options={})
    repository_name = options[:repo] || use_case_name(name)
    ::UseCase.const_get(name.to_s.camelize).new @listener, Repository::Database.const_get(repository_name.classify)
  end

  def use_case_name(name)
    name.to_s.split("_")[1..-1].join("_")
  end
end
