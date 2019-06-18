require "rails_helper"

describe "user edits an article they link from a show page" do
  describe "they fill in an edit field" do
    describe "and submit displays the updated information on a show" do
      it "edits a article" do
        article = Article.create!(title: "Title", body: "New Body")

        visit articles_path
        click_link article.title

        visit article_path(article)
        click_link "edit"

        expect(current_path).to eq(edit_article_path(article))

        fill_in "article[title]", with: "New Title!"
        fill_in "article[body]",  with: "New Body!"


        click_on "Update Article"
        # expect(page).to have_content("Article '#{article.title}' was updated.")

        visit article_path(article)

        expect(page).to have_content("New Title!")
        expect(page).to have_content("New Body!")
      end
    end
  end
end
