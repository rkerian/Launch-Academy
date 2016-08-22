require 'spec_helper'
require 'orderly'


feature "Displays available meetups" do

  let(:user) do
    User.create(
      id: 1,
      provider: "github",
      uid: 123456,
      username: "Joe Bob",
      email: "joebob@nowhere.com",
      avatar_url: "https://fakeurl.com"
    )
  end

  let(:meetup) do
    Meetup.create(
      id: 1,
      name: "A Test DB Meetup",
      description: "This is the first test db meetup description.",
      creator: 1,
      location: "Raleigh, NC"
      )
  end

  let(:meetup_2) do
    Meetup.create(
      id: 2,
      name: "B Test DB Meetup",
      description: "This is the second test db meetup description.",
      creator: 1,
      location: "Raleigh, NC"
    )

  end

  scenario "the meetups page lists available meetups" do
    user
    meetup
    meetup_2
    visit '/meetups'

    expect(page).to have_content "A Test DB Meetup"
    expect(page).to have_content "B Test DB Meetup"

    expect("A Test DB Meetup").to appear_before("B Test DB Meetup")
  end

  scenario "meetups contain link to individual details page" do
    user
    meetup
    visit '/meetups'
    click_link("A Test DB Meetup")
  end
end

feature "User may views details of specific meetups" do
  let(:meetup) do
    Meetup.create(
      id: 1,
      name: "A Test DB Meetup",
      description: "This is the first test db meetup description.",
      creator: 1,
      location: "Raleigh, NC"
      )
  end

  let(:user) do
    User.create(
      id: 1,
      provider: "github",
      uid: 123456,
      username: "Joe Bob",
      email: "joebob@nowhere.com",
      avatar_url: "https://fakeurl.com"
    )
  end

  scenario "individual meetup details page contains complete details" do
    user
    meetup
    visit '/meetups/1'

    expect(page).to have_content "Name: A Test DB Meetup"
    expect(page).to have_content "Description: This is the first test db meetup description."
    expect(page).to have_content "Location: Raleigh, NC"
    expect(page).to have_content "Creator: Joe Bob"
  end
end

feature "User views members of specific meetup" do
  it "is a pending example"
end

feature "User joins a specific meetup" do
  it "is a pending example"
end
