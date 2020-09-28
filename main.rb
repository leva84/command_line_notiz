# frozen_string_literal: true

require_relative 'lib/command'
require_relative 'lib/about'
require_relative 'lib/help'

command = nil

while command != 'exit'
  puts '=================================================='
  puts ' - Введите команду'
  puts " - введите 'help' для просмотра доступных команд"
  puts " - 'exit' для выхода"
  puts
  puts '=================================================='
  puts

  print '>'
  command = gets.chomp!

  puts Command.new.start_command(command)
  puts
end
