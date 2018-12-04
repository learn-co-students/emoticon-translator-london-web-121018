require "yaml"
require 'pry'

{"angel"=>["O:)", "☜(⌒▽⌒)☞"],
 "angry"=>[">:(", "ヽ(ｏ`皿′ｏ)ﾉ"],
 "bored"=>[":O", "(ΘεΘ;)"],
 "confused"=>["%)", "(゜.゜)"],
 "embarrased"=>[":$", "(#^.^#)"],
 "fish"=>["><>", ">゜))))彡"],
 "glasses"=>["8D", "(^0_0^)"],
 "grinning"=>["=D", "(￣ー￣)"],
 "happy"=>[":)", "(＾ｖ＾)"],
 "kiss"=>[":*", "(*^3^)/~☆"],
 "sad"=>[":'(", "(Ｔ▽Ｔ)"],
 "surprised"=>[":o", "o_O"],
 "wink"=>[";)", "(^_-)"]}

def load_library (file_path)
  emoticons = YAML.load_file(file_path)
  translator = {}
  emoticons.each {|word, meanings|
  meanings.each_with_index {|emoticon, index|
    if index == 1 && translator["get_meaning"]
    translator["get_meaning"][emoticon] = word
  elsif index == 1
    translator["get_meaning"] = {emoticon => word}
  elsif index == 0 && translator["get_emoticon"]
    translator["get_emoticon"][emoticon] = meanings[1]
  elsif index == 0
    translator["get_emoticon"] = {emoticon => meanings[1]}
  end
    }}
translator
end

def get_japanese_emoticon (file_path, emoticon)
translator = load_library (file_path)
translator.each {|get, translations|
translations.each {|english, japanese|
  if emoticon == english
    return japanese
  end
  }
}
  return "Sorry, that emoticon was not found"
end

def get_english_meaning (file_path, emoticon)
  translator = load_library (file_path)
  translator.each {|get, translations|
    if get == "get_meaning"
  translations.each {|japanese, meaning|
    if emoticon == japanese
      return meaning    
    end
  }
end
}
  return "Sorry, that emoticon was not found"
end
