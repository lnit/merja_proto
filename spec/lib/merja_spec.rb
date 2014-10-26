require 'spec_helper'
require 'merja'

describe Merja do
  before do
    Merja.stub(:accessible_dir).and_return(Pathname.new("/dummy/public/"))
  end

  describe "#target_pathname" do
    subject { Merja.__send__(:target_pathname, "hoge") }
    it { should == Pathname.new("/dummy/public/hoge") }
  end
  
  describe "#sanitize" do
    subject { Merja.__send__(:sanitize, Pathname.new(path)) }
    
    context "pathがpublic配下の場合" do
      let(:path) { "/dummy/public/hoge" }
      it { should == Pathname.new(path) }
    end
    
    context "pathがpublic配下でない場合" do
      let(:path) { "/dummy/app" }
      it { expect { subject }.to raise_error Merja::ForbiddenError }
    end
    
    context "pathに../を使用してディレクトリトラバーサルしようとした場合" do
      let(:path) { "/dummy/public/../../" }
      it { expect { subject }.to raise_error Merja::ForbiddenError }
    end
  end
end
