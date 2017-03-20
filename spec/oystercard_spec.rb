require 'oystercard'

describe Oystercard do

  subject(:oystercard) {described_class.new}

  it 'has a balance when created' do
    expect(oystercard.balance).to eq 0
  end

  it 'is not in use when created' do
    expect(oystercard).not_to be_in_journey
  end

  describe "#top_up" do
    it 'increases the balance by a specified amount' do
      expect{oystercard.top_up(10)}.to change{oystercard.balance}.by 10
    end

    it 'raises an exception if the belance exceeds 90' do
      limit = Oystercard::LIMIT
      oystercard.top_up(limit)
      expect {oystercard.top_up(1)}.to raise_error "you cannot top up more than #{limit}"
    end
  end

  describe '#deduct' do
    it 'deducts the specified amount from the balance' do
      expect{oystercard.deduct(10)}.to change{oystercard.balance}.by -10
    end
  end

  describe '#touch_in' do
    it 'updates the journey status to true' do
      oystercard.top_up(2)
      oystercard.touch_in
      expect(oystercard).to be_in_journey
    end

    it 'will not accept a card with a balance of less than 1' do
      expect {oystercard.touch_in}.to raise_error "insufficient funds: you need at least #{Oystercard::MINIMUM_BALANCE}"
    end

  end

  describe '#touch_out' do
    it 'updates the journey status to false' do
      oystercard.top_up(2)
      oystercard.touch_in
      oystercard.touch_out
      expect(oystercard).not_to be_in_journey
    end
  end

end
