# require modules here
require 'yaml'


def load_library(file_path)
  emoticon= YAML.load_file(file_path)
  new_hash={}

  emoticon.each do |emoj, lang|
    new_hash[emoj]={}
    new_hash[emoj][:english]= lang[0]
    new_hash[emoj][:japanese]= lang[1]

end
new_hash
end

def get_japanese_emoticon(file_path, emoticon)
  lib=load_library(file_path)
  emoticon=lib.keys.find do |lang|
    lib[lang][:english] ==emoticon
  end
  emoticon ? lib[emoticon][:japanese] : "Sorry, that emoticon was not found"

end

def get_english_meaning(file_path, emoticon)
  lib=load_library(file_path)
  emoticon=lib.keys.find do |lang|
    lib[lang][:japanese] ==emoticon
  end
  emoticon ? emoticon: "Sorry, that emoticon was not found"

end
