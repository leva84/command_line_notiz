# frozen_string_literal: true

class Help < Command
  attr_reader :registry

  def initialize(registry)
    @registry = registry
  end

  def description
    'выводит список доступных команд'
  end

  def call
    registry.facade.each do |command|
      puts "#{command[:name]} - #{command[:description]}"
    end
  end
end
