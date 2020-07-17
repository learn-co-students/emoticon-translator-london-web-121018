# require modules here
require "yaml"




def load_library(path)
  # code goes here
  emoticons = YAML.load_file(path)
  emoticon_hash = {}
  emoticon_hash['get_emoticon'] = {}
  emoticon_hash['get_meaning'] = {}
  emoticons.each do |word, emoticon_translations|
    emoticon_hash['get_emoticon'][emoticon_translations[0]] = emoticon_translations[1]
    emoticon_hash['get_meaning'][emoticon_translations[1]] = word 
  end 
  emoticon_hash
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  emoticon_hash = load_library(path)
  translation = emoticon_hash['get_emoticon'][emoticon]
  if !translation
    return 'Sorry, that emoticon was not found'
  end 
  translation
end

def get_english_meaning(path, emoticon)
  # code goes here
  emoticon_hash = load_library(path)
  translation = emoticon_hash['get_meaning'][emoticon]
  if !translation 
    return 'Sorry, that emoticon was not found'
  end 
  translation 
end

#emoticon_translation_lab ruby