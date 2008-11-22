class Place
  include DataMapper::Resource
  
  YAHOO_APP_ID = '5.BrnO7V34FLc73w1j5Q8EaVom_vvCFnJWF0xMDgt6eQ.w7IOuLlApQnxEf8LAzm'
  
  property :id, Serial

  property :name,  String,  :nullable => false
  property :woeid, Integer, :nullable => false

  def self.search(query)
    Place.find_or_create_from_places_json(yahoo_get_places(query))
  end
  
  def self.world
    find_or_create_from_place_json(json_place(yahoo_get("/place/1")))
  end
  
  def parent
    Place.find_or_create_from_place_json(yahoo_get_parent)
  end
  
  def ancestors
    Place.find_or_create_from_places_json(yahoo_get_ancestors)
  end
  
  def belongtos
    Place.find_or_create_from_places_json(yahoo_get_belongtos)
  end

  def neighbors
    Place.find_or_create_from_places_json(yahoo_get_neighbors)
  end

  def siblings
    Place.find_or_create_from_places_json(yahoo_get_siblings)
  end

  def children
    Place.find_or_create_from_places_json(yahoo_get_children)
  end
  

protected

  def self.find_or_create_from_places_json(places)
    places.collect do |place|
      Place.find_or_create_from_place_json(place)
    end
  end

  def self.find_or_create_from_place_json(place)
    Place.first(:woeid => place["woeid"]) || Place.create(Place.normalize_json(place))
  rescue
    raise place.inspect
  end

  def self.normalize_json(place)
    {
      :name => place["name"],
      :woeid => place["woeid"]
    }
  end

  def yahoo_get_parent
    self.class.json_place(self.class.yahoo_get("/place/#{woeid}/parent"))
  end
  
  def yahoo_get_ancestors
    self.class.json_places(self.class.yahoo_get("/place/#{woeid}/ancestors"))
  end
  
  def yahoo_get_belongtos
    self.class.json_places(self.class.yahoo_get("/place/#{woeid}/belongtos"))
  end
  
  def yahoo_get_neighbors
    self.class.json_places(self.class.yahoo_get("/place/#{woeid}/children"))
  end

  def yahoo_get_siblings
    self.class.json_places(self.class.yahoo_get("/place/#{woeid}/children"))
  end

  def yahoo_get_children
    self.class.json_places(self.class.yahoo_get("/place/#{woeid}/children"))
  end
  
  def self.yahoo_get_places(query)
    json_places(yahoo_get("/places.q(#{urlescape(query)})"))
  end
  
  def self.yahoo_get(path)
    host = "where.yahooapis.com"
    path = "/v1#{path}?appid=#{YAHOO_APP_ID}&format=json&select=long"
    JSON.load(Net::HTTP.get(host, path) || "")
  rescue JSON::ParserError
    nil
  end
  
  def self.json_place(json)
    (json && json["place"]) || []
  end

  def self.json_places(json)
    (json && json["places"] && json["places"]["place"]) || []
  end
  
  def self.urlescape(s)
    Merb::Parse.escape(s)
  end
  
end
