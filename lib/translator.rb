require "pry"
require "yaml"

def load_library(file_dir)
  emoticon_file = YAML.load_file(file_dir)
  translated_hash = {}
  emoticon_file.each do |emoticon,emoticon_on_keyboard|
    translated_hash[emoticon] = {:english => emoticon_on_keyboard[0], :japanese => emoticon_on_keyboard[1]}
  end
  translated_hash
end

def get_japanese_emoticon(file_dir,given_emoticon)
  emoticon_file = load_library(file_dir)
  translated_emoticon = nil
  emoticon_file.find do |emoticon,emoticon_on_keyboard|
    if emoticon_on_keyboard[:english] == given_emoticon
      translated_emoticon = emoticon_on_keyboard[:japanese]
    end
    emoticon_on_keyboard[:english] == given_emoticon
  end
  if translated_emoticon == nil
    translated_emoticon = "Sorry, that emoticon was not found"
  end
  translated_emoticon
end

def get_english_meaning(file_dir,given_emoticon)
  emoticon_file = load_library(file_dir)
  translated_emoticon = nil
  emoticon_file.find do |emoticon,emoticon_on_keyboard|
    if emoticon_on_keyboard[:japanese] == given_emoticon
      translated_emoticon = emoticon
    end
    emoticon_on_keyboard[:japanese] == given_emoticon
  end
  if translated_emoticon == nil
    translated_emoticon = "Sorry, that emoticon was not found"
  end

    translated_emoticon
    
end