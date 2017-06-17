require "rails_helper"

RSpec.feature "Showing an Article" do 
  
  before do
    @article = Article.create(title: "My First Article", body: "This is my first article!")
  end
  
  scenario "A user views an article" do
    visit "/"
    
    click_link @article.title
    
    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end
end