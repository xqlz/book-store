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

require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'saves given a valid Book' do
    book = Book.new(name: 'Buku', author: 'Nenek', price: 100, quantity: 10)
    expect(book.save).to be true
  end

  it 'does not save if price is negative' do
    book = Book.new(name: 'Buku', author: 'Nenek', price: -100, quantity: 10)
    expect(book.save).to be false
  end
end