require 'rails_helper'

feature 'User view tour' do
  scenario 'successfully' do
    guide = create :guide
    tour = create :tour, guide: guide

    visit root_path
    click_on 'Experiências'
    click_on tour.title

    expect(page).to have_content tour.title
    expect(page).to have_content tour.location.local
    expect(page).to have_content tour.category.name
    expect(page).to have_content tour.guide.name
    expect(page).to have_content guide.phone
    expect(page).to have_content tour.duration
    expect(page).to have_content number_to_currency(tour.amount)
    expect(page).to have_content tour.description
  end
end
