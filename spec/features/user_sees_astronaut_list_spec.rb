require "rails_helper"

describe 'user sees astronaut list' do
  describe 'they visit the index page' do
    it 'displays a list of astronauts' do
      astronaut = Astronaut.create(name: "Bailey", age: 33, job: "Flight Navigator")
      astronaut_2 = Astronaut.create(name: "Bob", age: 53, job: "Space Cadet")
      visit astronauts_path

      expect(current_path).to eq("/astronauts")
      expect(page).to have_content("Name: Bailey")
      expect(page).to have_content("Age: 33")
      expect(page).to have_content("Job Title: Flight Navigator")
      expect(page).to have_content("Name: Bob")
      expect(page).to have_content("Age: 53")
      expect(page).to have_content("Job Title: Space Cadet")
    end
    it 'displays the average age of the astronauts' do
      astronaut = Astronaut.create(name: "Bailey", age: 33, job: "Flight Navigator")
      astronaut_2 = Astronaut.create(name: "Bob", age: 53, job: "Space Cadet")

      visit astronauts_path

      expect(page).to have_content("Average Age: 43.0")
    end
    it 'displays all missions for each astronaut' do
      astronaut = Astronaut.create(name: "Bailey", age: 33, job: "Flight Navigator")
      astronaut_2 = Astronaut.create(name: "Bob", age: 53, job: "Space Cadet")

      mission_1 = astronaut.missions.create(title: "First Mission", time_in_space: 60)
      mission_2 = astronaut.missions.create(title: "Second Mission", time_in_space: 45)

      visit astronauts_path
      expect("#astronaut-#{astronaut.id}").to have_content("First Mission")
      expect("#astronaut-#{astronaut.id}").to have_content("Time in Space: 60")
      expect("#astronaut-#{astronaut.id}").to have_content("Second Mission")
      expect("#astronaut-#{astronaut.id}").to have_content("Time in Space: 45")
    end
    # it 'displays total time in space for each astronaut' do
    #   astronaut = Astronaut.create(name: "Bailey", age: 33, job: "Flight Navigator")
    #   astronaut_2 = Astronaut.create(name: "Bob", age: 53, job: "Space Cadet")
    #
    #   mission_1 = astronaut.missions.create(title: "First Mission", time_in_space: 60)
    #   mission_2 = astronaut.missions.create(title: "Second Mission", time_in_space: 45)
    #
    #   visit astronauts_path
    #
    #   expect(page).to have_content("First Mission")
    #   expect(page).to have_content("Time in Space: 60")
    #   expect(page).to have_content("Second Mission")
    #   expect(page).to have_content("Time in Space: 45")
    # end
  end
end
