require 'rails_helper'

RSpec.describe Trail do

  describe 'relationships' do
    it {should belong_to :national_park}
  end
end