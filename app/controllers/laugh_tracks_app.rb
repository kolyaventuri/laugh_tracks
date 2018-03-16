# Defines our comedian list app
class LaughTracksApp < Sinatra::Base
  get '/comedians' do
    @comedians = if params[:age].nil?
                   Comedian.all
                 else
                   Comedian.where(age: params[:age])
                 end

    erb :comedians
  end
end
