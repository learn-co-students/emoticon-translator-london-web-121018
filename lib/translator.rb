# require modules here
require 'yaml'
require 'pry'

def load_library(path="emoticons.yml")
  emoticons = YAML.load_file(path)
  result = {'get_meaning' => {}, 'get_emoticon' => {}}

  emoticons.each do |word, symbols|
    result['get_meaning'][symbols[1]] = word
    result['get_emoticon'][symbols[0]] = symbols[1]
  end
  return result
end

def get_japanese_emoticon(path="emoticons.yml", emoticon)

  load_library(path).each do |key1, key2|
    if key1 == "get_emoticon"
      key2.each do |eng_sym, jap_sym|
        if emoticon == eng_sym
          return jap_sym
        end
      end
    end
  end
  "Sorry, that emoticon was not found"
end

def get_english_meaning(path="emoticons.yml", emoticon)

  load_library(path).each do |key1, key2|
    if key1 == "get_meaning"
      key2.each do |jap_sym, meaning|
        if emoticon == jap_sym
          return meaning
        end
      end
    end
  end
  "Sorry, that emoticon was not found"
end
