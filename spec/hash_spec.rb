# frozen_string_literal: true

require_relative '../credit_card'
require 'minitest/autorun'

# Comment for obeying the rubocop due to not using
# Feel free to replace the contents of cards with data from your own yaml file
card_details = [
  { num: '4916603231464963',
    exp: 'Mar-30-2020',
    name: 'Soumya Ray',
    net: 'Visa' },
  { num: '6011580789725897',
    exp: 'Sep-30-2020',
    name: 'Nick Danks',
    net: 'Visa' },
  { num: '5423661657234057',
    exp: 'Feb-30-2020',
    name: 'Lee Chen',
    net: 'Mastercard' }
]

cards = card_details.map do |c|
  CreditCard.new(c[:num], c[:exp], c[:name], c[:net])
end

describe 'Test hashing requirements' do
  describe 'Test regular hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
      # cards.each
      it 'it Check that each card produces the same hash' do
        cards.map do |cc|
          hash1 = cc.hash
          puts hash1
          hash2 = cc.hash
          puts hash2
          _(hash1).wont_be_nil
          _(hash2).wont_be_nil
          _(hash1).must_equal hash2
        end
      end
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
      it 'Check that each card produces a different hash' do
        cards.map(&:hash).uniq.length.must_equal(cards.length)
      end
    end
  end

  describe 'Test cryptographic hashing' do
    describe 'Check hashes are consistently produced' do
      # TODO: Check that each card produces the same hash if hashed repeatedly
    end

    describe 'Check for unique hashes' do
      # TODO: Check that each card produces a different hash than other cards
    end

    describe 'Check regular hash not same as cryptographic hash' do
      # TODO: Check that each card's hash is different from its hash_secure
    end
  end
end
