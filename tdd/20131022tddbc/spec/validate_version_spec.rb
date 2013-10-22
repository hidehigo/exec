# encoding: utf-8
require 'version'

describe Version, "javaのバージョンを保持するclass" do
end

describe Version, "#valid? 形式チェック" do
  context "true case" do
    it "JDK7u90" do
      Version.valid?("JDK7u90").should be_true
    end
    
    it { Version.valid?("JDK7u100").should be_true }
    it { Version.valid?("JDK7u1").should be_true }
  end
  
  context "false case" do
    it "JJDKはfalse" do
      Version.valid?("JJDK").should be_false
    end
  
    it "JDK7u9x はfalse" do
      Version.valid?("JDK7u9x").should be_false
    end

    it "nullの場合はfalse" do 
      Version.valid?(nil).should be_false
    end
    
    it "JDK7u00はfalse" do
      Version.valid?("JDK7u00").should be_false
    end
    
    it "JDK7u0123はfalse" do
      Version.valid?("JDK7u0123").should be_false
    end
    
    it "空文字の場合はfalse" do 
      Version.valid?("").should be_false
    end

    it "スペースの場合はfalse" do 
      Version.valid?(" ").should be_false
    end
    
    it "family number が前ゼロfalse" do
      Version.valid?("JDK07u123").should be_false
    end
    
  end

end


describe Version, "#parse" do
  describe "object を返す" do
    v = Version.parse("JDK7u40")
    it { v.should be_instance_of(Version) }
  end
  context "不正な文字列の場合は例外" do
    it { expect { v = Version.parse("hoge") }.to raise_error }
  end
end

describe Version, "#parse 後に値が取れること" do
  before { @v = Version.parse("JDK7u40") }
  context "family numberが取れる" do
    it { @v.family_number.should eq("7") }
  end
  context "update numberが取れる" do
    it { @v.update_number.should eq("40") }
  end

end
