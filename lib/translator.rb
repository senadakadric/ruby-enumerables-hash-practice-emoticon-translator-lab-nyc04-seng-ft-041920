# require modules here
require "yaml"
require 'pry'


def load_library(file_path)

  hash = YAML.load_file(file_path)
  parent_hash = {}

  hash.each_pair do |emoji_description, emojis_array|

    emojis_hash = {}
    emojis_hash[:english] = emojis_array[0]
    emojis_hash[:japanese] = emojis_array[1]
    parent_hash[emoji_description] = emojis_hash
    #binding.pry
  end

  parent_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  load_library(file_path)

end

def get_english_meaning(file_path, emoticon)
    emoji_hash = load_library(file_path)

    emoji_hash.each_pair do |key, emojis_hashes|

      if emojis_hashes[:japanese] == emoticon
        return key
      # elsif emojis_hashes[:japanese] != emoticon
      #   return "Sorry, we don't know that emoticon"
      end
    end

  #binding.pry

  # if language.to_s == japanese
  #   return emoji_hash[:english]
  # elsif language.to_s == english
  #   return emoji_hash[:japanese]
  # else
  #   return "Sorry, we don't know that emoticon"
  # end


end
