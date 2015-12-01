require 'spec_helper'

describe Markdown2Html::LinkFilter do
  it 'should fix links to implicit pages' do
    source = '[[Another-Local-Page]]'
    Markdown2Html::LinkFilter.new(source, nil).call.should == '<a href="another-local-page.html">Another-Local-Page</a>'
  end

  it 'should fix explicit links' do
    source = '<a href="https://github.com/user/repo/wiki/Another-Local-Page">Another-Local-Page</a>'
    Markdown2Html::LinkFilter.new(source, 'user/repo').call.should == '<a href="another-local-page.html">Another-Local-Page</a>'
  end

  it 'should leave links to github pages untouched' do
    source = '<a href="https://github.com/user/repo/wiki/_pages">Pages</a>'
    Markdown2Html::LinkFilter.new(source, 'user/repo').call.should == source
  end
end
