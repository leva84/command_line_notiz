# frozen_string_literal: true

class Storage
  DATA_PATH = '/data/ls_commands.txt'

  def print_commands
    if File.exist?(file_path)
      File.open(file_path, 'r') { |f| f.readlines }
    else
      'Файл не найден'
    end
  end

  def recording_command(str)
    if File.exist?(file_path) && str.size > 1
      File.open(file_path, 'a+') { |f| f.write(str.to_s) }
    else
      'Запись невозможна'
    end
  end

  private_methods

  def file_path
    current_path = File.dirname(__FILE__)
    current_path + DATA_PATH
  end
end