# frozen_string_literal: true

module Commands
  class EnglishWordList < Base
    def description
      'программа выводит английские слова и их перевод для изучения'
    end

    def call
      puts instruction
      words_arr.each do |translation|
        puts translation[:ru_word]
        puts result_translation(gets.chomp.downcase, translation)
        puts
      end
    end

    private

    def words_list
      File.readlines("#{Dir.pwd}/data/word_english_list.txt")
    end

    def normalized_words
      words_list.shuffle.map { |string| string.chomp.downcase.split(' ') }
    end

    def words_arr
      normalized_words.map { |string| { eng_word: string.shift, ru_word: string.join(' ') } }
    end

    def instruction
      <<~HEREDOC

        Введите перевод на английском
        Введите enter для просмотра перевода
        Введите exit для выхода

      HEREDOC
    end

    def result_translation(input, words)
      registry.run_command(input) if input == 'exit' && !words.value?(input)
      words.value?(input) ? 'Yes !)' : "It is not right, that is right: #{words[:eng_word]}"
    end
  end
end
