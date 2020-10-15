# frozen_string_literal: true

class Help < Command
  attr_reader :commands_registry

  def initialize
    @commands_registry = REGISTRY
  end

  def self.description
    'выводит список доступных команд'
  end

  def call
    commands_registry.commands_description
  end
end
