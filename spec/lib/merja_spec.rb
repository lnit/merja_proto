require 'spec_helper'
require 'merja'

describe Merja do
  before do
    Merja.stub(:accessible_dir).and_return("/dummy/public/")
  end

  describe "#target_pathname" do
    subject { Merja.__send__(:target_pathname, "hoge") }
    it { should == Pathname.new("/dummy/public/hoge") }
  end
end
