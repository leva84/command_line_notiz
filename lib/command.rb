# frozen_string_literal: true #

class Command
  attr_reader :registry

  def initialize
    @registry = CommandRegistry.new
    @registry.register_command('help', Help)
    @registry.register_command('about', About)
    @registry.register_command('eng-wl', EnglishWordList)
  end
end
