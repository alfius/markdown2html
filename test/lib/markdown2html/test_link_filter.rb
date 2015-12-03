require 'test_helper'

class TestMarkdown2Html < Minitest::Test
  def test_fixes_links_to_implicit_pages
    source = '[[Another-Local-Page]]'
    assert_equal '<a href="another-local-page.html">Another-Local-Page</a>', Markdown2Html::LinkFilter.new(source, nil).call
  end

  def test_fixes_explicit_links
    source = '<a href="https://github.com/user/repo/wiki/Another-Local-Page">Another-Local-Page</a>'
    assert_equal '<a href="another-local-page.html">Another-Local-Page</a>', Markdown2Html::LinkFilter.new(source, 'user/repo').call
  end

  def test_leaves_links_to_github_pages_untouched
    source = '<a href="https://github.com/user/repo/wiki/_pages">Pages</a>'
    assert_equal source, Markdown2Html::LinkFilter.new(source, 'user/repo').call
  end
end
