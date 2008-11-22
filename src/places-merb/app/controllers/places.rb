class Places < Application
  # provides :xml, :yaml, :js

  def index
    @places = Place.all
    display @places
  end

  def show(id)
    @place = Place.get(id)
    raise NotFound unless @place
    display @place
  end

  def new
    only_provides :html
    @place = Place.new
    display @place
  end

  def edit(id)
    only_provides :html
    @place = Place.get(id)
    raise NotFound unless @place
    display @place
  end

  def create(place)
    @place = Place.new(place)
    if @place.save
      redirect resource(@place), :message => {:notice => "Place was successfully created"}
    else
      message[:error] = "Place failed to be created"
      render :new
    end
  end

  def update(id, place)
    @place = Place.get(id)
    raise NotFound unless @place
    if @place.update_attributes(place)
       redirect resource(@place)
    else
      display @place, :edit
    end
  end

  def destroy(id)
    @place = Place.get(id)
    raise NotFound unless @place
    if @place.destroy
      redirect resource(:places)
    else
      raise InternalServerError
    end
  end

end # Places
