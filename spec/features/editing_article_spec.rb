require 'rails_helper'

RSpec.feature "Editing an Article" do
  
  before do
    @article = Article.create(title: "Article Title", body: "Article Body goes here...")
  end
  
  scenario "A user updates an article" do
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: "Updated Title"
    fill_in "Body", with: "Updated Article Body"
    click_button "Update Article"
    
    expect(page).to have_content("Article has successfully been updated")
    expect(current_path).to eq(article_path(@article))
    
    expect(page).to have_content("Updated Title")
    expect(page).to have_content("Updated Article Body")
  end
  
  scenario "A user fails to update an article" do
    visit "/"
    
    click_link @article.title
    click_link "Edit Article"
    
    fill_in "Title", with: ""
    fill_in "Body", with: "Updated Article Body"
    click_button "Update Article"
    
    expect(page).to have_content("Article has not been updated")
    expect(current_path).to eq(article_path(@article))
  end
end