# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  emoticons= YAML.load_file(file_path)
  new_hash={}
  emoticons.each do |emoticon_name, emoji|
    new_hash[emoticon_name]={}
    new_hash[emoticon_name][:english]= emoji[0]
    new_hash[emoticon_name][:japanese]=emoji[1]
  end
  new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticon_collection = load_library(file_path)
  emoticon = emoticon_collection.keys.find do |key|
  emoticon_collection[key][:english] == emoticon
  end
  emoticon ? emoticon_collection[emoticon][:japanese]: "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  emoticon_collection=load_library(file_path)
  emoticon = emoticon_collection.keys.find do |key|
    emoticon_collection[key][:japanese] == emoticon
  end
  emoticon ? emoticon : "Sorry, that emoticon was not found"
end


