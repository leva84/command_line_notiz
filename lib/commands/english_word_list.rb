# frozen_string_literal: true

module Commands
  class EnglishWordList < Base
    def initialize(registry)
      super
      @lines = File.readlines("#{Dir.pwd}/data/word_english_list.txt")
      @lines = @lines.shuffle
      @words = @lines.each_with_object({}) do |line, h|
        parts = line.chomp.downcase.split(' ', 2)
        h[parts.first] = [parts.last]
      end
    end

    def instruction
      <<~HEREDOC

        Введите перевод на английском
        Введите enter для просмотра перевода
        Введите exit для выхода

      HEREDOC
    end

    def description
      'программа выводит английские слова и их перевод для изучения'
    end

    def call
      puts instruction
      words.each do |word, translations|
        puts "#{translations} => "
        request_user_choice
        puts response(word)
        puts
      end
    end

    private

    attr_reader :words, :user_choice

    def request_user_choice
      @user_choice = gets.chomp.downcase
      registry.run_command(user_choice) if user_choice == 'exit'
    end

    def response(word)
      word == user_choice ? 'Yes !)' : "Correct translation: [#{word}]"
    end
  end
end
