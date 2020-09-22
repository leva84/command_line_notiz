# frozen_string_literal: true

class EmployeeListCommand < Command
  def initialize
    super
  end

  def self.name_command
    "employee list"
  end

  def self.description
    'выводит список сотрудников компании'
  end

  def self.result_work
    current_path = File.dirname(__FILE__)
    system('cat ' + current_path + '/date/employee_list.txt') { |answer| p answer.readlines }
  end
end
