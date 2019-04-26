feature 'see a list of bookmarks' do
  it 'shows a list of bookmarks' do
    visit '/'
    expect(page).to have_content 'Bookmarks'
  end
end

feature 'visiting /bookmarks shows me all the bookmarks' do
  it '' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')
    Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')

    visit '/bookmarks'

    expect(page).to have_content 'Makers Academy'
    expect(page).to have_content 'Google'
    expect(page).to have_content 'Destroy All Software'
  end
end

feature 'add a new bookmark' do
  it 'adds a new bookmark via a form' do
    visit '/bookmarks'
    fill_in('url', :with => 'http://www.facebook.com/')
    fill_in('title', :with => 'Facebook')
    click_button 'Add bookmark'
    expect(page).to have_content 'Facebook'
  end
end

feature 'title takes user to url' do
  it 'goes to url from title' do
    visit '/bookmarks'
    fill_in('url', :with => 'http://www.facebook.com/')
    fill_in('title', :with => 'Facebook')
    click_button 'Add bookmark'
    click_link 'Facebook'
    expect(page.current_url).to eq 'http://www.facebook.com/'
  end
end
