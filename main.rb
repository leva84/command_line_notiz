# frozen_string_literal: true

require_relative 'lib/command'
require_relative 'lib/about'
require_relative 'lib/help'

command = nil

while command != 'exit'
  p '=================================================='
  p ' - Введите команду'
  p " - введите 'help' для просмотра доступных команд"
  p " - 'exit' для выхода"
  p
  p '=================================================='
  puts

  print '>'
  command = STDIN.gets.strip!

  Command.new.start_command(command)
  p
end
