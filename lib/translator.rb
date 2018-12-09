# require modules here
require 'yaml'
require 'pry'

def load_library(filepath)
  emo_hash = YAML.load_file('./lib/emoticons.yml')
  new_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emo_hash.each do |meaning, emot|
    new_hash["get_meaning"][emot[1]] = meaning
    new_hash["get_emoticon"][emot[0]] = emot[1]
      end
  new_hash
end

def get_japanese_emoticon(filepath, emoji)
  library = load_library(filepath)
  library['get_emoticon'].each do |eng, jap|
    if emoji == eng
      return jap
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(filepath, emoji)
  library = load_library(filepath)
  library["get_meaning"].each do |jap, meaning|
    if jap == emoji
      return meaning
    end
  end
  return "Sorry, that emoticon was not found"
end
