# frozen_string_literal: true

class Command
  attr_reader :registry

  def initialize(registry)
    @registry = registry
  end

  def current_path
    File.dirname(__FILE__)
  end
end
