class Book < ActiveRecord::Base
  attr_accessible :cd, :isbn, :price, :publish, :publishd, :title
end
