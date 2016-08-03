require 'rails_helper'

feature 'User search tour by location' do
  scenario 'successfully' do
    category = create(:category)
    category1 = create(:category, name: 'Trilha')
    guide = create :guide
    location = create :location
    location1 = create :location, city: 'Rio de Janeiro'
    tour = create(:tour, guide: guide, category: category, location: location)
    tour1 = create(:tour, guide: guide, category: category1,
                          location: location1)

    visit root_path

    select category.name, from: 'Tipo de passeio'
    fill_in 'Local', with: location.city
    click_on 'Buscar'

    expect(page).to have_content tour.title
    expect(page).to have_content tour.location.local
    expect(page).to have_content tour.category.name
    expect(page).to have_content tour.guide.name
    expect(page).to have_content tour.description
    expect(page).to_not have_content tour1.title
  end

  scenario 'without local' do
    category = create_list(:category, 2)
    guide = create :guide
    locations = create_list :location, 2
    create(:tour, guide: guide,
                  category: category.first, location: locations.first)
    create(:tour, guide: guide,
                  category: category.last, location: locations.first)
    create(:tour, guide: guide,
                  category: category.last, location: locations.last)

    visit root_path

    select category.last.name, from: 'Tipo de passeio'

    click_on 'Buscar'

    expect(page).not_to have_content category.first.name
    expect(page).to have_content locations.last.city
    expect(page).to have_content locations.first.city
  end

  scenario 'without category' do
    category = create_list(:category, 2)
    guide = create :guide
    locations = create_list :location, 2
    create(:tour, guide: guide,
                  category: category.first, location: locations.first)
    create(:tour, guide: guide,
                  category: category.last, location: locations.first)
    create(:tour, guide: guide,
                  category: category.last, location: locations.last)

    visit root_path

    fill_in 'Local', with: locations.first.city

    click_on 'Buscar'

    expect(page).not_to have_content locations.last.local
    expect(page).to have_content category.first.name
    expect(page).to have_content category.last.name
  end
end
