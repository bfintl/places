require File.join(File.dirname(__FILE__), '..', 'spec_helper.rb')

given "a place exists" do
  Place.all.destroy!
  request(resource(:places), :method => "POST", 
    :params => { :place => { :id => nil }})
end

describe "resource(:places)" do
  describe "GET" do
    
    before(:each) do
      @response = request(resource(:places))
    end
    
    it "responds successfully" do
      @response.should be_successful
    end

    it "contains a list of places" do
      pending
      @response.should have_xpath("//ul")
    end
    
  end
  
  describe "GET", :given => "a place exists" do
    before(:each) do
      @response = request(resource(:places))
    end
    
    it "has a list of places" do
      pending
      @response.should have_xpath("//ul/li")
    end
  end
  
  describe "a successful POST" do
    before(:each) do
      Place.all.destroy!
      @response = request(resource(:places), :method => "POST", 
        :params => { :place => { :id => nil }})
    end
    
    it "redirects to resource(:places)" do
      @response.should redirect_to(resource(Place.first), :message => {:notice => "place was successfully created"})
    end
    
  end
end

describe "resource(@place)" do 
  describe "a successful DELETE", :given => "a place exists" do
     before(:each) do
       @response = request(resource(Place.first), :method => "DELETE")
     end

     it "should redirect to the index action" do
       @response.should redirect_to(resource(:places))
     end

   end
end

describe "resource(:places, :new)" do
  before(:each) do
    @response = request(resource(:places, :new))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@place, :edit)", :given => "a place exists" do
  before(:each) do
    @response = request(resource(Place.first, :edit))
  end
  
  it "responds successfully" do
    @response.should be_successful
  end
end

describe "resource(@place)", :given => "a place exists" do
  
  describe "GET" do
    before(:each) do
      @response = request(resource(Place.first))
    end
  
    it "responds successfully" do
      @response.should be_successful
    end
  end
  
  describe "PUT" do
    before(:each) do
      @place = Place.first
      @response = request(resource(@place), :method => "PUT", 
        :params => { :place => {:id => @place.id} })
    end
  
    it "redirect to the article show action" do
      @response.should redirect_to(resource(@place))
    end
  end
  
end

