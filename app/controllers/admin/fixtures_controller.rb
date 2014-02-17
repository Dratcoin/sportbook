# encoding: utf-8

class Admin::FixturesController < Admin::BaseController

  def index
  end

  def create
    event = Event.find( params[:event_id] )
    text  = params[:text]

    puts "[FixturesController] event_id=#{params[:event_id]}, event.key=#{event.key}"
    puts "   text=#{text}"

    reader = SportDB::Reader.new
    reader.load_fixtures_from_string( event.key, text )
    
    render :text => "done; hello fixtures for event #{event.key}  >>#{text}<<"
  end
  
end
