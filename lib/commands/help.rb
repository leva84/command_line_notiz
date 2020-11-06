# frozen_string_literal: true

require 'commands/base'

module Commands
  class Help < Base
    def description
      'выводит список доступных команд'
    end

    def call
      registry.command_names.each do |name|
        command = registry.command_by_name(name)
        puts "#{name} - #{command.description}"
      end
    end
  end
end
