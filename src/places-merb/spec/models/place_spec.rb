require File.join( File.dirname(__FILE__), '..', "spec_helper" )

describe Place do

  before(:each) do
    @place = Place.new({
      :name => "Bremerton",
      :woeid => 2368481
    })
  end

  ###
  # Common attributes
  ##

  # General validity

  it "should be valid" do
    @place.should be_valid
  end

  # Name
  
  it "should have a name" do
    @place.name
  end
  
  it "should require a name" do
    @place.name = nil
    @place.should_not be_valid
  end
  
  # WOEID
  
  it "should have a WOEID" do
    @place.woeid
  end
  
  it "should require a WOEID" do
    @place.woeid = nil
    @place.should_not be_valid
  end
  
  ###
  # API calls
  ##
  
  it "should be able to load places from an API search" do
    Net::HTTP.should_receive(:get).and_return(sample_json_search_result_places)
    places = Place.search("Bremerton, WA")
    places.first.name.should == "Bremerton"
  end
  
  it "shouldn't fail too badly if the search result is nil" do
    Net::HTTP.should_receive(:get).and_return(nil)
    Place.search("Huh? Not sure how we'd get this back, but whateva'")
  end
  
  it "shouldn't fail too badly if the search result is un-parseable" do
    Net::HTTP.should_receive(:get).and_return(%(<html><head><title>less qq</title></head><body>more pew pew<body></html>))
    Place.search("DoesNotExist")
  end
  
  it "shouldn't fail too badly if the search result is just empty" do
    Net::HTTP.should_receive(:get).and_return(sample_json_search_result_empty)
    Place.search("DoesNotExist")
  end
  
  ###
  # Associations
  ##
  
  it "should have ancestors" do
    Net::HTTP.should_receive(:get).and_return(sample_json_search_result_places)
    @place.save
    @place.ancestors
  end
  
  it "should have a parent" do
    Net::HTTP.should_receive(:get).and_return(sample_json_search_result_place)
    @place.save
    @place.parent
  end
  
  it "should have children" do
    Net::HTTP.should_receive(:get).and_return(sample_json_search_result_places)
    @place.save
    @place.children
  end
  
  it "should have belongtos" do
    Net::HTTP.should_receive(:get).and_return(sample_json_search_result_places)
    @place.save
    @place.belongtos
  end

protected

  def sample_json_search_result_empty
    %({"places":{"start":0,"count":0,"total":0}})
  end

  def sample_json_search_result_place
    %({"place":{"woeid":12587706,"placeTypeName":"County","placeTypeName attrs":{"code":9},"name":"San Diego","country":"United States","country attrs":{"type":"Country","code":"US"},"admin1":"California","admin1 attrs":{"type":"State","code":"US-CA"},"admin2":"San Diego","admin2 attrs":{"type":"County","code":""},"admin3":"","locality1":"","locality2":"","postal":"","centroid":{"latitude":33.01984,"longitude":-116.8386},"boundingBox":{"southWest":{"latitude":32.534279,"longitude":-117.596207},"northEast":{"latitude":33.505402,"longitude":-116.081001}},"uri":"http:\/\/where.yahooapis.com\/v1\/place\/12587706","lang":"en-US"}})
  end

  
  def sample_json_search_result_places
    %({"places":
      {"place":
        [{ "woeid":2368481,
          "placeTypeName":"Town",
          "placeTypeName attrs":{"code":7},
          "name":"Bremerton",
          "country":"United States",
          "country attrs":{"type":"Country","code":"US"},
          "admin1":"Washington",
          "admin1 attrs":{"type":"State","code":"US-WA"},
          "admin2":"Kitsap",
          "admin2 attrs":{"type":"County","code":""},
          "admin3":"",
          "locality1":"Bremerton",
          "locality1 attrs":{"type":"Town"},
          "locality2":"",
          "postal":"", // this means there are multiple zip codes in Bremerton
          "centroid":{"latitude":47.56498,"longitude":-122.625687},
          "boundingBox":{
            "southWest":{"latitude":47.499828,"longitude":-122.803299},
            "northEast":{"latitude":47.606819,"longitude":-122.575569}
          },
          "uri":"http:\/\/where.yahooapis.com\/v1\/place\/2368481","lang":"en-us"
        }],
        "start":0,
        "count":1,
        "total":1
      }
    })
  end

end