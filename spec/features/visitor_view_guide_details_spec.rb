require 'rails_helper'

feature 'User view tours' do
  scenario 'successfully' do
    guide = create :guide

    tours = create_list :tour, 5, guide: guide

    visit guides_path

    click_on guide.name

    expect(page).to have_content guide.name
    expect(page).to have_content guide.location
    expect(page).to have_content guide.phone
    expect(page).to have_content guide.email

    tours.each do |tour|
      expect(page).to have_link tour.title
    end
  end

  scenario 'guide without layout' do
    guide = create :guide

    visit guides_path

    click_on guide.name

    expect(page).to have_content 'Não há passeios cadastrados!'
  end
end
