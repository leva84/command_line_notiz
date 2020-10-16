# frozen_string_literal: true #

class Command
  CURRENT_PATH = File.dirname(__FILE__)

  attr_reader :registry

  def initialize(registry)
    @registry = registry
  end
end
