# require modules here
require 'yaml'
require 'pry'

def load_library (file_path)
  # code goes here
  jap_hash = {}
  eng_hash = {}
  super_hash = {}
  yaml_file = YAML.load_file(file_path)
  yaml_file.each do |key,value|
    jap_hash[value[1]] = key 
    eng_hash[value[0]] = value[1]
  end
  super_hash['get_meaning'] = jap_hash
  super_hash['get_emoticon'] = eng_hash
  super_hash
end

def get_japanese_emoticon (file_path,emoticon)
  # code goes here
  answer = ""
  super_hash = load_library(file_path)
 
  super_hash['get_emoticon'].each do |key,value|
    emoticon == key ? answer = value : nil 
     
  end
   
  answer == "" ? answer = "Sorry, that emoticon was not found" : nil 
  answer
end

def get_english_meaning (file_path,emoticon)
  # code goes here
  answer = ""
  super_hash = load_library(file_path)
 
  super_hash['get_meaning'].each do |key,value|
    emoticon == key ? answer = value : nil 
     
  end
   
  answer == "" ? answer = "Sorry, that emoticon was not found" : nil 
  answer
end


    