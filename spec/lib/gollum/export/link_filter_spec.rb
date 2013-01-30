require 'spec_helper'

describe Gollum::Export::LinkFilter do
  it 'should fix links to implicit pages' do
    source = '[[Another-Local-Page]]'
    Gollum::Export::LinkFilter.new(source, nil).call.should == '<a href="another-local-page.html">Another-Local-Page</a>'
  end

  it 'should fix explicit links' do
    source = '<a href="https://github.com/user/repo/wiki/Another-Local-Page">Another-Local-Page</a>'
    Gollum::Export::LinkFilter.new(source, 'user/repo').call.should == '<a href="another-local-page.html">Another-Local-Page</a>'
  end

  it 'should leave links to github pages untouched' do
    source = '<a href="https://github.com/user/repo/wiki/_pages">Pages</a>'
    Gollum::Export::LinkFilter.new(source, 'user/repo').call.should == source
  end
end
