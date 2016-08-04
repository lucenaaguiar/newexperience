require 'rails_helper'

RSpec.describe Location, type: :model do
  it 'returns city and state in local' do
    location = Location.create(city: 'São Paulo', state: 'SP')
    location.local == 'São Paulo, SP'
  end
end
