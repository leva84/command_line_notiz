# frozen_string_literal: true

class Help < Command
  def description
    'выводит список доступных команд'
  end

  def call
    App.new.help_for_help_class
  end
end
