# frozen_string_literal: true

def result(command)
  IO.popen(command.to_s) { |answer| answer.read.chomp }
end

def print_commands
  if File.exist?(file_path)
    File.open(file_path, 'r') { |f| f.readlines }
  else
    'Файл не найден'
  end
end

def recording_commands(str)
  if File.exist?(file_path) && str.size > 1
    File.open(file_path, 'a+') { |f| f.write(str.to_s) }
  else
    'Запись невозможна'
  end
end

private_methods

def file_path
  current_path = File.dirname(__FILE__)
  current_path + '/data/ls_commands.txt'
end
