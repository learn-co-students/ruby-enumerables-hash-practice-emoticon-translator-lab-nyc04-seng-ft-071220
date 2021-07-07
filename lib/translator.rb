require 'pry'
require "yaml"
# require modules here

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)
  emoticons_translated_hash = {}
  emoticons.each do |emoticon_type, emoticon|
    emoticons_translated_hash[emoticon_type] = {}
    emoticons_translated_hash[emoticon_type][:english] = emoticon[0]
    emoticons_translated_hash[emoticon_type][:japanese] = emoticon[1]
  end
  emoticons_translated_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  japanese_emoticon = "Sorry, that emoticon was not found"
  load_library(file_path).select do |emoticon_type, emoticon_hash|
    if emoticon_hash[:english] == emoticon
      japanese_emoticon = emoticon_hash[:japanese]
    end
  end
  japanese_emoticon
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  english_meaning = "Sorry, that emoticon was not found"
  load_library(file_path).select do |emoticon_type, emoticon_hash|
    if emoticon_hash[:japanese] == emoticon
      english_meaning = emoticon_type
    end
  end
  english_meaning
end