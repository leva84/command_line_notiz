# frozen_string_literal: true

require_relative 'command'

command = nil

while command != 'exit'
  p '=================================================='
  p ' - Введите команду'
  p " - введите 'help' для просмотра доступных команд"
  p " - 'exit' для выхода"
  puts
  p '=================================================='
  puts

  print '>'
  command = STDIN.gets.chomp!

  Command.start_command(command)
  puts
end
