# Defines a comedian
class Comedian < ActiveRecord::Base
  has_many :specials
end
