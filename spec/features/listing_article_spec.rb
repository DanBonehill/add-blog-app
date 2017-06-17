require "rails_helper"

RSpec.feature "Listing Articles" do 
  
  before do
    @article_1 = Article.create(title: "First Article", body: "This is my first test article")
    @article_2 = Article.create(title: "Second Article", body: "This is my second test article")
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
  
end