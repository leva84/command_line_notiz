# frozen_string_literal: true

class EnglishWordList < Command
  def description
    'программа выводит английские слова и их перевод для изучения'
  end

  def call
    puts instruction
    words_arr.each do |word_hash|
      puts word_hash[:translation]
      puts result_translation(gets.chomp.downcase, word_hash[:eng_word])
      puts
    end
  end

  private

  def words_list
    File.readlines("#{Dir.pwd}/lib/date/word_english_list.txt")
  end

  def normalized_words
    words_list.shuffle.map { |string| string.chomp.downcase.split(' ') }
  end

  def words_arr
    normalized_words.map { |string| { eng_word: string.shift, translation: string.join(' ') } }
  end

  def instruction
    <<~HEREDOC

      Введите перевод на английском
      Введите enter для просмотра перевода
      Введите exit для выхода

    HEREDOC
  end

  def result_translation(input, eng_word)
    registry.run_command(input) if input == 'exit' && input != eng_word
    input == eng_word ? 'Yes !)' : "It is not right, that is right: #{eng_word}"
  end
end
