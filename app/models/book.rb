# frozen_string_literal: true

# == Schema Information
#
# Table name: books
#
#  id         :integer          not null, primary key
#  name       :string
#  author     :string
#  price      :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
