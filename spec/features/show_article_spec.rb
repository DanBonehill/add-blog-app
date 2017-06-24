require "rails_helper"

RSpec.feature "Showing an Article" do 
  
  before do
    @john = User.create(email: "john@example.com", password: "password")
    @steve = User.create(email: "steve@example.com", password: "password")
    @article = Article.create(title: "My First Article", body: "This is my first article!", user: @john)
  end
  
  scenario "to non-signed in user hide the edit and delete button" do
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  
  scenario "to non-owner hide the edit and delete button" do
    login_as(@steve)
    
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    expect(page).not_to have_link("Edit Article")
    expect(page).not_to have_link("Delete Article")
  end
  
  scenario "to owner show the edit and delete button" do
    login_as(@john)
    
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
    expect(page).to have_link("Edit Article")
    expect(page).to have_link("Delete Article")
  end
end