require "rails_helper"

RSpec.feature "Listing Articles" do 
  
  before do
    @john = User.create(email: "John@example.com", password: "password")
    @article_1 = Article.create(title: "First Article", body: "This is my first test article", user: @john)
    @article_2 = Article.create(title: "Second Article", body: "This is my second test article", user: @john)
  end
  
  scenario "A user lists all articles" do
    visit "/"
    
    expect(page).to have_content(@article_1.title)
    expect(page).to have_content(@article_1.body)
    expect(page).to have_content(@article_2.title)
    expect(page).to have_content(@article_2.body)
    expect(page).to have_link(@article_1.title)
    expect(page).to have_link(@article_2.title)
  end
  
  scenario "A user has no articles" do
    Article.delete_all
  
    visit "/"
  
    expect(page).not_to have_content(@article_1.title)
    expect(page).not_to have_content(@article_1.body)
    expect(page).not_to have_content(@article_2.title)
    expect(page).not_to have_content(@article_2.body)
    expect(page).not_to have_link(@article_1.title)
    expect(page).not_to have_link(@article_2.title)
    
    within("h1#no-articles") do
      expect(page).to have_content("No Articles Created")
    end
  end
end